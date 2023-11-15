package app_test

import (
	"go-tpl/app"
	"testing"
)

type ParseIncludesCase struct {
	Source   string
	Includes []string
}

func TestParseIncludes(t *testing.T) {
	testCases := []ParseIncludesCase{
		{
			Source:   "#include(foo-bar.tpl)",
			Includes: []string{"foo-bar.tpl"},
		},
	}

	for _, testCase := range testCases {
		result := app.ParseIncludes(testCase.Source, "")

		if len(result) != len(testCase.Includes) {
			t.Errorf(
				"ParseIncludes returned invalid amount of results.\nExpected: %d\nGot: %d",
				len(result),
				len(testCase.Includes),
			)
		}

		for index, include := range result {
			if include.Filepath != testCase.Includes[index] {
				t.Errorf(
					"ParseIncludes returned invalid include path at index %d.\nExpected: %s\nGot: %s",
					index,
					testCase.Includes[index],
					include.Filepath,
				)
			}
		}
	}
}
