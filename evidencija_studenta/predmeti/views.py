from django.shortcuts import render, redirect
from django.db.models import Avg
from django.db import connection
from django.core.paginator import Paginator
from django.contrib import messages
from .models import Predmeti, Ocene
from studenti.models import Studenti
from evidencija_studenta.utils import ulogovan, rola, getID



#Paginacija
br_prikaza = 5

# Create your views here.
def predmeti(request):
    if rola(request) == 'administrator':
        #Predmeti fetch
        predmeti = Predmeti.objects.all()
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

        p_sifra = request.GET.get('sifra', '')
        p_naziv = request.GET.get('naziv', '')
        p_godina_studija = request.GET.get('godina_studija', '')
        p_obavezni_izborni = request.GET.get('obavezni_izborni', '')
    
        #Sortiranje
        if order_type == 'asc':
            predmeti = Predmeti.objects.filter(sifra__icontains=p_sifra, naziv__icontains=p_naziv, godina_studija__icontains=p_godina_studija, obavezni_izborni__icontains=p_obavezni_izborni).order_by(order_by)
        elif order_type == 'desc':
            predmeti = Predmeti.objects.filter(sifra__icontains=p_sifra, naziv__icontains=p_naziv, godina_studija__icontains=p_godina_studija, obavezni_izborni__icontains=p_obavezni_izborni).order_by(order_by).reverse()

        # Paginacija
        paginacija = Paginator(predmeti, br_prikaza)
        broj_strane = request.GET.get('page')
        strana_obj = paginacija.get_page(broj_strane)
        return render(request, 'predmeti.html', {'predmeti': strana_obj, 'order_type': order_type, 'args': args})
    elif rola(request) == 'profesor':
        return redirect('studenti')
    elif rola(request) == 'student':
        id = getID(request)
        return redirect('student', id)
    else:
        return redirect('login')

def predmet_novi(request):
    if rola(request) == 'administrator':
        if request.method == 'GET':
            return render(request, 'predmet_novi.html')
        elif request.method == 'POST':
            predmet = Predmeti()

            predmet.sifra = request.POST['sifra']
            predmet.naziv = request.POST['naziv']
            predmet.godina_studija = request.POST['godina_studija']
            predmet.espb = request.POST['espb']
            predmet.obavezni_izborni = request.POST['obavezni_izborni']
            predmet.save()
            return redirect('predmeti')
    elif rola(request) == 'profesor':
        return redirect('studenti')
    elif rola(request) == 'student':
        id = getID(request)
        return redirect('student', id)
    else:
        return redirect('login')

def predmet_izmena(request, id):
    if rola(request) == 'administrator':
        if request.method == 'GET':
            predmet = Predmeti.objects.get(pk=id)
            return render(request, 'predmet_izmena.html', {'predmet': predmet})
        elif request.method == 'POST':
            predmet = Predmeti.objects.get(pk=id)

            predmet.sifra = request.POST['sifra']
            predmet.naziv = request.POST['naziv']
            predmet.godina_studija = request.POST['godina_studija']
            predmet.espb = request.POST['espb']
            predmet.obavezni_izborni = request.POST['obavezni_izborni']
            updatuj = [
                'sifra',
                'naziv',
                'godina_studija',
                'espb'
                'obavezni_izborni',]

            predmet.save(update_fields=updatuj)
            return redirect('predmeti')
    elif rola(request) == 'profesor':
        return redirect('studenti')
    elif rola(request) == 'student':
        id = getID(request)
        return redirect('student', id)
    else:
        return redirect('login')

def predmet_brisanje(request, id):
    if rola(request) == 'administrator':
        predmet = Predmeti.objects.filter(pk=id)
        predmet.delete()
        return redirect('predmeti')
    elif rola(request) == 'profesor':
        return redirect('studenti')
    elif rola(request) == 'student':
        id = getID(request)
        return redirect('student', id)
    else:
        return redirect('login')

def ocena_nova(request, id):
    if rola(request) == 'administrator' or rola(request) == 'profesor':
        predmet_check = request.POST['predmet_id']
        ocene_check = Ocene.objects.filter(student_id=id, predmet_id=predmet_check)
        if ocene_check.exists():
            messages.error(request, 'Student vec ima unetu ocenu iz tog predmeta')
            return redirect('student', id)
        else:
            #Fetch Ocene
            ocena = Ocene()
            ocena.ocena = request.POST['ocena']
            ocena.datum = request.POST['datum']
            ocena.predmet_id = request.POST['predmet_id']
            ocena.student_id = id
            ocena.save()
            # Racunanje proseka ocena
            student = Studenti.objects.get(pk=id)
            prosek_ocena = Ocene.objects.filter(student_id=id).aggregate(Avg('ocena'))
            student.prosek_ocena=round(prosek_ocena['ocena__avg'], 1)
            # Racunanje ukupnih espb
            cursor = connection.cursor()
            upit = "SELECT SUM(espb) AS rezultat FROM predmeti_predmeti WHERE id IN (SELECT predmet_id FROM predmeti_ocene WHERE student_id=%s)"
            cursor.execute(upit, [id])
            ukupno_espb = cursor.fetchone()
            student.espb = round(ukupno_espb[0], 1)
            student.save(update_fields=['prosek_ocena', 'espb'])
            return redirect('student', id)
    elif rola(request) == 'student':
        id = getID(request)
        return redirect('student', id)
    else:
        return redirect('login')

def ocena_brisanje(request, id):
    if rola(request) == 'administrator':
        ocena = Ocene.objects.filter(pk=id)
        student_id = ocena[0].student_id
        ocena.delete()
        return redirect('student', student_id)
    elif rola(request) == 'profesor':
        return redirect('studenti')
    elif rola(request) == 'student':
        id = getID(request)
        return redirect('student', id)
    else:
        return redirect('login')
