package main

import (
	"fmt"
	"go-tpl/app"
	"os"
)

func main() {
	if len(os.Args) != 2 {
		fmt.Println("Usage: " + os.Args[0] + " <source-file>")
		os.Exit(1)
	}

	fs := app.RealFileSystem{}
	sourceFile := os.Args[1]

	result, err := app.ProcessTemplate(fs, sourceFile)
	if err != nil {
		fmt.Fprint(os.Stderr, err)
		os.Exit(1)
	}

	fmt.Fprint(os.Stdout, result)
}
