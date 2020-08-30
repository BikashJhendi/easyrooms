# Generated by Django 3.0.3 on 2020-08-30 12:57

from django.db import migrations


class Migration(migrations.Migration):
    dependencies = [
        ('account', '0001_initial'),
    ]

    operations = [
        # adding group name
        migrations.RunSQL("insert into auth_group(name) values('adminGroup'), ('userGroup')"),

        # --- **** FOR ADMIN LOGIN **** (Email id: admin@gmail.com, Password: admin ---  #
        migrations.RunSQL("insert into account_usersaccount"
                          "(id, password, email, username, date_joined, last_login, is_admin, is_active, "
                          "is_staff, is_superuser, is_user, fullName, contactNo) "
                          "values(NULL, "
                          "'pbkdf2_sha256$180000$EPOXknRwo9Ea$4dGEdcn4Vbfa1X7I2vUnD3oIDkIvvBWwyDbCoCNWOzw=', "
                          "'admin@gmail.com', 'admin', '', '', '1', '1', '1', '1', '1',"
                          " 'admin', '1234567890')"),


        # ---  *** FOR USER LOGIN *** (Email id: user@gmail.com, Password: user ---  #
        migrations.RunSQL("insert into account_usersaccount"
                          "(id, password, email, username, date_joined, last_login, is_admin, is_active, "
                          "is_staff, is_superuser, is_user, fullName, contactNo) "
                          "values(NULL,"
                          " 'pbkdf2_sha256$180000$ojEwfcE9oQj5$oSE6HNSjQStmQxU+iR8PGWclvokDHYTM4tfskU+hOEs=',"
                          " 'user@gmail.com', 'user', '', '', '0', '1', '0', '0', '1', "
                          " 'user', '9874561230')"),
    ]