from django.urls import path
from . import views

urlpatterns = [
    path('korisnici', views.korisnici, name='korisnici'),
    path('korisnik_novi', views.korisnik_novi, name='korisnik_novi'),
    path('korisnik_izmena/<id>', views.korisnik_izmena, name='korisnik_izmena'),
    path('korisnik_brisanje/<id>', views.korisnik_brisanje, name='korisnik_brisanje'),
]