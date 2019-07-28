library(plumber)
rapi <- plumb("app/predict.R")
rapi$run(host="0.0.0.0", port = 6000)