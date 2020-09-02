from django import forms
from django.contrib.auth.forms import UserCreationForm
from roomsapps.models import Rooms, RoomsImage
from account.models import UsersAccount


# Register Forms
class RegistrationForms(UserCreationForm):
    email = forms.EmailField(max_length=60, help_text='Required. Add a valid Email Address')

    class Meta:
        model = UsersAccount
        fields = ("email", "username", "fullName", "contactNo", "password1")
        # fields = '__all__'


class RoomForms(forms.ModelForm):
    class Meta:
        model = Rooms
        fields = ("title", "contactNo", "district", "address", "price", "descriptions", "user")
        # fields = '__all__'


class RoomImagesForm(RoomForms):
    rooms_images = forms.FileField(widget=forms.ClearableFileInput(attrs={'multiple': True}))

    class Meta(RoomForms.Meta):
        fields = RoomForms.Meta.fields + ('rooms_images',)
