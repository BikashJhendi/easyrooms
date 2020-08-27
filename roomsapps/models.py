from django.db import models


# Create your models here.
class UserReg(models.Model):
    fullName = models.CharField(max_length=120)
    email = models.EmailField()
    contactNo = models.CharField(max_length=10)
    password = models.CharField(max_length=100)
    is_admin = models.CharField(max_length=5, default='False', editable=False)
    is_user = models.CharField(max_length=5, default='True', editable=False)

    class Meta:
        db_table = "users_details"

