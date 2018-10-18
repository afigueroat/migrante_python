from django.conf.urls import url, include
from django.contrib import admin
from .import views
from usuarios.views import login_view
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^usuarios/', include('usuarios.urls', namespace='usuarios')),
    url(r'^anuncios/', include('anuncios.urls', namespace='anuncios')),
    url(r'^direccion/', include('direcciones.urls', namespace='direcciones')),
    url(r'^about/$', views.about),
    url(r'^$', views.homepage),
]

urlpatterns += staticfiles_urlpatterns()