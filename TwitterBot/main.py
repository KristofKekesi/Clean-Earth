import os
import sys
import tweepy
import codecs

from geopy.geocoders import Nominatim

# import variables
import importlib.util
spec = importlib.util.spec_from_file_location("variables.py", "../../variables.py")
EV = importlib.util.module_from_spec(spec)
spec.loader.exec_module(EV)

print(EV.CleanEarthTwitterApiKey)
print(EV.CleanEarthTwitterApiKeySecret)

# possibles
twitterPing = "{ping} just made {location} cleaner!"
namePing = "{name} just made {location} cleaner!"

# initialize Nominatim API
geolocator = Nominatim(user_agent="geoapiExercises")

# twitter auth
auth = tweepy.OAuthHandler(EV.CleanEarthTwitterApiKey, EV.CleanEarthTwitterApiKeySecret)
auth.set_access_token(EV.CleanEarthTwitterApiAccessToken, EV.CleanEarthTwitterApiAccessTokenSecret)

api = tweepy.API(auth, wait_on_rate_limit=True, wait_on_rate_limit_notify=True)

# future main loop

location = "47.209645,18.638601"
latitude = float(location.split(",")[0])
longitude = float(location.split(",")[1])

refinedLocation = geolocator.reverse(str(latitude)+","+str(longitude))
serializedLocation = refinedLocation.raw["address"]

isLocationResultDone = False
locationResult = None
if "city" in serializedLocation:
    locationResult = serializedLocation["city"]
    isLocationResultDone = True
elif "town" in serializedLocation:
    locationResult = serializedLocation["town"]
    isLocationResultDone = True
elif "farm" in serializedLocation:
    locationResult = serializedLocation["farm"]
    isLocationResultDone = True
else:
    file = codecs.open("log.txt", "a", "utf-8")
    print(serializedLocation, file=file)
    file.close()

if isLocationResultDone:
    finalStatus = namePing
    finalStatus = finalStatus.replace("{location}", locationResult)
    print(finalStatus)
    api.update_status(finalStatus)