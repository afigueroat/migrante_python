from django.conf.urls import url
from django.contrib.auth.views import logout
from django.conf import settings
from .views import FichaEmpresaUpdate, login_view, register_view, FichaPostulanteUpdate, ConfigEmpresa, ConfigPostulante, PanelPostulante, PanelEmpresa

namespace = 'usuarios'

urlpatterns = [
    url(r'^editar/(?P<pk>\d+)/$', FichaEmpresaUpdate.as_view(), name='empresa_editar'),
    url(r'^login/$', login_view),
    url(r'^logout/$', logout, {'next_page': settings.LOGOUT_REDIRECT_URL}, name='logout'),
    url(r'^register/$', register_view),
    url(r'^editar_empresa/(?P<pk>\d+)/$', FichaEmpresaUpdate.as_view(), name='empresa_editar'),
    url(r'^editar_postulante/(?P<pk>\d+)/$', FichaPostulanteUpdate.as_view(), name='postulante_editar'),
    url(r'^panel_postulante/$', PanelPostulante.as_view(), name='panel_postulante'),
    url(r'^panel_empresa/$', PanelEmpresa.as_view(), name='panel_empresa'),
    url(r'^configuracion_empresa/$', ConfigEmpresa.as_view(), name='configuracion_empresa'),
    url(r'^configuracion_postulante/$', ConfigPostulante.as_view(), name='configuracion_postulante'),
]
