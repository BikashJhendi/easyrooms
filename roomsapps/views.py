from django.shortcuts import render, redirect
from roomsapps.forms import RegistrationForms
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib import messages
from .decorators import unauthenticated_user, allowed_users


# Create your views here.
# index.html views
@unauthenticated_user
def index(request):
    return render(request, 'index.html')


# aboutUs.html views
@unauthenticated_user
def about_us(request):
    return render(request, 'aboutUs.html')


# rooms.html views
@unauthenticated_user
def rooms(request):
    return render(request, 'rooms.html')


# login.html views
# def login_page(request):
#     return render(request, 'login.html')


# signup.html views
# def signup(request):
#     return render(request, 'signup.html')


# users Registration views
@unauthenticated_user
def user_registration(request):
    form = RegistrationForms()

    if request.POST:
        form = RegistrationForms(request.POST)
        if form.is_valid():
            form.save()
            user = form.cleaned_data.get('username')
            messages.success(request, 'Account was created successfully. With the username of:  ' + user)
            return redirect('login')
    return render(request, 'signup.html', {'form': form})


# login views
@unauthenticated_user
def user_login(request):
    if request.method == 'POST':
        email = request.POST.get('email')
        password = request.POST.get('password')

        user = authenticate(request, email=email, password=password)

        if user is not None:
            login(request, user)
            return redirect('userRooms')

        else:
            messages.info(request, 'Username or Password is incorrect.')

    context = {}
    return render(request, 'login.html', context)


# user logout views
def user_logout(request):
    logout(request)
    return redirect('login')


#
@login_required(login_url='login')
@allowed_users(allowed_roles=['users'])
def post_room(request):
    return render(request, 'postroom.html')


#
@login_required(login_url='login')
# @allowed_users(allowed_roles=['admins'])
def user_rooms(request):
    return render(request, 'users/users_rooms.html')
