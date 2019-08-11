library(kernlab)
model <- readRDS("model/model.obj")

#* @filter cors
cors <- function(req, res) {
  res$setHeader("Access-Control-Allow-Origin", "*")

  if (req$REQUEST_METHOD == "OPTIONS") {
    res$setHeader("Access-Control-Allow-Methods","*")
    res$setHeader("Access-Control-Allow-Headers", req$HTTP_ACCESS_CONTROL_REQUEST_HEADERS)
    res$status <- 200 
    return(list())
  } else {
    plumber::forward()
  }

}

#* @serializer unboxedJSON
#* @post /predict
function(feature){
  df <- data.frame(Sepal.Length = as.integer(feature[1]),
             Sepal.Width = as.integer(feature[2]),
             Petal.Length = as.integer(feature[3]),
             Petal.Width = as.integer(feature[4])
             )
  #print(feature)
  x <- list(prediction = predict(model, df))
  return(x)
}
