# Carregar biblioteca

library(rpart)

#Carregando bases de dados

DadosIris <- read.csv('DecisionTree/irisr.csv')
DadosCasas <- read.csv('DecisionTree/AvaliacaodeCasas.csv')

# Modelo iris

irisTree <- rpart(Species~SepalLength+
                SepalWidth+
                PetalLength+
                PetalWidth, 
                data = DadosIris)


print(irisTree)

plot(irisTree)
text(irisTree, use.n = TRUE, 
                all = TRUE, 
                cex = 0.8)


# Modelo Casas

# --------- Treino --------------

ModeloCasasTreino <- rpart(Classe~Local + Estado + Idade + Garagem, 
                    data = DadosCasas)

print(ModeloCasasTreino)
plot(ModeloCasasTreino)
text(ModeloCasasTreino, 
    use.n=TRUE,
    all = TRUE,
    cex = 0.8)


# ---------- Predição ---------------

DadosCasas.previsão <- predict( ModeloCasasTreino, 
                                DadosCasas,
                                type='class'
                                                    )
DadosCasas.MatrizConfusao <- table(DadosCasas$Classe,
                                    DadosCasas.previsão)
        
print(DadosCasas.MatrizConfusao)

# -------- Erro --------------

diagonal <- diag(DadosCasas.MatrizConfusao)
prec.erro <- 1-sum(diagonal)/sum(DadosCasas.MatrizConfusao)
print(prec.erro)