from sklearn import tree
import pandas as pd
import numpy as np

def handle_non_numerical_data(df):
    columns = df.columns.values
    for column in columns:
        text_digit_vals = {}
        def convert_to_int(val):
            return text_digit_vals[val]
        if df[column].dtype != np.int and df[column].dtype != np.float:
            column_contents = df[column].values.tolist()
            unique_elements = set(column_contents)
            x=0
            for unique in unique_elements:
                if unique not in text_digit_vals:
                    text_digit_vals[unique] = x
                    x+=1
            df[column] = list(map(convert_to_int, df[column]))
    return df

def classifica(sexo,idade,data_desde_quando_joga,coeficiente_de_rendimento,tipo_jogo_preferido):
    
    alun = pd.read_csv('teste19.csv',delimiter=',')
    
    alun = handle_non_numerical_data(alun)
    
    alun.data = alun.values[:,0:5]
    alun.target = alun.values[:,5]
    
    
    
    clf = tree.DecisionTreeClassifier()
    clf = clf.fit(alun.data,alun.target)
    
    vet = []
    
    if(sexo is 'M'):
        vet.append(0)
    else:
        vet.append(1)
        
    vet.append(idade)
    vet.append(data_desde_quando_joga)
    vet.append(coeficiente_de_rendimento)
    
    if tipo_jogo_preferido is 'FPS':
        vet.append(0)
    if tipo_jogo_preferido is 'rpg':
        vet.append(0)
    if tipo_jogo_preferido is 'pilotagem':
        vet.append(0)
    if tipo_jogo_preferido is 'exploracao':
        vet.append(0)
    if tipo_jogo_preferido is 'socializacao':
        vet.append(0)
    
    resultado = clf.predict([vet])
    return resultado

x = classifica('F',16,2005,80,'FPS')
print x


'''
M-0
F-1
------------
FPS-0
PILOTAGEM-1
SOCIALIZACAO-2
RPG-3
EXPLORACAO-4
-------------
RESULTADO:
muitoFacil-0
facil-3
medio-4
dificil-2
muitoDificil-1

'''


