using RDatasets: dataset
using SVM
using JLD


iris = dataset("datasets", "iris")
X = convert(Array, iris[:, 1:4])'
p, n = size(X)
y = [species == "setosa" ? 1.0 : -1.0 for species in iris[:Species]]
model = svm(X, y)

save("model.jld", "model", model)
