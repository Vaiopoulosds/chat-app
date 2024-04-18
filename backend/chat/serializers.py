from django.forms import ValidationError
from rest_framework import serializers
from .models import Message,Conversation
from django.contrib.auth import get_user_model, authenticate

UserModel = get_user_model()


class ConversationSerializer(serializers.ModelSerializer):
  class Meta:
    model = Conversation
    fields = ['user1','user2','last_message']


class MessageSerializer(serializers.ModelSerializer):
  class Meta:
    model= Message
    fields = ['id','conversation','sender','content','timestamp']

class UserSerializer(serializers.ModelSerializer):

  class Meta:
    model = UserModel
    fields ="__all__"
    
class UserLoginSerializer(serializers.ModelSerializer):
  username = serializers.CharField()
  password = serializers.CharField()
  class Meta:
    model = UserModel
    fields = ("username","password")


  def check_user(self, data):
    user = authenticate(username= data['username'], password= data['password'])
    if not user :
      raise ValidationError("User not found")
    return user

