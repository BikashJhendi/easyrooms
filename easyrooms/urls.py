from django.contrib import admin
from django.urls import path
from roomsapps import views

from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.index, name="index"),
    path('aboutUs', views.about_us, name="aboutUs"),
    path('rooms', views.rooms, name='rooms'),
    path('privacy', views.privacy, name='privacy'),

    path('signup', views.user_registration, name='signup'),  # signup or register page url
    path('login', views.user_login, name='login'),  # login page url
    path('logout', views.user_logout, name='logout'),  # logout url

    # users pages url
    path('login/user/rooms', views.user_rooms, name='userRooms'),
    path('login/user/about_us', views.users_about_us, name='userAboutUS'),
    path('login/user/post_room', views.post_room, name='postRoom'),
    path('login/user/profile', views.user_profile, name='userProfile'),
    path('login/user/room/details', views.user_rooms_details, name='userRoomDetails'),
    path('login/user/room/privacy', views.user_privacy, name='userPrivacy'),
    path('login/redirect', views.verification_page, name='redirect'),

    # admin pages url
    path('login/dashboard/admin', views.dashboard_admin, name='dashboardAdmin'),
    path('login/dashboard/main', views.dashboard_main, name='dashboard'),
    path('login/dashboard/users', views.dashboard_users, name='dashboardUsers'),
    path('login/dashboard/admin/profile', views.admin_profile, name='dashboardAdminProfile'),
    path('login/dashboard/rooms/updateStatus', views.update_rooom_status, name='dashboardRoomsUpdate'),
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
