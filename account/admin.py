from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from account.models import UsersAccount


# Register your models here.
# Displaying the Accounts in the django Admin Page
class AccountAdminDisplay(UserAdmin):
    list_display = ('email', 'username', 'fullName', 'contactNo', 'date_joined', 'last_login', 'is_admin', 'is_staff',
                    'is_user', 'is_active', 'is_superuser')
    search_fields = ('email', 'username')
    readonly_fields = ('date_joined', 'last_login')

    filter_horizontal = ()
    list_filter = ()
    fieldsets = ()


admin.site.register(UsersAccount, AccountAdminDisplay)
