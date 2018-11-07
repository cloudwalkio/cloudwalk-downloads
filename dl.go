package main

import (
	"fmt"
	"net/http"
	"os"

	"github.com/gorilla/mux"
	"google.golang.org/appengine"
)

func init() {
	r := mux.NewRouter()
	r.HandleFunc("/{file}", func(w http.ResponseWriter, r *http.Request) {
		vars := mux.Vars(r)
		http.Redirect(w, r, fmt.Sprintf("%s%s", os.Getenv("BASE_URL"), vars["file"]), http.StatusSeeOther)
	})
	r.HandleFunc("/{folder}/{file}", func(w http.ResponseWriter, r *http.Request) {
		vars := mux.Vars(r)
		http.Redirect(w, r, fmt.Sprintf("%s%s/%s", os.Getenv("BASE_URL"), vars["folder"], vars["file"]), http.StatusSeeOther)
	})
	r.NotFoundHandler = http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		http.Redirect(w, r, "https://www.cloudwalk.io", http.StatusSeeOther)
	})
	http.Handle("/", r)
}

func main() {
	appengine.Main()
}
