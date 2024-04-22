This is a full stack app using django-rest-framework as back-end and react as front-end.
In this app you will find a fully functional chat application. You can register, login and have access to the chat.
At the backend we have django-rest-framework to server API endpoints so that we can have a database (mysql) that stores all the data.
  That gives us the ability to serve the data as a form of conversation history to the user. 
At the frontend we have react building the UI plus using react-query so that we have quick responses from the server ( invalidating the queries/ short refetching intervals).
The app contains dockerfiles so you can run it at a docker container.
