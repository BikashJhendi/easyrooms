from django import forms
from roomsapps.models import UserReg


class RegisterForms(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput)

    class Meta:
        model = UserReg
        fields = '__all__'

