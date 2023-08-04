import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
import time
import threading

# Use the application default credentials.
cred = credentials.Certificate('uthme-testing-firebase-adminsdk-xnod8-a61d098cbe.json')

firebase_admin.initialize_app(cred)
db = firestore.client()

request_ref = db.collection('requests_responses').document('requests')
response_ref = db.collection('requests_responses').document('responses')

def upload_response(upload_data):
    response_ref.set(
        upload_data
    )

request = request_ref.get()
if (request.to_dict() == {}):
    print("error")
else:
    for key, value in request.to_dict().items():
        print(key, ":", value)
        request_ref.update({key: firestore.DELETE_FIELD})
        threading.Thread(target=upload_response({
            "mathimatika" : 5,
            "prog" : 6
        })).start()
    
        