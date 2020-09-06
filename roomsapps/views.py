from django.contrib.auth.models import Group
from django.shortcuts import render, redirect
from django.urls import reverse
from roomsapps.forms import RegistrationForms, RoomForms, RoomImagesForm
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib import messages
from .decorators import unauthenticated_user, allowed_users
# from .models import RoomsImage, Rooms, Rent, UsersAccount
from .models import *


# Create your views here.
# index.html views
@unauthenticated_user
def index(request):
    return render(request, 'index.html')


# rooms.html views
@unauthenticated_user
def rooms(request):
    return render(request, 'rooms.html')


# aboutUs.html views
@unauthenticated_user
def about_us(request):
    return render(request, 'aboutUs.html')


# privacy.html views
@unauthenticated_user
def privacy(request):
    return render(request, 'privacy.html')


# login usersPages rooms  views
@login_required(login_url='login')
@allowed_users(allowed_roles=['userGroup'])
def user_rooms(request):
    show_rooms = Rooms.objects.all()
    ktm_rooms = show_rooms.filter(district='Kathmandu')  # , status='accept')
    bkt_rooms = show_rooms.filter(district='Bhaktapur')
    btw_rooms = show_rooms.filter(district='Butwal')
    pkh_rooms = show_rooms.filter(district='Pokhara')

    context = {'S_rooms': show_rooms, 'ktm_rooms': ktm_rooms, 'bkt_rooms': bkt_rooms, 'btw_rooms': btw_rooms,
               'pkh_rooms': pkh_rooms}
    return render(request, 'usersPages/users_rooms.html', context)


# login usersPages  post room  views
@login_required(login_url='login')
@allowed_users(allowed_roles=['userGroup'])
def post_room(request):
    if request.method == 'POST':
        form = RoomImagesForm(request.POST or None, request.FILES or None)
        files = request.FILES.getlist('rooms_images')
        if form.is_valid():
            user = request.user
            title = form.cleaned_data['title']
            price = form.cleaned_data['price']
            contactNo = form.cleaned_data['contactNo']
            district = form.cleaned_data['district']
            address = form.cleaned_data['address']
            descriptions = form.cleaned_data['descriptions']
            noOfRooms = form.cleaned_data['noOfRooms']
            status = form.cleaned_data['status']
            obj = Rooms.objects.create(user=user, title=title, contactNo=contactNo, district=district,
                                       address=address, price=price, descriptions=descriptions, noOfRooms=noOfRooms,
                                       status=status)

            for f in files:
                RoomsImage.objects.create(rooms=obj, rooms_images=f)
            messages.success(request, "Your post is added for review. We will inform you when it is accepted.")
        else:
            messages.info(request, "Invalid Form!!!")
    return render(request, 'usersPages/post_room.html')


# login usersPages about  views
@login_required(login_url='login')
@allowed_users(allowed_roles=['userGroup'])
def users_about_us(request):
    return render(request, 'usersPages/users_aboutUs.html')


# login usersPages privacy views
@login_required(login_url='login')
@allowed_users(allowed_roles=['userGroup'])
def user_privacy(request):
    return render(request, 'usersPages/users_privacy.html')


# login usersPages about  views
@login_required(login_url='login')
@allowed_users(allowed_roles=['userGroup'])
def user_profile(request):
    users = request.user
    form = RegistrationForms(instance=users)

    rooms = Rooms.objects.all()
    rooms_rent = Rent.objects.all()

    total_room_post = rooms.filter(user=users.id).count()
    total_rented = rooms_rent.filter(user=users.id).count()

    if request.method == 'POST':
        form = RegistrationForms(request.POST, request.FILES, instance=users)
        if form.is_valid():
            form.save()
            return redirect("userProfile")
        else:
            messages.info(request, "Please enter a valid information. Email and Contact No. should be unique."
                                   " And both password should be same.")
            return redirect("userProfile")

    context = {"form": form, 'rooms': rooms, 'total_room_post': total_room_post,
               'total_rented': total_rented}
    return render(request, 'usersPages/user_profile.html', context)


# login usersPages rooms details views
@login_required(login_url='login')
@allowed_users(allowed_roles=['userGroup'])
def user_rooms_details(request):
    return render(request, 'usersPages/rooms_details.html')


