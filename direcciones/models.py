from __future__ import unicode_literals

from django.db import models

class Ciudad(models.Model):
    id_ciudad = models.AutoField(primary_key=True)
    desc_ciudad = models.CharField(max_length=45)
    id_region = models.ForeignKey('Region', models.DO_NOTHING, db_column='id_region')

    def __str__(self):
        return (self.desc_ciudad)
        
    class Meta:
        managed = False
        db_table = 'ciudad'


class Comuna(models.Model):
    id_comuna = models.AutoField(primary_key=True)
    desc_comuna = models.CharField(max_length=45)
    id_ciudad = models.ForeignKey(Ciudad, models.DO_NOTHING, db_column='id_ciudad')
        
    def __str__(self):
        return (self.desc_comuna)
        
    class Meta:
        managed = False
        db_table = 'comuna'


class Direccion(models.Model):
    id_direccion = models.AutoField(primary_key=True)
    desc_direccion = models.CharField(max_length=250)
    desc_block_depto = models.CharField(max_length=45, blank=True, null=True)
    numero = models.IntegerField()
    id_comuna = models.ForeignKey(Comuna, models.DO_NOTHING, db_column='id_comuna')
    
    def __str__(self):
        return '%s, %s, %s' % (self.desc_direccion, self.numero, self.desc_block_depto)

    class Meta:
        managed = False
        db_table = 'direccion'
        

class Region(models.Model):
    id_region = models.IntegerField(primary_key=True)
    desc_region = models.CharField(max_length=45)
        
    def __str__(self):
        return (self.desc_region)
        
    class Meta:
        managed = False
        db_table = 'region'

