import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
import time

# Use the application default credentials.
cred = credentials.Certificate('uthme-testing-firebase-adminsdk-xnod8-a61d098cbe.json')

firebase_admin.initialize_app(cred)
db = firestore.client()

request_ref = db.collection('requests_responses').document('requests')

request_ref.set(
    {
        "giannis" : "grades",
        "john" : "mesos_oros"
    }
)