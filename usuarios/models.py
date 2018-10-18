from __future__ import unicode_literals

from django.db import models
from django.contrib.auth.models import User
from direcciones.models import Direccion
#from django.contrib.auth.models import AbstractUser

# Create your models here.
class Curriculum(models.Model):
    id_curriculum = models.IntegerField(primary_key=True)
    path_curriculum = models.CharField(max_length=250)

    class Meta:
        managed = False
        db_table = 'curriculum'
        
class Documentos(models.Model):
    id_documento = models.AutoField(primary_key=True)
    desc_documento = models.CharField(max_length=250)
    path_documento = models.CharField(max_length=250)
    id_tipo_documento = models.ForeignKey('TipoDocumento', models.DO_NOTHING, db_column='id_tipo_documento')

    class Meta:
        managed = False
        db_table = 'documentos'


class DocumentosLinkUsuarios(models.Model):
    id_doc_link_us = models.AutoField(primary_key=True)
    id_documento = models.ForeignKey(Documentos, models.DO_NOTHING, db_column='id_documento')
    id_usuario = models.ForeignKey('Usuarios', models.DO_NOTHING, db_column='id_usuario')
    desc_doc_link_us = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'documentos_link_usuarios'
        
class Nacionalidad(models.Model):
    id_nacion = models.IntegerField(primary_key=True)
    desc_nacion = models.CharField(max_length=45)

    def __str__(self):
        return (self.desc_nacion)
        
    class Meta:
        managed = False
        db_table = 'nacionalidad'
        
        
class OficioLinkUsuario(models.Model):
    id_of_link_us = models.AutoField(primary_key=True)
    id_oficios = models.ForeignKey('Oficios', models.DO_NOTHING, db_column='id_oficios')
    id_usuario = models.ForeignKey('Usuarios', models.DO_NOTHING, db_column='id_usuario')

    class Meta:
        managed = False
        db_table = 'oficio_link_usuario'


class Oficios(models.Model):
    id_oficios = models.AutoField(primary_key=True)
    desc_oficios = models.CharField(max_length=45)
    
    def __str__(self):
        return (self.desc_oficios)

    class Meta:
        managed = False
        db_table = 'oficios'
        
class Profesion(models.Model):
    id_profesion = models.AutoField(primary_key=True)
    desc_profesion = models.CharField(max_length=45)

    def __str__(self):
        return (self.desc_profesion)

    class Meta:
        managed = False
        db_table = 'profesion'


class ProfesionLinkUsuario(models.Model):
    id_prof_link_us = models.AutoField(primary_key=True)
    id_profesion = models.ForeignKey(Profesion, models.DO_NOTHING, db_column='id_profesion')
    id_usuario = models.ForeignKey('Usuarios', models.DO_NOTHING, db_column='id_usuario')

    class Meta:
        managed = False
        db_table = 'profesion_link_usuario'
        
class TipoDocumento(models.Model):
    id_tipo_documento = models.AutoField(primary_key=True)
    desc_tipo_documento = models.CharField(max_length=50)
    
    def __str__(self):
        return (self.desc_tipo_documento)

    class Meta:
        managed = False
        db_table = 'tipo_documento'

class TipoUsuario(models.Model):
    id_tipo_usuario = models.IntegerField(primary_key=True)
    desc_tipo_usuario = models.CharField(max_length=45)
    
    def __str__(self):
        return (self.desc_tipo_usuario)

    class Meta:
        managed = False
        db_table = 'tipo_usuario'


class Usuarios(models.Model):
    id_usuario = models.AutoField(primary_key=True)
    rut_usuario = models.CharField(max_length=10, blank=True, null=True)
    status_usuario = models.IntegerField(blank=True, null=True)
    nombre_usuario = models.CharField(max_length=45, blank=True, null=True)
    segnombre_usuario = models.CharField(max_length=45, blank=True, null=True)
    ape_paterno_usuario = models.CharField(max_length=45, blank=True, null=True)
    ape_materno_usuario = models.CharField(max_length=45, blank=True, null=True)
    sexo_usuario = models.IntegerField(blank=True, null=True)
    email_usuario = models.CharField(max_length=45)
    fono_cel_usuario = models.CharField(max_length=45, blank=True, null=True)
    fono_casa_usuario = models.CharField(max_length=45, blank=True, null=True)
    id_tipo_usuario = models.ForeignKey(TipoUsuario, models.DO_NOTHING, db_column='id_tipo_usuario')
    id_curriculum = models.ForeignKey(Curriculum, models.DO_NOTHING, db_column='id_curriculum', blank=True, null=True)
    id_direccion = models.ForeignKey(Direccion, models.DO_NOTHING, db_column='id_direccion', blank=True, null=True)
    id_nacion = models.ForeignKey(Nacionalidad, models.DO_NOTHING, db_column='id_nacion', blank=True, null=True)
    fecha_creacion_usuario = models.DateTimeField()
    fecha_modificacion_usuario = models.DateTimeField(auto_now_add=True)
    nick_usuario = models.CharField(max_length=45, blank=True, null=True)
    password_usuario = models.CharField(max_length=256)
    foto_path_usuario = models.CharField(max_length=45, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'usuarios'
        
class Empresa(User):
    rut_empresa = models.CharField(max_length=10, blank=True, null=True)
    razon_social =  models.CharField(max_length=45, blank=True, null=True)
    logo_path = models.CharField(max_length=45, blank=True, null=True)
    id_direccion = models.ForeignKey(Direccion, models.DO_NOTHING, db_column='id_direccion', blank=True, null=True)
    fono_empresa = models.CharField(max_length=45, blank=True, null=True)
    
class Postulante(User):
    rut_postulante = models.CharField(max_length=10, blank=True, null=True)
    segnombre_usuario = models.CharField(max_length=45, blank=True, null=True)
    ape_materno_usuario = models.CharField(max_length=45, blank=True, null=True)
    sexo_usuario = models.IntegerField(blank=True, null=True)
    fono_cel_usuario = models.CharField(max_length=45, blank=True, null=True)
    fono_casa_usuario = models.CharField(max_length=45, blank=True, null=True)
    id_curriculum = models.ForeignKey(Curriculum, models.DO_NOTHING, db_column='id_curriculum', blank=True, null=True)
    id_direccion = models.ForeignKey(Direccion, models.DO_NOTHING, db_column='id_direccion', blank=True, null=True)
    id_nacion = models.ForeignKey(Nacionalidad, models.DO_NOTHING, db_column='id_nacion', blank=True, null=True)
    foto_path_usuario = models.CharField(max_length=45, blank=True, null=True)
    