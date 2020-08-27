from django.shortcuts import render, redirect
from roomsapps.forms import RegisterForms
from roomsapps.models import UserReg


# Create your views here.
# index.html views
def index(request):
    return render(request, 'index.html')


# aboutUs.html views
def about_us(request):
    return render(request, 'aboutUs.html')


# rooms.html views
def rooms(request):
    return render(request, 'rooms.html')


# login.html views
def login(request):
    return render(request, 'login.html')


# signup.html views
def signup(request):
    return render(request, 'signup.html')


def post_room(request):
    return render(request, 'postroom.html')


def register(request):
    if request.method == "POST":
        form = RegisterForms(request.POST, request.FILES)
        form.save()
        print('Register Successful')
        return render(request, 'login.html')
    form = RegisterForms()
    return render(request, 'signup.html', {'form': form})


