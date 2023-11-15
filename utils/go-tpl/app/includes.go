package app

import (
	"path/filepath"
	"regexp"
)

type ParsedInclude struct {
	Pattern  string
	Filepath string
}
type ParsedIncludes []ParsedInclude

func ParseIncludes(content, path string) ParsedIncludes {
	re := regexp.MustCompile(`#include\((.+)\)`)
	matches := re.FindAllStringSubmatch(content, -1)
	result := ParsedIncludes{}

	for _, match := range matches {
		result = append(result, ParsedInclude{
			Pattern:  match[0],
			Filepath: filepath.Join(path, match[1]),
		})
	}

	return result
}
