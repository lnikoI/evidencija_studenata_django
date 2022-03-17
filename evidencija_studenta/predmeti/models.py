from django.db import models
from studenti.models import Studenti

# Create your models here.
class Predmeti(models.Model):
    sifra = models.CharField(max_length=100)
    naziv = models.CharField(max_length=100)
    godina_studija = models.CharField(max_length=10)
    sifra = models.CharField(max_length=100)
    espb = models.FloatField(null=True)
    obavezni_izborni = models.CharField(max_length=20)

class Ocene(models.Model):
    student = models.ForeignKey(Studenti, on_delete=models.CASCADE)
    predmet = models.ForeignKey(Predmeti, on_delete=models.CASCADE)
    ocena = models.IntegerField()
    datum = models.DateField()