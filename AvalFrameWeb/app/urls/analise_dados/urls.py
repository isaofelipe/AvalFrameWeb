"""
Definition of urls for AvalFrameWeb.
"""

from datetime import datetime
from django.conf.urls import url
from django.conf.urls import include
import django.contrib.auth.views

import app.forms
import app.views
from app.views import analise_dados

# Uncomment the next lines to enable the admin:
# from django.conf.urls import include
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = [
    url(r'^$', analise_dados.index.as_view(), name='analise_dados_index'),
]
