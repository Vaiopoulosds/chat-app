from django.contrib import admin
from . import models

@admin.register(models.Message)
class MessageAdmin(admin.ModelAdmin):
  autocomplete_fields = ['sender']
  list_display = ['sender','timestamp','content']

@admin.register(models.Conversation)
class ConversationAdmin(admin.ModelAdmin):
  list_display= ['user1','user2']