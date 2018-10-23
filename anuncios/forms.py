from django import forms
from . import models

TIPO_TRABAJO= (
( 'Indefinido', 'Indefinido'),
('Plazo Fijo', 'Plazo Fijo'),
('Parcial', 'Parcial'),
)

class CrearAnuncio(forms.ModelForm):
    class Meta:
        model = models.Anuncio
        fields = [ 
            'titulo_anuncio', 
            'alter_titulo_anuncio', 
            'detalle_anuncio', 
            'alter_detalle_anuncio', 
            'fecha_cierre_anuncio',
            'tipo_trabajo',
            'salario',
            'id_direccion',
            'id_idioma_alter',
            ]
        widgets = {
            'titulo_anuncio': forms.TextInput(attrs={'class':'with-border'}), 
            'alter_titulo_anuncio': forms.TextInput(attrs={'class':'with-border'}), 
            'detalle_anuncio': forms.Textarea(attrs={'class':'with-border', 'cols':'10', 'rows':'1'}), 
            'alter_detalle_anuncio': forms.Textarea(attrs={'class':'with-border', 'cols':'10', 'rows':'1'}), 
            'fecha_cierre_anuncio': forms.TextInput(attrs={'class':'form_datetime'}),
            'tipo_trabajo': forms.Select(choices=TIPO_TRABAJO),
            'salario': forms.TextInput(attrs={'class':'with-border'}),
            'id_direccion': forms.Select(attrs={'class':'with-border'}),
            'id_idioma_alter': forms.Select(attrs={'class':'with-border'}),
        }
        
class PostularForm(forms.ModelForm):
    class Meta:
        model = models.Postulacion
        exclude = [
        'id_postulacion',
        'fecha_postulacion',
        'id_usuario_postulante',
        'id_anuncio',
        'id_estado_postulacion',
        'fecha_cambio_postulacion',
        ]