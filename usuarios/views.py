from django.shortcuts import render, redirect
from datetime import datetime
from .forms import EmpresaUpdateForm, PostulanteUpdateForm, LoginForm, RegisterForm, RegisterEmpresaForm, RegisterPostulanteForm
from usuarios.models import Nacionalidad
from django.views.generic import ListView, UpdateView, DeleteView, TemplateView
from .models import Usuarios, Empresa, Postulante
from django.core.urlresolvers import reverse_lazy, reverse
from django.contrib.auth import authenticate, login
from django.http import HttpResponseRedirect
from django.contrib.auth.models import Group, User


class FichaEmpresaUpdate(UpdateView):
    model = Empresa
    form_class = EmpresaUpdateForm
    template_name = 'usuarios/empresa-ficha-personal.html'
    success_url = reverse_lazy('anuncios:empresa_lista_anuncio')
    
class FichaPostulanteUpdate(UpdateView):
    model = Postulante
    form_class = PostulanteUpdateForm
    template_name = 'usuarios/postulante-ficha-personal.html'
    success_url = reverse_lazy('anuncios:postulante_lista_anuncio')
    
def login_view(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user is not None and user.is_active:
            login(request, user)
            user_group = user.groups.all()[0].name
            if user_group == "empresa":
                return HttpResponseRedirect('/usuarios/editar_empresa/%s' % int(user.pk))
            else:
                return HttpResponseRedirect("/usuarios/editar_postulante/%s" % int(user.pk))
        return HttpResponseRedirect("/")
    form = LoginForm()
    return render(request, 'usuarios/login.html', {'login_form': LoginForm})
    
def register_view(request):
    if request.method == 'POST':
        username = request.POST['username']
        email = request.POST['email']
        password = request.POST['password']
        form = RegisterForm(request.POST)
        if form.is_valid:
            user_type = request.POST['user_type']
            if user_type == "empresa":
                form = RegisterEmpresaForm(request.POST)
                group = Group.objects.get(name='empresa')
                empresa = form.save(commit=False)
                empresa.username = username
                empresa.email = email
                empresa.set_password(password)
                empresa.save()
                user = User.objects.get(username=empresa.username)
                user.groups.add(group)
                user.save()
                return HttpResponseRedirect('/usuarios/editar_empresa/%s' % int(empresa.pk))
            else:
                form = RegisterPostulanteForm(request.POST)
                group = Group.objects.get(name='postulante')
                postulante = form.save(commit=False)
                postulante.username = username
                postulante.email = email
                postulante.set_password(password)
                postulante.save()
                user = User.objects.get(username=postulante.username)
                user.groups.add(group)
                user.save()
                return HttpResponseRedirect("/usuarios/editar_postulante/%s" % int(postulante.pk))   
    form = RegisterForm()
    return render(request, 'usuarios/register_user.html', {'register_form' : RegisterForm})
    
class PanelPostulante(TemplateView):
    model = Postulante
    template_name = 'usuarios/postulante-panel.html'
    success_url = reverse_lazy('usuarios:panel_postulante')
    
class PanelEmpresa(TemplateView):
    model = Empresa
    template_name = 'usuarios/empresa-panel.html'
    success_url = reverse_lazy('usuarios:panel_empresa')
    
class ConfigEmpresa(TemplateView):
    model = Empresa
    template_name = 'usuarios/empresa-configuracion.html'
    success_url = reverse_lazy('usuarios:configuracion_empresa')
    
class ConfigPostulante(TemplateView):
    model = Postulante
    template_name = 'usuarios/postulante-configuracion.html'
    success_url = reverse_lazy('usuarios:configuracion_postulante')
    