from django.forms import ValidationError
from rest_framework import serializers
from .models import Message,Conversation
from django.contrib.auth import get_user_model, authenticate

UserModel = get_user_model()

class UserSerializer(serializers.ModelSerializer):
  password = serializers.CharField(write_only=True)
  class Meta:
    model = UserModel
    fields =['id','password','username','first_name','last_name','email']
  def create(self, validated_data):
    user = UserModel.objects.create(username=validated_data['username'],
                                    email= validated_data['email'],
                                    first_name=validated_data['first_name'],
                                    last_name= validated_data['last_name']
                                    )
    user.set_password(validated_data['password'])
    user.save()
    return user

class ConversationSerializer(serializers.ModelSerializer):
  user1 = UserSerializer()
  user2 = UserSerializer()
  class Meta:
    model = Conversation
    fields = ['id','user1','user2','last_message']


class MessageSerializer(serializers.ModelSerializer):
  class Meta:
    model= Message
    fields = ['id','conversation','sender','content','timestamp']

    
class UserLoginSerializer(serializers.ModelSerializer):
  username = serializers.CharField()
  password = serializers.CharField()
  class Meta:
    model = UserModel
    fields = ["username","password"]


  def check_user(self, data):
    user = authenticate(username= data['username'], password= data['password'])
    if not user :
      raise ValidationError("User not found")
    return (user)

