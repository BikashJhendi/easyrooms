from django.contrib import admin
from django.urls import path
from roomsapps import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.index, name="index"),
    path('aboutUs', views.about_us, name="aboutUs"),
    path('rooms', views.rooms, name='rooms'),
    path('login', views.login, name='login'),
    path('signup', views.signup, name='signup'),
    path('postRoom', views.post_room, name='postRoom'),
    path('createdUser', views.user_registration, name='createNewUsers'),
    path('login/userRooms', views.user_rooms, name='userRooms'),
    path('login/success', views.user_login, name='userLoginSuccess'),  # problem here tomorrow fix up
    path('logout', views.user_logout, name='logout'),
]
