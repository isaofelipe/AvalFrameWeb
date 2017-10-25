# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desidered behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from __future__ import unicode_literals

from django.db import models

class AeejAprendizagensDados(models.Model):
    codigo = models.AutoField(primary_key=True)
    nome_jogo = models.CharField(blank=True, null=True)
    codigo_jogador = models.IntegerField()
    nome_jogador = models.CharField(blank=True, null=True)
    data_inicio_jogo = models.DateField(blank=True, null=True)
    hora_inicio_jogo = models.TimeField(blank=True, null=True)
    codigo_aprendizagem = models.IntegerField(blank=True, null=True)
    nome_aprendizagem = models.CharField(blank=True, null=True)
    valor_aprendizagem = models.DecimalField(max_digits=10, decimal_places=0, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'aeej_aprendizagens_dados'
 
class RelatorioAlunos(models.Model):
    codigo = models.AutoField(primary_key=True)
    codigo_jogador = models.IntegerField()
    data_inicio_sessao_jogo = models.DateField(blank=True, null=True)
    hora_inicio_sessao_jogo = models.TimeField(blank=True, null=True)
    codigo_jogo = models.IntegerField()
    nivel_jogo = models.IntegerField()
    fase_jogo = models.IntegerField()
    etapa_jogo = models.IntegerField()
    codigo_aeej = models.IntegerField()
    tipo_aeej = models.CharField(max_length=1, blank=True, null=True)
    valor_aeej = models.IntegerField(blank=True, null=True)
    data_gravacao = models.DateField(blank=True, null=True)
    hora_gravacao = models.TimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'relatorio_alunos'