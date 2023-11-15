package app

import (
	"io"
	"os"
)

// FileSystem is an interface representing file system operations.
type FileSystem interface {
	Open(filename string) (io.Reader, error)
}

// RealFileSystem is the implementation of the FileSystem interface that uses the real file system.
type RealFileSystem struct{}

// Open opens a file using the real file system.
func (rfs RealFileSystem) Open(filename string) (io.Reader, error) {
	file, err := os.Open(filename)
	if err != nil {
		return nil, err
	}
	return file, nil
}
