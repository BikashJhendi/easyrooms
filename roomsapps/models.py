from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, Group
from account.models import UsersAccount


# add rooms
class Rooms(models.Model):
    STATUS = (
        ('review', 'review'),
        ('accept', 'accept'),
        ('reject', 'reject')
    )

    title = models.CharField(max_length=120)
    contactNo = models.CharField(max_length=10)
    district = models.CharField(max_length=120)
    address = models.CharField(max_length=120)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    descriptions = models.CharField(max_length=120)
    # rooms_images = models.ImageField(blank=True)
    status = models.CharField(max_length=10, default="review", choices=STATUS)
    date_post = models.DateTimeField(verbose_name='date posted', auto_now=True)
    user = models.ForeignKey(UsersAccount, on_delete=models.CASCADE)

    def __str__(self):
        return self.title


class RoomsImage(models.Model):
    rooms = models.ForeignKey(Rooms, on_delete=models.CASCADE)
    rooms_images = models.ImageField(upload_to='rooms_photo/', null=True, blank=True)

    def __str__(self):
        return self.rooms.title


class Rent(models.Model):
    ROOM_STAT = (
        ('pending', 'pending'),
        ('accept', 'accept request'),
        ('reject', 'reject request'),
    )

    room = models.ForeignKey(Rooms, on_delete=models.CASCADE, null=True)
    user = models.ForeignKey(UsersAccount, on_delete=models.CASCADE, null=True)
    room_status = models.CharField(max_length=120, default="pending", choices=ROOM_STAT, null=True)
    date_rent = models.DateTimeField(verbose_name='date rent', auto_now=True, null=True)

    def __str__(self):
        return self.room
