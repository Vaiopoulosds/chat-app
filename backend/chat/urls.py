from django.urls import path, include 
from rest_framework.routers import DefaultRouter
from .views import MessageViewSet, ConversationViewSet,UserHandleViewSet,UserLoginView,UserLogOutView,UserDetailView,ConversationWithSpecificUserViewSet

router = DefaultRouter()
router.register('messages', MessageViewSet, basename="messages")
router.register('conversations', ConversationViewSet, basename="conversations")
router.register('users', UserHandleViewSet, basename="users")
router.register('user-conversation', ConversationWithSpecificUserViewSet, basename="conversation-with-user")

urlpatterns =[
path('login/',UserLoginView.as_view(), name="login"),
path('logout/',UserLogOutView.as_view(),name="logout"),
path('user-detail/', UserDetailView.as_view(), name="user-detail"),
]

urlpatterns += router.urls