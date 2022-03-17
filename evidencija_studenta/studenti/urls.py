from django.urls import path
from . import views

urlpatterns = [
    path('studenti', views.studenti, name='studenti'),
    path('student_novi', views.student_novi, name='student_novi'),
    path('student_izmena/<id>', views.student_izmena, name='student_izmena'),
    path('student_brisanje/<id>', views.student_brisanje, name='student_brisanje'),
    path('student/<id>', views.student, name='student'),
]