from django import forms
from . import models

SEXO= (
('Masculino', '1'),
('Femenino', '2'),
)

class EmpresaUpdateForm(forms.ModelForm):
    class Meta:
        model = models.Empresa
        fields = [
            'razon_social', 
            'rut_empresa', 
            'fono_empresa', 
            'email',
            'logo_path',
            'id_direccion',
            ]
        widgets = {
            'razon_social': forms.TextInput(attrs={'class':'with-border'}), 
            'rut_empresa': forms.TextInput(attrs={'class':'with-border'}), 
            'fono_empresa': forms.TextInput(attrs={'class':'with-border'}),
            'email': forms.TextInput(attrs={'class':'with-border'}),
            'logo_path': forms.TextInput(attrs={'class':'with-border'}),
            'id_direccion': forms.Select(attrs={'class':'with-border'}),
        }
        
class PostulanteUpdateForm(forms.ModelForm):
    class Meta:
        model = models.Postulante
        fields = [
            'first_name',
            'segnombre_usuario',
            'last_name',
            'ape_materno_usuario',
            'sexo_usuario',
            'rut_postulante',
            'id_nacion',
            'fono_cel_usuario', 
            'fono_casa_usuario',
            'email',
            'foto_path_usuario',
            'id_direccion',
            ]
        widgets = {
            'first_name': forms.TextInput(attrs={'class':'with-border'}),
            'segnombre_usuario': forms.TextInput(attrs={'class':'with-border'}),
            'last_name': forms.TextInput(attrs={'class':'with-border'}),
            'ape_materno_usuario': forms.TextInput(attrs={'class':'with-border'}),
            'sexo_usuario': forms.Select(choices=SEXO),
            'rut_postulante': forms.TextInput(attrs={'class':'with-border'}), 
            'fono_cel_usuario': forms.TextInput(attrs={'class':'with-border'}),
            'fono_casa_usuario': forms.TextInput(attrs={'class':'with-border'}),
            'email': forms.TextInput(attrs={'class':'with-border'}),
            'foto_path_usuario': forms.TextInput(attrs={'class':'with-border'}),
            'id_direccion': forms.Select(attrs={'class':'with-border'}),
            'id_nacion': forms.Select(attrs={'class':'with-border'}),
        }
        
class LoginForm(forms.Form):
    username = forms.CharField()
    password = forms.CharField(widget=forms.PasswordInput)

class RegisterForm(forms.Form):
    username = forms.CharField()
    password = forms.CharField()
    email = forms.CharField()
    user_type = forms.RadioSelect()
    
class RegisterEmpresaForm(forms.ModelForm):
    class Meta:
        model = models.Empresa
        fields = [
            'username',
            'password',
            'email',
            ]
class RegisterPostulanteForm(forms.ModelForm):
    class Meta:
        model = models.Postulante
        fields = [
            'username',
            'password',
            'email',
            ]