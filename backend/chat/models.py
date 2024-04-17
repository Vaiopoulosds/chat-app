from django.db import models
from django.contrib.auth.models import User


class Message (models.Model):
  sender = models.ForeignKey(User, on_delete=models.CASCADE)
  content = models.TextField(null=False)
  timestamp = models.DateTimeField( auto_now_add=True)

  def __str__(self) -> str:
    return f'{self.sender.username} - {self.timestamp}'