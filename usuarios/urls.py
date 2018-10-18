from django.conf.urls import url
from django.contrib.auth.views import logout
from django.conf import settings
from .views import panel_empresa, panel_usuario, FichaEmpresaUpdate, login_view, register_view, FichaPostulanteUpdate

namespace = 'usuarios'

urlpatterns = [
    url(r'^panel_usuario/', panel_usuario ),
    url(r'^panel_empresa/', panel_empresa ),
    url(r'^editar/(?P<pk>\d+)/$', FichaEmpresaUpdate.as_view(), name='empresa_editar'),
    url(r'^login/$', login_view),
    url(r'^logout/$', logout, {'next_page': settings.LOGOUT_REDIRECT_URL}, name='logout'),
    url(r'^register/$', register_view),
    url(r'^editar_empresa/(?P<pk>\d+)/$', FichaEmpresaUpdate.as_view(), name='empresa_editar'),
    url(r'^editar_postulante/(?P<pk>\d+)/$', FichaPostulanteUpdate.as_view(), name='postulante_editar'),
]
