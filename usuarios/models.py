from django.contrib.auth.models import User
from django.db import models

class Rol(models.Model):
    nombre = models.CharField(max_length=20, unique=True)  # Ej: Admin, Técnico, Supervisor
    descripcion = models.TextField(blank=True)

    def __str__(self):
        return self.nombre

class UsuarioRol(models.Model):
    usuario = models.OneToOneField(User, on_delete=models.CASCADE)
    rol = models.ForeignKey(Rol, on_delete=models.SET_NULL, null=True)

    def __str__(self):
        return f"{self.usuario.username} - {self.rol.nombre if self.rol else 'Sin rol'}"
