library(kernlab)
data(iris)
model <- ksvm(Species ~ ., iris)
saveRDS(model, "model/model.obj")
