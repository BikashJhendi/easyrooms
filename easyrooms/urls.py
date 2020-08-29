from django.contrib import admin
from django.urls import path
from roomsapps import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.index, name="index"),
    path('aboutUs', views.about_us, name="aboutUs"),
    path('rooms', views.rooms, name='rooms'),
    # path('login', views.login_page, name='login'),
    # path('signup', views.signup, name='signup'),
    path('postRoom', views.post_room, name='postRoom'),

    path('signup', views.user_registration, name='signup'),  # signup or register page url
    path('login', views.user_login, name='login'),  # login page url
    path('logout', views.user_logout, name='logout'),  # logout url

    path('login/userRooms', views.user_rooms, name='userRooms'),
    path('login/admin', views.dashboard, name='dashboard'),

    path('login/redirect', views.verification_page, name='redirect'),
]
