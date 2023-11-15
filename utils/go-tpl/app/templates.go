package app

import (
	"io"
	"path/filepath"
	"strings"
)

func ProcessTemplate(fs FileSystem, sourcePath string) (string, error) {
	sourceFile, err := fs.Open(sourcePath)
	if err != nil {
		return "", err
	}

	bytes, err := io.ReadAll(sourceFile)
	if err != nil {
		return "", err
	}

	contents := string(bytes)
	includes := ParseIncludes(contents, filepath.Dir(sourcePath))

	for _, include := range includes {
		// Skip if the pattern is not included
		if !strings.Contains(contents, include.Pattern) {
			// TODO Maybe we should throw an error for cases such as this?
			continue
		}

		if include.Filepath == sourcePath {
			// TODO Maybe we should throw an error for cases such as this?
			continue
		}

		template, err := ProcessTemplate(fs, include.Filepath)
		if err != nil {
			return "", err
		}

		if len(template) == 0 {
			continue
		}

		contents = strings.ReplaceAll(contents, include.Pattern, template)
	}

	return contents, nil
}
