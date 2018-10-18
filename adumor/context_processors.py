import django
from usuarios.models import Empresa, Postulante

def my_processor(request):
    context = {
        "django_version": django.get_version(),
        "get_empresa_url": empresa_url(request),
        "get_postulante_url": postulante_url(request),
        }
    return context
    
def empresa_url(request):
    user = request.user
    pk = user.id
    return "/usuarios/editar_empresa/%s/" % pk
    
    
def postulante_url(request):
    user = request.user
    pk = user.id
    return "/usuarios/editar_postulante/%s/" % pk
    