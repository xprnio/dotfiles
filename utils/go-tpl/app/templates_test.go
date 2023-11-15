package app_test

import (
	"go-tpl/app"
	"go-tpl/testutils"
	"strings"
	"testing"
)

func TestProcess(t *testing.T) {
	fs := &testutils.MockFileSystem{}

	sourceFile := "base_template.tpl"
	expectedResult := strings.Join(
		[]string{
			"# Base Template",
			"# Partial Template",
			"# I am a child",
			"# I am a child",
		},
		"\n",
	)
	result, err := app.ProcessTemplate(fs, sourceFile)

	if err != nil {
		t.Errorf("Error processing: %v", err)
	}

	if result != expectedResult {
		t.Errorf(
			"Result doesn't match.\nExpected: \n%s\nGot: \n%s\n",
			expectedResult,
			result,
		)
	}
}
