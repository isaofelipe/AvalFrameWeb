create or replace view vw_aluno_aprendizagem as
select bc.codigo, j.nome as nome_jogador, a.titulo as titulo_aprendizagem, bc.data_inicio_jogo, bc.hora_inicio_jogo, bc.valor_aprendizagem, na.titulo as titulo_nivel_aprendizagem
from base_consolidada bc
inner join aprendizagens a
	on bc.codigo_aprendizagem = a.codigo
inner join niveis_aprendizagem na
	on bc.valor_aprendizagem between na.inicio_nivel and na.fim_nivel
inner join jogadores j
	on bc.codigo_jogador = j.codigo