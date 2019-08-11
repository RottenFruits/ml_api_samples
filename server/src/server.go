package main

import (
	"html/template"
	"net/http"
	"sync"
	"log"
)

type templateHandler struct {
	once     sync.Once
	filename string
	templ    *template.Template
}

func (t *templateHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	t.once.Do(func() {
		t.templ =
			template.Must(template.ParseFiles(t.filename))
	})
	t.templ.Execute(w, nil)
}

func main() {
	http.Handle("/", &templateHandler{filename: "index.html"})
	http.Handle("/julia", &templateHandler{filename: "index_julia.html"})
	http.Handle("/python", &templateHandler{filename: "index_python.html"})
	http.Handle("/r", &templateHandler{filename: "index_r.html"})
	if err := http.ListenAndServe(":8080", nil); err != nil {
		log.Fatal("ListenAndServe:", err)
	}
}
