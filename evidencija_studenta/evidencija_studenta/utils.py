import ast
from korisnici.models import Korisnici
from studenti.models import Studenti

# GLOBAL FUNCTIONS

def ulogovan(request):
    if 'ulogovan_korisnik' in request.session:
        return True
    else:
        return False

def rola(request):
    if ulogovan(request):
        return ast.literal_eval(request.session['ulogovan_korisnik']).pop('rola')

def getID(request):
    if ulogovan(request):
        if rola(request) == 'student':
            s_ime = ast.literal_eval(request.session['ulogovan_korisnik']).pop('ime')
            s_prezime = ast.literal_eval(request.session['ulogovan_korisnik']).pop('prezime')
            s_email = ast.literal_eval(request.session['ulogovan_korisnik']).pop('email')
            student = Studenti.objects.get(email=s_email)
            return student.id
        else:
            return ast.literal_eval(request.session['ulogovan_korisnik']).pop('id')
