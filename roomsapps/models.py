from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, Group
from account.models import UsersAccount


# add rooms
class Rooms(models.Model):
    id = models.AutoField(auto_created=True, primary_key=True)
    title = models.CharField(max_length=120)
    contactNo = models.CharField(max_length=10)
    district = models.CharField(max_length=120)
    address = models.CharField(max_length=120)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    descriptions = models.CharField(max_length=120)
    # images = models.CharField(upload_to='img/rooms', on_delete=models.CASCADE)
    status = models.CharField(max_length=10, default="review")
    date_post = models.DateTimeField(verbose_name='date posted', auto_now=True)
    user = models.ForeignKey(UsersAccount, on_delete=models.CASCADE)

    class Meta:
        db_table = "rooms_details"




