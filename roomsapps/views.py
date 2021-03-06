from itertools import starmap

from django.contrib.auth.models import Group
from django.shortcuts import render, redirect
from django.urls import reverse
from roomsapps.forms import RegistrationForms, RoomForms, RoomImagesForm, RentForm
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib import messages
from .decorators import unauthenticated_user, allowed_users
from .models import *
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger


# Create your views here.
# index.html views
@unauthenticated_user
def index(request):
    room = Rooms.objects.all()

    show = room.filter(status='accepted')
    count_bkt = room.filter(district='Bhaktapur').count()
    count_ktm = room.filter(district='Kathmandu').count()
    count_btw = room.filter(district='Butwal').count()
    count_pkh = room.filter(district='Pokhara').count()

    context = {'room': room, 'count_bkt': count_bkt, 'count_ktm': count_ktm, 'count_btw': count_btw,
               'count_pkh': count_pkh, 'show': show}
    return render(request, 'index.html', context)


# rooms.html views
@unauthenticated_user
def rooms(request):
    room_list = Rooms.objects.all()

    ktm_rooms = room_list.filter(district='Kathmandu', status='accepted')
    bkt_rooms = room_list.filter(district='Bhaktapur', status='accepted')
    btw_rooms = room_list.filter(district='Butwal', status='accepted')
    pkh_rooms = room_list.filter(district='Pokhara', status='accepted')

    context = {'room_list': room_list, 'ktm_rooms': ktm_rooms, 'bkt_rooms': bkt_rooms, 'btw_rooms': btw_rooms,
               'pkh_rooms': pkh_rooms}
    return render(request, 'rooms.html', context)


@unauthenticated_user
def room_details(request, id):
    room = Rooms.objects.filter(id=id)
    imgs = RoomsImage.objects.filter(rooms_id=id)

    context = {'imgs': imgs, 'room': room}
    return render(request, 'room_details_home.html', context)


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
    # ktm_img = {}

    ktm = show_rooms.filter(district='Kathmandu', status='accepted')
    # for ktm in ktm_rooms:
    #     ktm_img[ktm.id] = RoomsImage.objects.filter(rooms_id=ktm.id).first()

    bkt = show_rooms.filter(district='Bhaktapur', status='accepted')
    btw = show_rooms.filter(district='Butwal', status='accepted')
    pkh = show_rooms.filter(district='Pokhara', status='accepted')

    context = {'show_rooms': show_rooms, 'ktm_rooms': ktm, 'bkt_rooms': bkt, 'btw_rooms': btw,
               'pkh': pkh}
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
            image = files[0]
            obj = Rooms.objects.create(user=user, title=title, contactNo=contactNo, district=district,
                                       address=address, price=price, descriptions=descriptions, noOfRooms=noOfRooms,
                                       status=status, image=image)

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
# @allowed_users(allowed_roles=['userGroup'])
def user_rooms_details(request, id):
    room = Rooms.objects.filter(id=id)
    imgs = RoomsImage.objects.filter(rooms_id=id)
    user = request.user

    context = {'imgs': imgs, 'room': room, 'user': user}
    return render(request, 'usersPages/rooms_details.html', context)


@login_required(login_url='login')
@allowed_users(allowed_roles=['userGroup'])
def rent_room(request):
    form = RentForm()
    if request.method == 'POST':
        form = RentForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('userRooms')
        else:
            print('Invalid!!!')
            return redirect('roomsDetails')

    context = {'form': form}
    return render(request, 'usersPages/rent_sucess.html', context)


# adminPages login room details views
@login_required(login_url='login')
@allowed_users(allowed_roles=['adminGroup'])
def dashboard_main(request):
    room = Rooms.objects.all()
    rent = Rent.objects.all()
    page = request.GET.get('page', 1)

    paginator = Paginator(rent, 5)
    try:
        rent = paginator.page(page)
    except PageNotAnInteger:
        rent = paginator.page(1)
    except EmptyPage:
        rent = paginator.page(paginator.num_pages)

    total_room = room.count()
    review_left = room.filter(status='review').count()
    total_accepted = room.filter(status='accepted').count()
    total_rejected = room.filter(status='rejected').count()

    review_list = room.filter(status='review')
    page = request.GET.get('page', 1)

    paginator = Paginator(review_list, 5)
    try:
        review_list = paginator.page(page)
    except PageNotAnInteger:
        review_list = paginator.page(1)
    except EmptyPage:
        review_list = paginator.page(paginator.num_pages)

    accepted_list = room.filter(status='accepted')
    page = request.GET.get('page', 1)

    paginator = Paginator(accepted_list, 5)
    try:
        accepted_list = paginator.page(page)
    except PageNotAnInteger:
        accepted_list = paginator.page(1)
    except EmptyPage:
        accepted_list = paginator.page(paginator.num_pages)

    rejected_list = room.filter(status='rejected')
    page = request.GET.get('page', 1)

    paginator = Paginator(rejected_list, 5)
    try:
        rejected_list = paginator.page(page)
    except PageNotAnInteger:
        rejected_list = paginator.page(1)
    except EmptyPage:
        rejected_list = paginator.page(paginator.num_pages)

    context = {'total_room': total_room, 'review_left': review_left, 'total_rejected': total_rejected,
               'total_accepted': total_accepted, 'review_list': review_list, 'accepted_list': accepted_list,
               'rejected_list': rejected_list, 'rent': rent}
    return render(request, 'adminPages/maindashboard.html', context)


# adminPages login usersPages details views
@login_required(login_url='login')
@allowed_users(allowed_roles=['adminGroup'])
def dashboard_users(request):
    users = UsersAccount.objects.all()
    page = request.GET.get('page', 1)

    paginator = Paginator(users, 10)
    try:
        users = paginator.page(page)
    except PageNotAnInteger:
        users = paginator.page(1)
    except EmptyPage:
        users = paginator.page(paginator.num_pages)

    context = {'users': users}
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
# @allowed_users(allowed_roles=['adminGroup'])
def edit_room_status(request, pk):
    get_room_id = Rooms.objects.get(id=pk)

    context = {'get_room_id': get_room_id}
    return render(request, 'adminPages/update_status.html', context)


#
@login_required(login_url='login')
def delete_rooms(request, pk):
    get_room_id = Rooms.objects.get(id=pk)
    if request.method == 'POST':
        get_room_id.delete()
        return redirect('dashboard')

    context = {'get_room_id': get_room_id}
    return render(request, 'adminPages/delete_rooms.html', context)


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


#
@login_required(login_url='login')
# @allowed_users(allowed_roles=['adminGroup'])
def rented_status(request, pk):
    rent = Rent.objects.get(id=pk)

    context = {'rent': rent}
    return render(request, 'adminPages/rented_room_status.html', context)


# rented status
@login_required(login_url='login')
# @allowed_users(allowed_roles=['adminGroup'])
def update_rented_status(request, pk):
    rent = Rent.objects.get(id=pk)
    update_status = RentForm(request.POST, instance=rent)

    if request.method == 'POST':
        update_status = RentForm(request.POST, request.FILES, instance=rent)
        if update_status.is_valid():
            update_status.save()
            return redirect('dashboard')

    context = {'rent': rent, 'update_status': update_status}
    return render(request, 'adminPages/rented_room_status.html', context)


#
@login_required(login_url='login')
def delete_rent_room(request, pk):
    rent = Rent.objects.get(id=pk)
    if request.method == 'POST':
        rent.delete()
        return redirect('dashboard')

    context = {'rent': rent}
    return render(request, 'adminPages/delete_rented_room.html', context)
