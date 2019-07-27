from sklearn import svm
from sklearn import datasets
from sklearn.externals import joblib

clf = svm.SVC()
iris = datasets.load_iris()
X, y = iris.data, iris.target
clf.fit(X, y)
joblib.dump(clf, 'model.pkl')