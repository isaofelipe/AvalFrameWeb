"""
Definition of urls for AvalFrameWeb.
"""

from datetime import datetime
from django.conf.urls import url
from django.conf.urls import include
import django.contrib.auth.views

import app.forms
import app.views
from app.views import etapas_jogo

urlpatterns = [
    url(r'^$', etapas_jogo.index.as_view(), name='etapas_jogo_index'),
    url(r'^novo_alterar/$', etapas_jogo.novo_alterar.as_view(), name='etapas_jogo_novo'),
    url(r'^novo_alterar/(?P<codigo>\d+)$', etapas_jogo.novo_alterar.as_view(), name='etapas_jogo_alterar'),
    url(r'^deletar/(?P<codigo>\d+)$', etapas_jogo.deletar.as_view(), name='etapas_jogo_deletar'),
]
