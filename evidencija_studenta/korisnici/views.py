from django.shortcuts import redirect, render
from django.core.paginator import Paginator
from django.core.mail import BadHeaderError, send_mail
from django.utils.html import strip_tags
from django.http import HttpResponse
from django.template.loader import render_to_string
from django.contrib.auth.hashers import make_password
from django.contrib import messages
from .models import Korisnici
from studenti.models import Studenti
from evidencija_studenta.utils import ulogovan, rola, getID

#Paginacija
br_prikaza = 5

# Create your views here.
def korisnici(request):
    if rola(request) == 'administrator':
        #Korisnici feth
        korisnici = Korisnici.objects.all()
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
                    
        k_ime = request.GET.get('ime', '')
        k_prezime = request.GET.get('prezime', '')
        k_rola = request.GET.get('rola', '')
        #Sortiranje
        if order_type == 'asc':
            korisnici = Korisnici.objects.filter(ime__icontains=k_ime, prezime__icontains=k_prezime, rola__icontains=k_rola).order_by(order_by)
        elif order_type == 'desc':
            korisnici = Korisnici.objects.filter(ime__icontains=k_ime, prezime__icontains=k_prezime, rola__icontains=k_rola).order_by(order_by).reverse()

        # Paginacija
        paginacija = Paginator(korisnici, br_prikaza)
        broj_strane = request.GET.get('page')
        strana_obj = paginacija.get_page(broj_strane)
        
        return render(request, 'korisnici.html', {'korisnici': strana_obj, 'order_type': order_type, 'args': args})

    elif rola(request) == 'profesor':
        return redirect('studenti')
    elif rola(request) == 'student':
        id = getID(request)
        return redirect('student', id)
    else:
        return redirect('login')

def korisnik_novi(request):
    if rola(request) == 'administrator':
        if request.method == 'GET':
            return render(request, 'korisnik_novi.html')
        elif request.method == 'POST':
            email_check = request.POST['email']
            k = Korisnici.objects.filter(email = email_check)
            s = Studenti.objects.filter(email = email_check)
            if k.exists() or s.exists():
                messages.error(request, 'Uneta email adresa vec postoji.')
                return redirect('korisnik_novi')
            else:
                korisnik = Korisnici()
                korisnik_lozinka = make_password(request.POST['lozinka'], salt=None, hasher='default')
                korisnik.ime = request.POST['ime']
                korisnik.prezime = request.POST['prezime']
                korisnik.email = request.POST['email']
                korisnik.password = korisnik_lozinka
                korisnik.rola = request.POST['rola']
                korisnik.username = "vtsStaff_" + request.POST['email']
                korisnik.save()
                # Slanje mail-a
                subject = 'Korisnicki nalog'
                ime = request.POST['ime']
                prezime = request.POST['prezime']
                email = request.POST['email']
                lozinka = request.POST['lozinka']
                html_message = render_to_string('email.html', {'ime': ime, 'prezime': prezime, 'lozinka': lozinka})
                text_message = strip_tags(html_message)
                try:
                    send_mail(
                        subject,
                        text_message,
                        email,
                        ['web.programiranje.rer0119@gmail.com'],
                    )
                except BadHeaderError:
                    return HttpResponse('Invalid header found.')
                return redirect('korisnici')
    elif rola(request) == 'profesor':
        return redirect('studenti')
    elif rola(request) == 'student':
        id = getID(request)
        return redirect('student', id)
    else:
        return redirect('login')

def korisnik_izmena(request, id):
    if rola(request) == 'administrator':
        if request.method == 'GET':
            korisnik = Korisnici.objects.get(pk=id)
            return render(request, 'korisnik_izmena.html', {'korisnik': korisnik})
        elif request.method == 'POST':
            email_check = request.POST['email']
            k = Korisnici.objects.filter(email = email_check)
            s = Studenti.objects.filter(email = email_check)
            if k.exists() or s.exists():
                messages.error(request, 'Uneta email adresa vec postoji.')
                return redirect('korisnik_izmena', id)
            else:
                korisnik = Korisnici.objects.get(pk=id)
                korisnik.ime = request.POST['ime']
                korisnik.prezime = request.POST['prezime']
                korisnik.email = request.POST['email']
                korisnik.rola = request.POST['rola']
                korisnik.username = "vtsStaff_" + request.POST['email']
                updatuj = [
                    'ime',
                    'prezime',
                    'email',
                    'rola',
                    'username',
                    ]

                korisnik.save(update_fields=updatuj)
                return redirect('korisnici')
    elif rola(request) == 'profesor':
        return redirect('studenti')
    elif rola(request) == 'student':
        id = getID(request)
        return redirect('student', id)
    else:
        return redirect('login')

def korisnik_brisanje(request, id):
    if rola(request) == 'administrator':
        korisnik = Korisnici.objects.filter(pk=id)
        korisnik.delete()
        return redirect('korisnici')
    elif rola(request) == 'profesor':
        return redirect('studenti')
    elif rola(request) == 'student':
        id = getID(request)
        return redirect('student', id)
    else:
        return redirect('login')