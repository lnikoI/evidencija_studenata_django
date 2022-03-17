from tabnanny import check
from django.shortcuts import render, redirect
from django.contrib.auth.hashers import check_password
from django.http import HttpResponse
from django.contrib.auth import authenticate
from studenti.models import Studenti
from predmeti.models import Predmeti, Ocene
from korisnici.models import Korisnici
from evidencija_studenta.utils import ulogovan, rola
import csv
import ast

# Create your views here.
def login(request):
    if not ulogovan(request):
        if request.method == 'GET':
            return render(request, 'login.html')
        elif request.method == 'POST':
            k_email = request.POST['email']
            korisnik = Korisnici.objects.filter(email=k_email)
            # Ako ne postoji nalog
            if not korisnik:
                return redirect('login')
            else:
                data = korisnik.values()[0]
                if check_password(request.POST['lozinka'], data['password']):
                    korisnik_data = {
                        'id': data['id'],
                        'ime': data['ime'],
                        'prezime': data['prezime'],
                        'email': data['email'],
                        'rola': data['rola'],
                    }

                    request.session['ulogovan_korisnik'] = str(korisnik_data)
                    return redirect('studenti')
                else:
                    return redirect('login')
    else:
        return redirect('studenti')

def logout(request):
    request.session.pop('ulogovan_korisnik', None)
    return redirect('login')

def export(request, tip, id):
    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = "attachment; filename=" + tip + ".csv"
    writer = csv.writer(response)
    if tip == 'studenti' and id == '-1':
        writer.writerow(['broj_indeksa', ' ime', ' ime_roditelja', ' prezime', ' jmbg', ' datum_rodjenja', ' broj_telefona', ' email', ' godina_studija', ' espb', ' prosek_ocena'])
        za_izvoz = Studenti.objects.all().values_list('broj_indeksa', ' ime', ' ime_roditelja', ' prezime', ' jmbg', ' datum_rodjenja', ' broj_telefona', ' email', ' godina_studija', ' espb', ' prosek_ocena')
    if tip == 'predmeti' and id == '-1':
        writer.writerow(['sifra', 'naziv', 'godina_studija', 'espb', 'obavezni_izborni'])
        za_izvoz = Predmeti.objects.all().values_list('sifra', ' naziv', ' godina_studija', ' espb', ' obavezni_izborni')
    if tip == 'korisnici' and id == '-1':
        writer.writerow(['id', 'ime', 'prezime', 'email', 'rola'])
        za_izvoz = Korisnici.objects.all().values_list('id', ' ime', ' prezime', ' email', ' rola')
    if tip == 'student' and id != '-1':
        za_izvoz = []
        ocene = Ocene.objects.select_related('predmet').filter(student_id = id)
        for ocena in ocene:
            oc = []
            oc.append(ocena.datum)
            oc.append(ocena.predmet.naziv)
            oc.append(ocena.predmet.espb)
            oc.append(ocena.ocena)
            za_izvoz.append(oc)
    for izvoz in za_izvoz:
        writer.writerow(izvoz)

    return response