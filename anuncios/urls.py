from django.conf.urls import url
from .views import crear_anuncio, AnuncioList, AnuncioDelete, AnuncioEdit


namespace = 'anuncios'

urlpatterns = [
    url(r'^$', crear_anuncio, name="crear_anuncio"),
    url(r'^empresa_lista_anuncio/', AnuncioList.as_view(), name="empresa_lista_anuncio"),
    url(r'^editar/(?P<pk>\d+)/$', AnuncioEdit.as_view(), name='anuncio_editar'),
    url(r'^eliminar/(?P<pk>\d+)/$', AnuncioDelete.as_view(), name='anuncio_eliminar'),
]
