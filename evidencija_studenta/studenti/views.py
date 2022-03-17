from django.shortcuts import render, redirect
from django.contrib.auth.hashers import make_password
from django.core.paginator import Paginator
from django.db import connection
from django.contrib import messages
from .models import Studenti
from korisnici.models import Korisnici
from predmeti.models import Predmeti, Ocene
from evidencija_studenta.utils import ulogovan, rola, getID
import ast

#Paginacija
br_prikaza = 5

# Create your views here.
def studenti(request):
    if rola(request) == 'student':
        id = getID(request)
        return redirect('student', id)
    elif ulogovan(request):
        #Studenti fetch
        studenti = Studenti.objects.all()
        #Pretraga i filtriranje
        order_type = 'asc'
        order_by = 'id'
        args = request.GET.dict() # .values() i .dict()
        #rastuca opadajuca
        if 'order_by' in args:
            order_by = args['order_by']
            if 'prethodni_order_by' in args and args['prethodni_order_by'] == args['order_by']:
                if args['order_type'] == 'asc':
                    order_type = 'desc'

        s_broj_indeksa = request.GET.get('broj_indeksa', '')
        s_ime = request.GET.get('ime', '')
        s_godina_studija = request.GET.get('godina_studija', '')
        s_prosek_ocena_od = 0.0
        s_prosek_ocena_do = 10.0
        if 'prosek_ocena_od' in args:
            if args['prosek_ocena_od'].isdigit():
                s_prosek_ocena_od = args['prosek_ocena_od']
        if 'prosek_ocena_do' in args:
            if args['prosek_ocena_do'].isdigit():
                s_prosek_ocena_do = args['prosek_ocena_do']
    
        #Sortiranje
        if order_type == 'asc':
            studenti = Studenti.objects.filter(broj_indeksa__icontains=s_broj_indeksa, ime__icontains=s_ime, godina_studija__icontains=s_godina_studija, prosek_ocena__gte=s_prosek_ocena_od, prosek_ocena__lte=s_prosek_ocena_do).order_by(order_by)
        elif order_type == 'desc':
            studenti = Studenti.objects.filter(broj_indeksa__icontains=s_broj_indeksa, ime__icontains=s_ime, godina_studija__icontains=s_godina_studija, prosek_ocena__gte=s_prosek_ocena_od, prosek_ocena__lte=s_prosek_ocena_do).order_by(order_by).reverse()
        # Paginacija
        paginacija = Paginator(studenti, br_prikaza)
        broj_strane = request.GET.get('page')
        strana_obj = paginacija.get_page(broj_strane)

        return render(request, 'studenti.html', {'studenti': strana_obj, 'rola': rola(request), 'order_type': order_type, 'args': args})
    else:
        return redirect('login')

def student_novi(request):
    if rola(request) == 'administrator':
        if request.method == 'GET':
            return render(request, 'student_novi.html')
        elif request.method == 'POST':
            email_check = request.POST['email']
            k = Korisnici.objects.filter(email = email_check)
            s = Studenti.objects.filter(email = email_check)
            if k.exists() or s.exists():
                messages.error(request, 'Uneta email adresa vec postoji.')
                return redirect('student_novi')
            else:
                student = Studenti()
                student.broj_indeksa = request.POST['broj_indeksa']
                student.ime = request.POST['ime']
                student.ime_roditelja = request.POST['ime_roditelja']
                student.prezime = request.POST['prezime']
                student.email = request.POST['email']
                student.broj_telefona = request.POST['broj_telefona']
                student.godina_studija = request.POST['godina_studija']
                student.datum_rodjenja = request.POST['datum_rodjenja']
                student.jmbg = request.POST['jmbg']
                #Slika
                if len(request.FILES) != 0:
                    student.slika = request.FILES['slika']
                student.save()
                #Automatsko generisanje naloga za studenta u tabeli korisnici
                korisnik = Korisnici()
                student_lozinka =  make_password('VTS_' + request.POST['broj_indeksa'], salt=None, hasher='default')
                korisnik.ime = request.POST['ime']
                korisnik.prezime = request.POST['prezime']
                korisnik.email = request.POST['email']
                korisnik.password = student_lozinka
                korisnik.username = "vtsUser_" + request.POST['email']
                korisnik.rola = 'student'
                korisnik.save()
                return redirect('studenti')
    elif rola(request) == 'profesor':
        return redirect('studenti')
    elif rola(request) == 'student':
        id = getID(request)
        return redirect('student', id)
    else:
        return redirect('login')

