from django.shortcuts import render


def home(request):
    return render(request, 'index.html')


def why_skydive(request):
    return render(request, 'index.html')


def learn_to_skydive(request):
    return render(request, 'index.html')


def contact_us(request):
    return render(request, 'index.html')