from django.shortcuts import render
from django.http import HttpRequest
from django.template import RequestContext
from django.shortcuts import redirect
from django.views.generic.base import View
from datetime import datetime
from app.forms import *
from app.models import *
from app.models_carga import *

class index(View):
    template_name = 'geracao_relatorio/index.html'
    
    def get(self, request, *args, **kwargs):
        codigo = request.GET.get('codigo', None)
       # aeejAprendizagensDados= AeejAprendizagensDados.objects.all().order_by('codigo')
       # if codigo:
       #     aeejAprendizagensDados = AeejAprendizagensDados.filter(codigo_jogador = codigo)
             
       #  for x in aeejAprendizagensDados:
       #      x.nome_jogador =Jogadores.objects.get(codigo = x.codigo_jogador).nome
       #      x.nome_aprendizagem =Aprendizagens.objects.get(codigo = x.codigo_aprendizagem).titulo
        return render(
            request,
            'geracao_relatorio/index.html',
          #    { 'aeejAprendizagensDados' : aeejAprendizagensDados}
        )