def student_izmena(request, id):
    if rola(request) == 'administrator':
        if request.method == 'GET':
            student = Studenti.objects.get(pk=id)
            return render(request, 'student_izmena.html', {'student': student})
        elif request.method == 'POST':
            email_check = request.POST['email']
            k = Korisnici.objects.filter(email = email_check)
            s = Studenti.objects.filter(email = email_check)
            if k.exists() or s.exists():
                messages.error(request, 'Uneta email adresa vec postoji.')
                return redirect('student_izmena', id)
            else:
                student = Studenti.objects.get(pk=id)
                old_mail = student.email
                # Automatsko updatovanje tabele korisnika
                korisnik = Korisnici.objects.get(email=old_mail)
                korisnik.ime = request.POST['ime']
                korisnik.prezime = request.POST['prezime']
                korisnik.email = request.POST['email']
                korisnik.username = "vtsStaff_" + request.POST['email']
                updatuj = [
                    'ime',
                    'prezime',
                    'email',
                    'username',
                    ]
                korisnik.save(update_fields=updatuj)
                # Izmena sutdenta
                student.broj_indeksa = request.POST['broj_indeksa']
                student.ime = request.POST['ime']
                student.ime_roditelja = request.POST['ime_roditelja']
                student.prezime = request.POST['prezime']
                student.email = request.POST['email']
                student.broj_telefona = request.POST['broj_telefona']
                student.godina_studija = request.POST['godina_studija']
                student.datum_rodjenja = request.POST['datum_rodjenja']
                student.jmbg = request.POST['jmbg']
                #Slika
                if len(request.FILES) != 0:
                    student.slika = request.FILES['slika']
                updatuj = [
                    'broj_indeksa',
                    'ime',
                    'ime_roditelja',
                    'prezime',
                    'email',
                    'broj_telefona',
                    'godina_studija',
                    'datum_rodjenja',
                    'jmbg',
                    'slika',]
                student.save(update_fields=updatuj)
                return redirect('studenti')
    elif rola(request) == 'profesor':
        return redirect('studenti')
    elif rola(request) == 'student':
        id = getID(request)
        return redirect('student', id)
    else:
        return redirect('login')

def student(request, id):
    if rola(request) == 'administrator' or rola(request) == 'profesor' or rola(request) == 'student':
        if request.method == 'GET':
            #fetch-evi
            student = Studenti.objects.get(pk=id)
            predmeti = Predmeti.objects.all()
            ocene = Ocene.objects.all()
            # Tabela sa predmetima i ocenama
                #Pretraga i filtriranje
            order_type = 'asc'
            order_by = 'sifra'
            args = request.GET.dict() # .values() i .dict()
            #rastuca opadajuca
            if 'order_by' in args:
                order_by = args['order_by']
                if 'prethodni_order_by' in args and args['prethodni_order_by'] == args['order_by']:
                    if args['order_type'] == 'asc':
                        order_type = 'desc'
                        
            st_sifra = "%%"
            st_naziv = "%%"
            st_godina_studija = "%%"
            st_ocena_od = '0'
            st_ocena_do = '10'
            if "sifra" in args:
                st_sifra = '%' + args["sifra"] + '%'
            if "naziv" in args:
                st_naziv = '%' + args["naziv"] + '%'
            if "godina_studija" in args:
                st_godina_studija = '%' + args["godina_studija"] + '%'
            if "ocena_od" in args and args['ocena_od'] != '':
                st_ocena_od = args["ocena_od"]
            if "ocena_do" in args and args['ocena_do'] != '':
                st_ocena_do = args["ocena_do"]

            cursor = connection.cursor()
            upit = f"""
                SELECT * FROM predmeti_ocene oc INNER JOIN predmeti_predmeti pred ON pred.id=oc.predmet_id WHERE student_id={id} AND
                sifra LIKE '{st_sifra}' AND
                naziv LIKE '{st_naziv}' AND
                godina_studija LIKE '{st_godina_studija}' AND
                ocena >= '{st_ocena_od}' AND ocena <= '{st_ocena_do}'
                ORDER BY {order_by} {order_type}
            """
            cursor.execute(upit)
            s_procene = cursor.fetchall()
            # Procene as in predmet i ocena, get it?
            procene = []
            class Procena:
                def __init__(self, id, datum, ocena, predmet_id, student_id, sifra, naziv, godina_studija, espb):
                    self.id = id
                    self.datum = datum
                    self.predmet_id = predmet_id
                    self.student_id = student_id
                    self.sifra = sifra
                    self.naziv = naziv
                    self.godina_studija = godina_studija
                    self.espb = espb
                    self.ocena = ocena
            for x in s_procene:
                id = x[0]
                datum = x[2]
                ocena = x[1]
                predmet_id = x[3]
                student_id = x[4]
                sifra = x[8]
                naziv = x[6]
                godina_studija = x[7]
                espb = x[9]
                procene.append(Procena(id, datum, ocena, predmet_id, student_id, sifra, naziv, godina_studija, espb))

            # Paginacija
            paginacija = Paginator(procene, br_prikaza)
            broj_strane = request.GET.get('page')
            strana_obj = paginacija.get_page(broj_strane)

            return render(request, 'student.html', {'student': student, 'predmeti': predmeti, 'ocene': ocene, 'rola': rola(request), 'order_type': order_type, 's_procene': strana_obj, 'args': args})
    else:
        return redirect('login')
    
def student_brisanje(request, id):
    if rola(request) == 'administrator':
        student = Studenti.objects.get(pk=id)
        korisnik = Korisnici.objects.get(email=student.email)
        korisnik.delete()
        student.delete()
        return redirect('studenti')
    elif rola(request) == 'profesor':
        return redirect('studenti')
    elif rola(request) == 'student':
        id = getID(request)
        return redirect('student', id)
    else:
        return redirect('login')