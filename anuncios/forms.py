from django import forms
from . import models

class CrearAnuncio(forms.ModelForm):
    class Meta:
        model = models.Anuncio
        fields = [ 
            'titulo_anuncio', 
            'alter_titulo_anuncio', 
            'detalle_anuncio', 
            'alter_detalle_anuncio', 
            'fecha_cierre_anuncio',
            'id_idioma_alter',
            ]
        widgets = {
            'titulo_anuncio': forms.TextInput(attrs={'class':'with-border'}), 
            'alter_titulo_anuncio': forms.TextInput(attrs={'class':'with-border'}), 
            'detalle_anuncio': forms.Textarea(attrs={'class':'with-border', 'cols':'10', 'rows':'1'}), 
            'alter_detalle_anuncio': forms.Textarea(attrs={'class':'with-border', 'cols':'10', 'rows':'1'}), 
            'fecha_cierre_anuncio': forms.TextInput(attrs={'class':'form_datetime'}),
            'id_idioma_alter': forms.Select(attrs={'class':'with-border'}),
        }