package testutils

import (
	"errors"
	"go-tpl/testdata"
	"io"
	"strings"
)

// MockFileSystem is a mock implementation of the FileSystem interface.
type MockFileSystem struct{}

// Open simulates opening files based on their names.
func (fs MockFileSystem) Open(filename string) (io.Reader, error) {
	if content, exists := testdata.MockFiles[filename]; exists {
		return strings.NewReader(content), nil
	}

	return nil, errors.New("File not found")
}
