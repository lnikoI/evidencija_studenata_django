from django.urls import path
from . import views

urlpatterns = [
    path('predmeti', views.predmeti, name='predmeti'),
    path('predmet_novi', views.predmet_novi, name='predmet_novi'),
    path('predmet_izmena/<id>', views.predmet_izmena, name='predmet_izmena'),
    path('predmet_brisanje/<id>', views.predmet_brisanje, name='predmet_brisanje'),
    path('ocena_nova/<id>', views.ocena_nova, name='ocena_nova'),
    path('ocena_brisanje/<id>', views.ocena_brisanje, name='ocena_brisanje'),
]