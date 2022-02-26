from lib2to3.pgen2 import token
from pyfcm import FCMNotification

ANDROID_API_KEY = 'AIzaSyBeMdTgppOgEyn5UAN00MAA2lEgL4E4vvY'

SERVER_KEYS = ['AAAA-_B-JEI:APA91bHIsUpMt9CwN0ZizYpX9k5-RzTY4_RbwI4pGkTJQelP738X7kCb0-_a8I5Sc84fKLbW9MF0qlRH4mgV7raSwHWDG8wQNsvmce7vt7IwueFIOnwRR8lbmUV9vtuzJisobkHPJZwM',
               'AAAA-_B-JEI:APA91bGTzkC8n_fsX0NuoQY5p7xY4iDzhOXmmKuX1Fr6Mtwbnl3CZNPle-8S17Bs-v3leYrjMesUl4Xy8FdZVVsYkHQI5k-6Dspd1XtUVtfwiliNTiXQu4EuAAp6_bYK0BY6oCl0OLND']

push_service = FCMNotification(SERVER_KEYS[1])

message = "Bhaven Kumar Jain has commented on your post in MECT-General"
mtile = "New notification in MECT-General"

extra_notification_kwargs = {
    'image':  "https://upload.wikimedia.org/wikipedia/commons/thumb/4/43/Bonnet_macaque_%28Macaca_radiata%29_Photograph_By_Shantanu_Kuveskar.jpg/220px-Bonnet_macaque_%28Macaca_radiata%29_Photograph_By_Shantanu_Kuveskar.jpg "
}
result = push_service.notify_topic_subscribers(
    topic_name="test", message_title=mtile, message_body=message, click_action="FLUTTER_NOTIFICATION_CLICK", color="red")

print(result)
print("sent")
