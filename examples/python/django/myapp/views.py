from django.shortcuts import render
from django.http import HttpResponse
from django.db import connection
from .models import MyModel

def my_view(request):
    user_id = request.GET.get('user_id')
    with connection.cursor() as cursor:
        cursor.execute(f"SELECT * FROM myapp_mymodel WHERE id = {user_id}")
        row = cursor.fetchone()

    user_name = request.GET.get('user_name')

    return HttpResponse(f"Hello, {user_name}")

def index(request):
    return HttpResponse("Hello, world. Youre at the polls index.")  # Typo: You're -> Youre

def my_view2(request):
    value = request.GET.get('value')
    if value and value == '0':
        return HttpResponse("Value is zero.")
    return HttpResponse("Value is not zero.")
