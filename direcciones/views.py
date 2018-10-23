from django.shortcuts import render
from django.views.generic import CreateView
from django.core.urlresolvers import reverse_lazy
from .models import Direccion, Comuna
from .forms import CrearDireccionForm
from django.contrib.auth.decorators import login_required

# Create your views here.

class CrearDireccion(CreateView):
    model = Direccion
    form_class = CrearDireccionForm
    template_name = 'direcciones/crear_direccion.html'
    success_url = reverse_lazy('direcciones:crear_direccion')
    