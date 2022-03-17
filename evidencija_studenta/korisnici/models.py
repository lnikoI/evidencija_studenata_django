from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager

# Create your models here.
class MyAccountManager(BaseUserManager):
    def create_user(self, ime, prezime, username, email, rola, password):
        if not ime:
            raise ValueError("Korisnik mora imati ime")
        if not prezime:
            raise ValueError("Korisnik mora imati email adresu")
        if not email:
            raise ValueError("Korisnik mora imati prezime")
        if not rola:
            raise ValueError("Korisnik mora imati odredjenu rolu")

        user = self.model(
            ime=ime,
            prezime=prezime,
            email=self.normalize_email(email),
            password = password,
            username=username,
            rola=rola,
        )
        user.set_password(password)
        user.save(using=self._db)
        return user
    def create_superuser(self, ime, prezime, email, username, rola, password):
        user = self.create_user(
            ime=ime,
            prezime=prezime,
            email=self.normalize_email(email),
            password=password,
            username=username,
            rola=rola,
        )
        user.is_admin = True
        user.is_staff = True
        user.is_superuser = True
        user.save(using=self._db)
        return user

# Custom user model for users (extended)
class Korisnici(AbstractBaseUser):
    ime = models.CharField(max_length=40, unique=False)
    prezime = models.CharField(max_length=40, unique=False)
    email = models.EmailField(verbose_name="email", max_length=60, unique=True)
    rola = models.CharField(max_length=30, unique=False)
    username = models.CharField(max_length=30, unique=True)
    date_joined = models.DateTimeField(verbose_name="date joined", auto_now_add=True)
    last_login = models.DateTimeField(verbose_name="last login", auto_now=True)
    is_admin = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username', 'ime', 'prezime', 'rola',]

    objects = MyAccountManager()

    def __str__(self):
        return self.email

    def has_perm(self, perm, obj=None):
        return self.is_admin

    def has_module_perms(self, app_label):
        return True