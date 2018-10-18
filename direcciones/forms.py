from django import forms
from .models import Direccion

class CrearDireccionForm(forms.ModelForm):
    class Meta:
        model = Direccion
        fields = [
            'id_direccion',
            'desc_direccion',
            'numero',
            'desc_block_depto',
            'id_comuna',
            ]
        widgets = {
            'numero': forms.TextInput(attrs={'class':'with-border'}),
            'desc_direccion': forms.TextInput(attrs={'class':'with-border'}),
            'desc_block_depto': forms.TextInput(attrs={'class':'with-border'}),
            'id_comuna': forms.Select(),
            }