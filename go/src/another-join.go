package main

import (
	"fmt"
	"os"
	"strings"
)

func main() {
	fmt.Println("Program Name:", os.Args[0], "\tArguments:", strings.Join(os.Args[1:], " "))
}

