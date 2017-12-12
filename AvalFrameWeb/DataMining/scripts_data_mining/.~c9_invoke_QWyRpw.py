
from sklearn.externals import joblib


def classifica(sexo,data_nascimento,data_desde_quando_joga,Idade,coeficiente_de_rendimento,TipoJogoGosta):

    clf = joblib.load('tree.pkl')
    perfilJogador = clf.predict([[sexo,data_nascimento,data_desde_quando_joga,Idade,coeficiente_de_rendimento,TipoJogoGosta]])
    return perfilJogador
    
'''
x = classifica(0,2016,2017,15,85,1) 
print x

#O campo sexo e tipodejogoquegosta sao convertido para int senao da erro
F-              1
M-              0
['JogodeDisputa','JogoExploratorio','JogodeSocialização','JogodeExprendedorismo'] = [0,1,2,3] ainda vou confirma esse numeros
'''






























































