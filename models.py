# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AprobacionesMantenimientos(models.Model):
    id_aprobacion = models.AutoField(primary_key=True)
    id_mantenimiento = models.ForeignKey('Mantenimientos', models.DO_NOTHING, db_column='id_mantenimiento', blank=True, null=True)
    id_usuario_aprobador = models.ForeignKey('Usuarios', models.DO_NOTHING, db_column='id_usuario_aprobador', blank=True, null=True)
    fecha_aprobacion = models.DateTimeField(blank=True, null=True)
    estado = models.CharField(max_length=9)
    comentario = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'aprobaciones_mantenimientos'


class ArchivosMantenimiento(models.Model):
    id_archivo = models.AutoField(primary_key=True)
    id_mantenimiento = models.ForeignKey('Mantenimientos', models.DO_NOTHING, db_column='id_mantenimiento', blank=True, null=True)
    tipo_archivo = models.CharField(max_length=9)
    nombre_archivo = models.CharField(max_length=255)
    ruta_archivo = models.CharField(max_length=500)
    version = models.IntegerField(blank=True, null=True)
    fecha_subida = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'archivos_mantenimiento'


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150, blank=True, null=True)
    last_name = models.CharField(max_length=150, blank=True, null=True)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class AuthtokenToken(models.Model):
    key = models.CharField(primary_key=True, max_length=40)
    created = models.DateTimeField()
    user = models.OneToOneField(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'authtoken_token'


class CronogramaMantenimiento(models.Model):
    id_cronograma = models.AutoField(primary_key=True)
    id_equipo = models.ForeignKey('Equipos', models.DO_NOTHING, db_column='id_equipo')
    tipo_actividad = models.CharField(max_length=11)
    fecha_programada = models.DateField()
    anio = models.IntegerField(blank=True, null=True)
    mes = models.IntegerField(blank=True, null=True)
    semana_anio = models.IntegerField(blank=True, null=True)
    dia_mes = models.IntegerField(blank=True, null=True)
    responsable = models.CharField(max_length=100, blank=True, null=True)
    estado = models.CharField(max_length=9, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'cronograma_mantenimiento'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Equipos(models.Model):
    id_equipo = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100)
    tipo = models.CharField(max_length=10)
    descripcion = models.TextField(blank=True, null=True)
    fecha_adquisicion = models.DateField(blank=True, null=True)
    ubicacion = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'equipos'


class Mantenimientos(models.Model):
    id_mantenimiento = models.AutoField(primary_key=True)
    id_equipo = models.ForeignKey(Equipos, models.DO_NOTHING, db_column='id_equipo', blank=True, null=True)
    id_usuario = models.ForeignKey('Usuarios', models.DO_NOTHING, db_column='id_usuario', blank=True, null=True)
    tipo_mantenimiento = models.CharField(max_length=10)
    fecha_realizacion = models.DateField()
    observaciones = models.TextField(blank=True, null=True)
    estado_aprobacion = models.CharField(max_length=20, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'mantenimientos'


class PiezasReemplazadas(models.Model):
    id_pieza = models.AutoField(primary_key=True)
    id_equipo = models.ForeignKey(Equipos, models.DO_NOTHING, db_column='id_equipo', blank=True, null=True)
    nombre_pieza = models.CharField(max_length=100)
    fabricante_pieza = models.CharField(max_length=100, blank=True, null=True)
    fecha_instalacion = models.DateField()
    vida_util_estimada = models.IntegerField(blank=True, null=True, db_comment='En meses')
    estado = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'piezas_reemplazadas'


class RepuestosEquipos(models.Model):
    id_repuesto = models.AutoField(primary_key=True)
    id_equipo = models.ForeignKey(Equipos, models.DO_NOTHING, db_column='id_equipo')
    nombre_repuesto = models.CharField(max_length=100)
    referencia = models.CharField(max_length=100)
    cantidad = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'repuestos_equipos'


class Usuarios(models.Model):
    id_usuario = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100)
    email = models.CharField(unique=True, max_length=100)
    password_hash = models.CharField(max_length=255)
    rol = models.CharField(max_length=10)

    class Meta:
        managed = False
        db_table = 'usuarios'
