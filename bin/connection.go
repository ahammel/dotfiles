package main

import "net/http"

func main() {
	_, err := http.Get("http://www.google.com")
	if err != nil {
		print("Not Connected\n")
	} else {
		print("Connected\n")
	}
	return
}
