package main

import (
	"fmt"
	"html"
	"log"
	"net/http"
	"os"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello, %q", html.EscapeString(r.URL.Path))
	})

	port := os.Getenv("PORT")
	if port == "" {
		port = "8081"
	}

	log.Println("** Service Started on Port " + port + " **")
	if err := http.ListenAndServe(":"+port, nil); err != nil {
		log.Fatal(err)
	}

	// http.ListenAndServe(":"+port, nil)
}
