from django.shortcuts import render
from django.http import HttpRequest
from django.template import RequestContext
from django.shortcuts import redirect
from django.views.generic.base import View
from datetime import datetime
from app.forms import *
from app.models import *

class index(View):
    template_name = 'geracao_relatorio/index.html'
    
    def get(self, request, *args, **kwargs):
        baseConsolidada = BaseConsolidada.objects.all()
        competenciasAprendizagens = CompetenciasAprendizagens.objects.all()
        competencias = Competencias.objects.all()
        jogadores = Jogadores.objects.all()
        niveisCompetenciaAvaliacao = NiveisCompetenciaAvaliacao.objects.all()

        itens = {}

        for i in baseConsolidada:
            competenciasRelacionadas = competenciasAprendizagens.filter(codigo_aprendizagem = i.codigo_aprendizagem)
            
            for j in competenciasRelacionadas:
                competencia = competencias.get(codigo = j.codigo_competencia.codigo)
                if not (i.codigo_jogador, j.codigo) in itens:
                    itens[(i.codigo_jogador, j.codigo)] = i.valor_aprendizagem * float(j.contribuicao_da_aprendizagem_na_competencia) / competencia.valor_maximo_pontos
                else:
                    itens[(i.codigo_jogador, j.codigo)] += i.valor_aprendizagem * float(j.contribuicao_da_aprendizagem_na_competencia) / competencia.valor_maximo_pontos
        
        itensRelatorioCompetencias = []
        for i in itens:
            nomeJogador = jogadores.get(codigo = i[0]).nome
            tituloCompetencia = competencias.get(codigo = i[1]).titulo

            niveisCompetenciaRelacionados = niveisCompetenciaAvaliacao.filter(codigo_competencia = i[1])
            tituloNivelCompetencia = ""
            for j in niveisCompetenciaRelacionados:
                if float(j.inicio_nivel) < itens[i] and float(j.fim_nivel) > itens[i]:
                    tituloNivelCompetencia = j.titulo
            itensRelatorioCompetencias.append(ItensRelatorioCompetencias(nomeJogador, tituloCompetencia, tituloNivelCompetencia))

            itensRelatorioAprendizagens = ViewAlunoAprendizagem.objects.all()
        return render(
            request,
            'geracao_relatorio/index.html',
            { 
                'itensRelatorioAprendizagens' : itensRelatorioAprendizagens,
                'itensRelatorioCompetencias' : itensRelatorioCompetencias,
            }
        )

class ItensRelatorioCompetencias:
    def __init__(self, nome, competencia, nivel):
        self.nome = nome
        self.competencia = competencia
        self.nivel = nivel