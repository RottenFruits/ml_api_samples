library(kernlab)
model <- readRDS("model/model.obj")

#* @post /predict
function(feature){
  df <- data.frame(Sepal.Length = feature[1],
             Sepal.Width =feature[2],
             Petal.Length = feature[3],
             Petal.Width = feature[4])
  #print(feature)
  return(print(predict(model, df)))
}
