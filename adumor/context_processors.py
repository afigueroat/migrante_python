import django
from usuarios.models import Empresa, Postulante
from anuncios.models import Postulacion, Anuncio
from direcciones.models import Direccion

def my_processor(request):
    context = {
        "django_version": django.get_version(),
        "get_empresa_url": empresa_url(request),
        "get_postulante_url": postulante_url(request),
        "get_cantidad_postulaciones": cantidad_empleos(request),
        "get_cantidad_anuncios": cantidad_anuncios(request),
        "get_razon_social": razon_social(request),
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

def cantidad_empleos(request):
    user = request.user
    try:
        postulaciones = Postulacion.objects.filter(id_usuario_postulante=int(user.pk)).count()
        return postulaciones
    except:
        return None
        
def cantidad_anuncios(request):
    user = request.user
    try:
        anuncios = Anuncio.objects.filter(user_ptr_id=int(user.pk)).count()
        return anuncios
    except:
        return None
    
def razon_social(request):
    user = request.user
    try:
        razon = Empresa.objects.get(user_ptr_id=int(user.pk))
        return razon.razon_social
    except:
        return None