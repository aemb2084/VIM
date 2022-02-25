package main

import (
	"fmt"
)

func main() {

	suma1 := suma()
	fmt.Printf("La suma = %v \n", suma1)
	fmt.Printf("La resta = %v \n", resta(5, 6))
	fmt.Printf("La multiplicacion = %v \n", mult(5, 6))
	fmt.Printf("La divición es = %0.2f \n", div(5, 6))

	// creando algo de texto en mi vim

	switch suma1 {
	case 1:
		fmt.Println(" La suma es 1")
	case 10:
		fmt.Println(" La suma es 10")
	default:
		fmt.Println(" La suma es diferente de anteriores")
	}

}