# adminPages login dashboard  views
@login_required(login_url='login')
@allowed_users(allowed_roles=['adminGroup'])
def dashboard_admin(request):
    return render(request, 'adminPages/admindashboard.html')


# adminPages login room details views
@login_required(login_url='login')
@allowed_users(allowed_roles=['adminGroup'])
def dashboard_main(request):
    room = Rooms.objects.all()

    total_room = room.count()
    review_left = room.filter(status='review').count()
    total_accepted = room.filter(status='accepted').count()
    total_rejected = room.filter(status='rejected').count()

    review_list = room.filter(status='review')
    accepted_list = room.filter(status='accepted')

    context = {'total_room': total_room, 'review_left': review_left, 'total_rejected': total_rejected,
               'total_accepted': total_accepted, 'review_list': review_list, 'accepted_list': accepted_list}
    return render(request, 'adminPages/maindashboard.html', context)


# adminPages login usersPages details views
@login_required(login_url='login')
@allowed_users(allowed_roles=['adminGroup'])
def dashboard_users(request):
    users = UsersAccount.objects.all()

    total_users = users.count()

    context = {'total_users': total_users, 'users': users}
    return render(request, 'adminPages/userdashboard.html', context)


# adminPages login profile views
@login_required(login_url='login')
@allowed_users(allowed_roles=['adminGroup'])
def admin_profile(request):
    user = request.user
    form = RegistrationForms(instance=user)

    if request.method == 'POST':
        form = RegistrationForms(request.POST, request.FILES, instance=user)
        if form.is_valid():
            form.save()
            return redirect("dashboard")
        else:
            messages.info(request, "Please enter a valid information. Email and Contact No. should be unique."
                                   " And both password should be same.")
            return redirect("dashboardAdminProfile")

    context = {"form": form, 'rooms': rooms}
    return render(request, 'adminPages/admin_profile.html', context)


# usersPages Registration views
@unauthenticated_user
def user_registration(request):
    form = RegistrationForms()

    if request.POST:
        form = RegistrationForms(request.POST)
        if form.is_valid():
            user = form.save()
            username = form.cleaned_data.get('username')

            # setting groups type for currently register users
            group = Group.objects.get(name='userGroup')
            user.groups.add(group)
            ####

            messages.success(request, 'Account was created successfully. With the username of:  ' + username)
            return redirect('login')
    return render(request, 'signup.html', {'form': form})


# login views and verifications
@unauthenticated_user
def user_login(request):
    if request.method == 'POST':
        email = request.POST.get('email')
        password = request.POST.get('password')

        user = authenticate(request, email=email, password=password)

        if user is not None:
            login(request, user)
            return redirect('redirect')
        else:
            messages.info(request, 'Username or Password is incorrect.')

    context = {}
    return render(request, 'login.html', context)


# user logout html views
def user_logout(request):
    logout(request)
    return redirect('login')


# redirecting the usersPages (views)
@login_required(login_url='login')
def verification_page(request):
    group = request.user.groups.filter(user=request.user)[0]
    if group.name == "adminGroup":
        return HttpResponseRedirect(reverse('dashboard'))
    elif group.name == "userGroup":
        return HttpResponseRedirect(reverse('userRooms'))
    else:
        return HttpResponseRedirect(reverse('redirect'))

    context = {}
    return render(request, 'redirect.html', context)


#
@login_required(login_url='login')
def edit_room_status(request, pk):
    get_room_id = Rooms.objects.get(id=pk)

    context = {'get_room_id': get_room_id}
    return render(request, 'adminPages/update_status.html', context)


# # rooms update status page
@login_required(login_url='login')
# @allowed_users(allowed_roles=['adminGroup'])
def update_room_status(request, pk):
    get_room_id = Rooms.objects.get(id=pk)
    update_room = RoomForms(request.POST, instance=get_room_id)

    if request.method == 'POST':
        update_room = RoomForms(request.POST, request.FILES, instance=get_room_id)
        if update_room.is_valid():
            update_room.save()
            return redirect('dashboard')

    context = {'get_room_id': get_room_id, 'update_room': update_room}
    return render(request, 'adminPages/update_status.html', context)
