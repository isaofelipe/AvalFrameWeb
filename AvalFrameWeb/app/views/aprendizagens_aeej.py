from django.shortcuts import render
from django.http import HttpRequest
from django.template import RequestContext
from django.shortcuts import redirect
from django.views.generic.base import View
from datetime import datetime
from app.forms import *
from app.models import *

class index(View):
    template_name = 'CRUDs/aprendizagens_aeej/index.html'

    def get(self, request, *args, **kwargs):
        codigo = request.GET.get('codigo', None)
        aprendizagens_aeej = AprendizagensAeej.objects.all().order_by('codigo')
        if codigo:
            aprendizagens_aeej = aprendizagens_aeej.filter(codigo = codigo)
        return render(
            request,
            'CRUDs/aprendizagens_aeej/index.html',
            { 'aprendizagens_aeej' : aprendizagens_aeej}
        )

class novo_alterar(View):
    template_name = 'CRUDs/aprendizagens_aeej/novo_alterar.html'

    def get(self, request, *args, **kwargs):
        codigo = kwargs.get('codigo', None)
        item = None
        if codigo:
            item = AprendizagensAeej.objects.get(codigo=codigo)
        form = AprendizagensAeej_Form(instance=item)
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
            item = AprendizagensAeej.objects.get(codigo=codigo)
        form = AprendizagensAeej_Form(request.POST, instance=item)
        if form.is_valid():
            form.save(request.POST)
            return redirect('aprendizagens_aeej_index')
        else:
            return render(
                request,
                self.template_name,
                {'item':item,
                 'form':form}
            )

class deletar(View):
    template_name = 'CRUDs/aprendizagens_aeej/deletar.html'

    def get(self, request, *args, **kwargs):
        codigo = kwargs.get('codigo', None)
        item = AprendizagensAeej.objects.get(codigo=codigo)
        return render(
            request,
            self.template_name,
            {'item':item}
        )

    def post(self, request, *args, **kwargs):
        codigo = kwargs.get('codigo', None)
        item = AprendizagensAeej.objects.get(codigo=codigo)
        item.delete()
        return redirect('aprendizagens_aeej_index')