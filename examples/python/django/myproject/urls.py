from django.contrib import admin
from django.urls import path
from myapp import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.index, name='index'),
    path('my_view/', views.my_view, name='my_view'),
    path('my_view2/', views.my_view2, name='my_view2'),
]
