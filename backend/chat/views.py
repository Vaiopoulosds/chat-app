from rest_framework import permissions, status
from rest_framework.viewsets import ModelViewSet
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.authentication import SessionAuthentication
from rest_framework.decorators import action,authentication_classes
from django.contrib.auth import get_user_model, login,logout
from django.db.models import Q
from .models import Message, Conversation
from .serializers import MessageSerializer, ConversationSerializer, UserSerializer,UserLoginSerializer

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

  @action(detail=True, methods=["GET","PUT","DELETE"], permission_classes = [permissions.IsAuthenticated])
  def me(self,request):
    user = UserModel.objects.get(user_id = request.user.id)
    if request.method == 'GET':
      serializer = UserSerializer(user)
      return Response(serializer.data)
    elif request.method =="PUT":
      serializer = UserSerializer(user, data=request.data)
      serializer.is_valid(raise_exception=True)
      serializer.save()
      return Response(serializer.data)
    elif request.method == "DELETE":
      instance = self.get_object()
      self.perform_destroy(instance)
      return Response(status=status.HTTP_204_NO_CONTENT)
      


class UserLoginView(APIView):
  permission_classes = (permissions.AllowAny,)
  authentication_classes= (SessionAuthentication,)
  
  def post(self,request):
    data = request.data
    serializer = UserLoginSerializer(data=data)
    if serializer.is_valid(raise_exception=True):
      user = serializer.check_user(data)
      login(request,user)
      return Response(serializer.data,status= status.HTTP_200_OK)
    
  
class UserLogOutView(APIView):
  
  def post(self,request):
    logout(request)
    return Response(status=status.HTTP_200_OK)