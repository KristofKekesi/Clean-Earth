import os
import sys
import time
import tweepy
import codecs
import importlib.util

from geopy.geocoders import Nominatim

import firebase_admin
from firebase_admin import credentials, firestore

# possible responses
twitterPing = "{ping} just made {location} cleaner!"
namePing = "{name} just made {location} cleaner!"

# import variables
spec = importlib.util.spec_from_file_location("variables.py", "../../variables.py")
EV = importlib.util.module_from_spec(spec)
spec.loader.exec_module(EV)

# initialize Firebase
cred = credentials.Certificate("../../clean-earth-firebase-adminsdk.json")
firebase_admin.initialize_app(cred)
db = firestore.client()

# initialize Nominatim API
geolocator = Nominatim(user_agent="geoapiExercises")

# twitter auth
auth = tweepy.OAuthHandler(EV.CleanEarthTwitterApiKey, EV.CleanEarthTwitterApiKeySecret)
auth.set_access_token(EV.CleanEarthTwitterApiAccessToken, EV.CleanEarthTwitterApiAccessTokenSecret)

api = tweepy.API(auth, wait_on_rate_limit=True, wait_on_rate_limit_notify=True)


# log function
def log(message):
    file = codecs.open("log.txt", "a", "utf-8")
    print(message, file=file)
    file.close()


# main loop
while True:
    # get data from Firebase
    reposts = db.collection('repost').get()
    for repost in reposts:
        result = repost.to_dict()

        if not result["isReposted"]:
            # setting values
            isAnonymous = result["isAnonymous"]

            latitude = result["at"]["latitude"]
            longitude = result["at"]["longitude"]

            # selecting name to display
            if isAnonymous:
                finalName = "Anonymous"
            elif result["twttr"] != None:
                finalName = "@" + api.get_user("1177222040161529858").screen_name
            else:
                log("invalid Firebase Documentum: " + repost.id)
                finalName = "Someone"

            # locating city
            refinedLocation = geolocator.reverse(str(latitude) + "," + str(longitude))
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
                log(serializedLocation)

            if isLocationResultDone:
                # posting on Twitter
                finalStatus = namePing
                finalStatus = finalStatus.replace("{location}", locationResult)
                finalStatus = finalStatus.replace("{name}", finalName)

                print(finalStatus)
                #api.update_status(finalStatus)

                # set isReposted to true
                db.collection("repost").document(repost.id).update({"isReposted": True})

    time.sleep(900)  # wait for 15 minutes
