from django.urls import path
from .views import hello_view

app_name = 'main'

urlpatterns = [
    path('', hello_view, name='hello'),
]
