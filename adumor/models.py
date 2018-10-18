from __future__ import unicode_literals

from django.db import models

class Idioma(models.Model):
    id_idioma = models.AutoField(primary_key=True)
    desc_idioma = models.CharField(max_length=45)

    def __str__(self):
        return (self.desc_idioma)
        
    class Meta:
        managed = False
        db_table = 'idioma'
