from django.shortcuts import render, redirect


# Create your views here.
# index.html page
def index(request):
    return render(request, 'index.html')


# aboutUs.html page
def about_us(request):
    return render(request, 'aboutUs.html')


