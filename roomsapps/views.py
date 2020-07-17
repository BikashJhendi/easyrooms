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

