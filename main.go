package main

import (
	"fmt"
	bfjeldsversion "github.com/bfjelds/go-library/pkg/version"
)

var (
	version        string
	libraryversion string
	commit         string
	date           string
)

func main() {
	fmt.Printf("library version: %v\n", bfjeldsversion.GetVersion())
	fmt.Printf("Version:\n")
	fmt.Printf("    go-library: %v\n", libraryversion)
	fmt.Printf("    go-main:    %v\n", version)
	fmt.Printf("    commit:     %v\n", commit)
	fmt.Printf("    date:       %v\n", date)
}
