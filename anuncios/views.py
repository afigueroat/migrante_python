from django.shortcuts import render, redirect
from django.utils import timezone
from django.http import HttpResponseRedirect
from django.views.generic import ListView, UpdateView, DeleteView
from django.core.urlresolvers import reverse_lazy
from .forms import CrearAnuncio
from .models import Anuncio
from usuarios.models import Empresa

# Create your views here.

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
    
class AnuncioEdit(UpdateView):
    model = Anuncio
    form_class = CrearAnuncio
    template_name = 'anuncios/empresa_anuncio.html'
    success_url = reverse_lazy('anuncios:empresa_lista_anuncio')
    
class AnuncioDelete(DeleteView):
    model = Anuncio
    template_name = 'anuncios/anuncio_eliminar.html'
    success_url = reverse_lazy('anuncios:anuncio_eliminar')
    
#def eliminar_anuncio(request, id_anuncio):
 #   anuncio = Anuncio.object.get(id=id_anuncio)
  #  if request.method == 'POST':
   #     anuncio.delete()
    #    return redirect
        
        