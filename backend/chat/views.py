from rest_framework import permissions, status
from rest_framework.viewsets import ModelViewSet , GenericViewSet ,mixins
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.authentication import SessionAuthentication
from rest_framework.decorators import action,authentication_classes
from django.contrib.auth import get_user_model, login,logout
from django.db.models import Q
from .models import Message, Conversation
from .serializers import MessageSerializer, ConversationSerializer, UserSerializer,UserLoginSerializer
import json

UserModel = get_user_model()


class ConversationViewSet(ModelViewSet):
  serializer_class = ConversationSerializer

  def get_queryset(self):
    user = self.request.user
    return Conversation.objects.filter(Q(user1__id =user.id) | Q(user2__id = user.id))
  
class MessageViewSet(ModelViewSet):
  serializer_class = MessageSerializer

  def get_queryset(self):
    user = self.request.user
    conversations = Conversation.objects.filter(Q(user1__id =user.id) | Q(user2__id = user.id))
    return Message.objects.filter(conversation__in =conversations)

class UserHandleViewSet(ModelViewSet):
  queryset = UserModel.objects.all()
  serializer_class= UserSerializer
  permission_classes = [permissions.IsAuthenticated]

class UserDetailView(APIView):
  def get(self, request):
    serializer= UserSerializer(request.user)
    return Response(serializer.data, status= status.HTTP_200_OK)

class UserLoginView(APIView):
  permission_classes = (permissions.AllowAny,)
  authentication_classes= (SessionAuthentication,)
  
  def post(self,request):
    serializer = UserLoginSerializer(data= request.data)
    if serializer.is_valid(raise_exception=True):
      user = serializer.check_user(request.data)
      login(request,user)
      serializer = UserSerializer(request.user)
      return Response(serializer.data,status= status.HTTP_200_OK)
    
  
class UserLogOutView(APIView):
  
  def post(self,request):
    logout(request)
    return Response(status=status.HTTP_200_OK)