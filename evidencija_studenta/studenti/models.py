from typing import List
from django.db import models
from django.forms import DateField

from django.views.generic import ListView

# Create your models here.
class Studenti(models.Model):
    ime = models.CharField(max_length=100)
    ime_roditelja = models.CharField(max_length=100)
    prezime = models.CharField(max_length=100)
    jmbg = models.BigIntegerField()
    datum_rodjenja = models.DateField()
    broj_telefona = models.CharField(max_length=50)
    email = models.EmailField(max_length=254)
    broj_indeksa = models.CharField(max_length=10)
    godina_studija = models.CharField(max_length=10)
    slika = models.ImageField(upload_to="pics", height_field=None, width_field=None, max_length=100)
    espb = models.FloatField(null=True, default=0.0)
    prosek_ocena = models.FloatField(null=True, default=0.0)
