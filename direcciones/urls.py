from django.conf.urls import url
from .views import CrearDireccion

namespace = 'direcciones'

urlpatterns = [
    url(r'^nuevo/', CrearDireccion.as_view(), name="crear_direccion"),
]