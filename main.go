package main

import (
	"fmt"
	"github.com/bfjelds/go-library/pkg/version"
)

func main() {
	fmt.Printf("library version: %v\n", version.GetVersion())
}
