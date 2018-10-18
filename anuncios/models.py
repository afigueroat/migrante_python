from __future__ import unicode_literals

from django.db import models
from adumor.models import Idioma
from usuarios.models import Usuarios

# Create your models here.


class Anuncio(models.Model):
    id_anuncio = models.IntegerField(primary_key=True)
    titulo_anuncio = models.CharField(max_length=250)
    alter_titulo_anuncio = models.CharField(max_length=250, blank=True, null=True)
    detalle_anuncio = models.CharField(max_length=600)
    alter_detalle_anuncio = models.CharField(max_length=600, blank=True, null=True)
    fecha_anuncio = models.DateTimeField()
    fecha_cierre_anuncio = models.DateTimeField(blank=True, null=True)
    estado_anuncio = models.IntegerField()
    user_ptr_id = models.ForeignKey('usuarios.Empresa', models.DO_NOTHING, db_column='user_ptr_id')
    id_idioma_alter = models.ForeignKey('adumor.Idioma', models.DO_NOTHING, db_column='id_idioma_alter', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'anuncio'

class EstadoPostulacion(models.Model):
    id_estado_postulacion = models.AutoField(primary_key=True)
    desc_estado_postulacion = models.CharField(max_length=45)

    def __str__(self):
        return (self.desc_estado_postulacion)

    class Meta:
        managed = False
        db_table = 'estado_postulacion'

class Postulacion(models.Model):
    id_postulacion = models.AutoField(primary_key=True)
    fecha_postulacion = models.DateTimeField()
    id_usuario_postulante = models.ForeignKey('usuarios.Usuarios', models.DO_NOTHING, db_column='id_usuario_postulante')
    id_anuncio = models.ForeignKey(Anuncio, models.DO_NOTHING, db_column='id_anuncio')
    id_estado_postulacion = models.ForeignKey(EstadoPostulacion, models.DO_NOTHING, db_column='id_estado_postulacion')
    fecha_cambio_postulacion = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'postulacion'
        
class TipoAnuncio(models.Model):
    id_tipo_anuncio = models.IntegerField(primary_key=True)
    desc_tipo_anuncio = models.CharField(max_length=45)
    
    def __str__(self):
        return (self.desc_tipo_anuncio)

    class Meta:
        managed = False
        db_table = 'tipo_anuncio'
