package main

import (
    "html/template"
    "log"
    "net/http"
)

func indexHandler(w http.ResponseWriter, r *http.Request) {
    tmpl := template.Must(template.ParseFiles("templates/index.html"))
    tmpl.Execute(w, nil)
}

func helloHandler(w http.ResponseWriter, r *http.Request) {
    w.Write([]byte("<div class='response'>Hello, HTMX!</div>"))
}

func main() {
    http.HandleFunc("/", indexHandler)
    http.HandleFunc("/hello", helloHandler)

    log.Println("Servidor rodando em http://localhost:8080")
    log.Fatal(http.ListenAndServe(":8080", nil))
}

