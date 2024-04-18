from django.db import models
from django.contrib.auth.models import User



class Conversation ( models.Model):
  user1 = models.ForeignKey(User, on_delete=models.CASCADE,related_name="user1")
  user2 = models.ForeignKey(User, on_delete=models.CASCADE, related_name="user2")
  last_message = models.ForeignKey("Message", on_delete=models.SET_NULL, null =True, blank= True, related_name="last_msg_conversation")

  def __str__(self) -> str:
    return f'Conversation: {self.user1} and {self.user2}'



class Message (models.Model):
  conversation = models.ForeignKey(Conversation, on_delete=models.CASCADE)
  sender = models.ForeignKey(User, on_delete=models.CASCADE, related_name='sender')
  content = models.TextField(null=False)
  timestamp = models.DateTimeField( auto_now_add=True)

  def __str__(self) -> str:
    return f'{self.sender.username} - {self.timestamp}'
  