from django import forms
from django.contrib.auth.forms import UserCreationForm

# from roomsapps.models import UserReg
from account.models import UsersAccount


class RegistrationForms(UserCreationForm):
    email = forms.EmailField(max_length=60, help_text='Required. Add a valid Email Address')

    class Meta:
        model = UsersAccount
        fields = ("email", "username", "fullName", "contactNo", "password1")
        # fields = '__all__'
