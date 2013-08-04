from django.shortcuts import render


def home(request):
    return render(request, 'index.html')


def why_skydive(request):
    return render(request, 'why_skydive.html', {
        'title': 'Why skydive?'
    })


def learn_to_skydive(request):
    return render(request, 'learn_to_skydive.html', {
        'title': 'Learning to skydive'
    })


def contact_us(request):
    return render(request, 'contact_us.html', {
        'title': 'Contact us'
    })