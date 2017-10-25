from django.shortcuts import render
from django.http import HttpRequest
from django.template import RequestContext
from django.shortcuts import redirect
from django.views.generic.base import View
from datetime import datetime
from app.forms import *
from app.models import *

class index(View):
    template_name = 'CRUDs/etapas_jogo/index.html'

    def get(self, request, *args, **kwargs):
        codigo = request.GET.get('codigo', None)
        etapas_jogo = EtapasJogo.objects.all().order_by('codigo')
        if codigo:
            etapas_jogo = etapas_jogo.filter(codigo = codigo)
        return render(
            request,
            'CRUDs/etapas_jogo/index.html',
            { 'etapas_jogo' : etapas_jogo}
        )

class novo_alterar(View):
    template_name = 'CRUDs/etapas_jogo/novo_alterar.html'

    def get(self, request, *args, **kwargs):
        codigo = kwargs.get('codigo', None)
        item = None
        if codigo:
            item = EtapasJogo.objects.get(codigo=codigo)
        form = EtapasJogo_Form(instance = item)
        return render(
            request,
            self.template_name,
            {
                'item':item,
                'form':form,
            }
        )
    def post(self, request, *args, **kwargs):
        codigo = kwargs.get('codigo', None)
        item = None
        if codigo:
            item = EtapasJogo.objects.get(codigo=codigo)
        form = EtapasJogo_Form(request.POST, instance=item)
        if form.is_valid():
            if item:
                form.save(request.POST)
            else:
                form.save(request.POST)
            return redirect('etapas_jogo_index')
        else:
            return render(
                request,
                self.template_name,
                {'item':item,
                 'form':form}
            )

class deletar(View):
    template_name = 'CRUDs/etapas_jogo/deletar.html'

    def get(self, request, *args, **kwargs):
        codigo = kwargs.get('codigo', None)
        item = EtapasJogo.objects.get(codigo=codigo)
        return render(
            request,
            self.template_name,
            {'item':item}
        )

    def post(self, request, *args, **kwargs):
        codigo = kwargs.get('codigo', None)
        item = EtapasJogo.objects.get(codigo=codigo)
        item.delete()
        return redirect('etapas_jogo_index')