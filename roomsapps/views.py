from django.shortcuts import render, redirect


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
