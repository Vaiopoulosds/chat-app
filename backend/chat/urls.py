from django.urls import path, include 
from rest_framework.routers import DefaultRouter
from .views import MessageViewSet, ConversationViewSet,UserHandleViewSet,UserLoginView,UserLogOutView

router = DefaultRouter()
router.register('messages', MessageViewSet)
router.register('conversations', ConversationViewSet)
router.register('users', UserHandleViewSet)

urlpatterns =[
path('login/',UserLoginView.as_view(), name="login"),
path('logout/',UserLogOutView.as_view(),name="logout")
]

urlpatterns += router.urls