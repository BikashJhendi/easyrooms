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
    path('rooms/details/<slug:id>', views.room_details, name='roomsDetails'),

    path('signup', views.user_registration, name='signup'),  # signup or register page url
    path('login', views.user_login, name='login'),  # login page url
    path('logout', views.user_logout, name='logout'),  # logout url

    # users pages url
    path('login/user/rooms', views.user_rooms, name='userRooms'),
    path('login/user/about_us', views.users_about_us, name='userAboutUS'),
    path('login/user/post_room', views.post_room, name='postRoom'),
    path('login/user/profile', views.user_profile, name='userProfile'),
    path('login/user/room/details/<str:id>', views.user_rooms_details, name='userRoomDetails'),
    path('login/user/room/details/rent/', views.rent_room, name='rentSuccess'),
    path('login/user/room/privacy', views.user_privacy, name='userPrivacy'),
    path('login/redirect', views.verification_page, name='redirect'),

    # admin pages url
    path('login/dashboard/main', views.dashboard_main, name='dashboard'),
    path('login/dashboard/users', views.dashboard_users, name='dashboardUsers'),
    path('login/dashboard/admin/profile', views.admin_profile, name='dashboardAdminProfile'),
    path('login/dashboard/rooms/edit/<slug:pk>', views.edit_room_status, name='dashboardRoomsEdit'),
    path('login/dashboard/rooms/updateStatus/<slug:pk>', views.update_room_status, name='dashboardRoomsUpdate'),
    path('login/dashboard/rooms/delete/<slug:pk>', views.delete_rooms, name='dashboardRoomsDelete'),
    path('login/dashboard/rooms/rented/view/<slug:pk>', views.rented_status, name='rentedStatusView'),
    path('login/dashboard/rooms/rented/update/<slug:pk>', views.update_rented_status, name='rentedStatusUpdate'),
    path('login/dashboard/rooms/rented/delete/<slug:pk>', views.delete_rent_room, name='deleteRentedRoom'),
]


urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
