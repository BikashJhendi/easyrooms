from django.contrib import messages
from django.shortcuts import render, redirect
from roomsapps.forms import RegistrationForms
from django.contrib.auth import authenticate, login, logout
from django.urls import reverse
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib import messages


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


def user_rooms(request):
    return render(request, 'users/users_rooms.html')


# users registration Registration views
def user_registration(request):
    form = RegistrationForms()

    if request.POST:
        form = RegistrationForms(request.POST)
        if form.is_valid():
            form.save()
            user = form.cleaned_data.get('username')
            messages.success(request, 'Account was created. With this username:  ' + user)
            return redirect('login')
    return render(request, 'signup.html', {'form': form})


# login views
def user_login(request):
    context = {}
    if request.method == 'POST':
        email = request.POST.get('user email')
        password = request.POST.get('password')

        user = authenticate(request, email=email, password=password)

        if user is not None:
            login(request, user)
            # return HttpResponse(reversed('userRooms'))
            return redirect('userRooms')

        else:
            messages.info(request, 'Username or Password is incorrect.')

    else:
        return render(request, 'login.html', context)


# user logout views
def user_logout(request):
    logout(request)
    return redirect('login')
