package main

import "fmt"

func suma() float32 {

	var num1, num2 int
	fmt.Print("Ingrese numero 1: ")
	fmt.Scan(&num1)

	fmt.Print("Ingrese numero 2: ")
	fmt.Scan(&num2)

	return float32(num1 + num2)
}
