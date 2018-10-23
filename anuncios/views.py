from django.shortcuts import render, redirect
from django.utils import timezone
from django.http import HttpResponseRedirect
from django.views.generic import ListView, UpdateView, DeleteView, DetailView, TemplateView
from django.core.urlresolvers import reverse_lazy
from .forms import CrearAnuncio, PostularForm
from .models import Anuncio, EstadoPostulacion
from usuarios.models import Empresa, Postulante
from direcciones.models import Direccion

# Create your views here.

def postular(request, pk):
    if request.method == 'POST':
        form = PostularForm(request.POST)
        if form.is_valid():
            instance = form.save(commit=False)
            instance.fecha_postulacion = timezone.now()
            instance.id_usuario_postulante = Postulante.objects.get(pk=int(request.user.pk))
            instance.id_anuncio = Anuncio.objects.get(pk=pk)
            instance.id_estado_postulacion = EstadoPostulacion.objects.get(pk=1)
            instance.fecha_cambio_postulacion = timezone.now()
            instance.save()
            return redirect('anuncios:postulante_lista_anuncio') 
    else:
        form = PostularForm()
    return render(request, 'anuncios/postulante_lista_anuncio.html', {'form': form})
        

def crear_anuncio(request):
    if request.method == 'POST':
        form = CrearAnuncio(request.POST)
        if form.is_valid():
            instance = form.save(commit=False)
            anuncio_final = Anuncio.objects.last()
            instance.id_anuncio = anuncio_final.id_anuncio + 1
            instance.fecha_anuncio = timezone.now()
            instance.fecha_cierre_anuncio = timezone.now()
            instance.user_ptr_id = Empresa.objects.get(pk=request.user.pk)
            instance.estado_anuncio = 1;
            instance.save()
            return redirect('anuncios:empresa_lista_anuncio')                
    else:
        form = CrearAnuncio()
    return render(request, 'anuncios/empresa_anuncio.html', {'form': form})
    
class AnuncioList(ListView):
    model = Anuncio
    template_name = 'anuncios/empresa_lista_anuncio.html'
    
class AnuncioPostulanteList(ListView):
    model = Anuncio
    template_name = 'anuncios/postulante_lista_anuncio.html'
    
class AnuncioEdit(UpdateView):
    model = Anuncio
    form_class = CrearAnuncio
    template_name = 'anuncios/empresa_anuncio.html'
    success_url = reverse_lazy('anuncios:empresa_lista_anuncio')
    
class AnuncioDelete(DeleteView):
    model = Anuncio
    template_name = '/anuncios/anuncio_eliminar.html'
    success_url = reverse_lazy('anuncios:anuncio_eliminar')
    
class DetailAnuncio(DetailView):
    model = Anuncio
    template_name = 'anuncios/pagina_anuncio.html'
    success_url = reverse_lazy('anuncios:pagina_anuncio')
    