from django.conf.urls import url
from .views import crear_anuncio, AnuncioList, AnuncioDelete, anuncio_eliminar, AnuncioEdit, AnuncioPostulanteList, DetailAnuncio, postular


namespace = 'anuncios'

urlpatterns = [
    url(r'^$', crear_anuncio, name="crear_anuncio"),
    url(r'^display_anuncio/(?P<pk>\d+)/$', DetailAnuncio.as_view(), name="display_anuncio"),
    url(r'^empresa_lista_anuncio/', AnuncioList.as_view(), name="empresa_lista_anuncio"),
    url(r'^postulante_lista_anuncio/', AnuncioPostulanteList.as_view(), name="postulante_lista_anuncio"),
    url(r'^editar/(?P<pk>\d+)/$', AnuncioEdit.as_view(), name='anuncio_editar'),
    url(r'^eliminar/(?P<pk>\d+)/$', AnuncioDelete.as_view(), name='anuncio_eliminar'),
    url(r'^postular/(?P<pk>\d+)/$', postular, name='postular'),
]
