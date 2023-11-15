package testdata

import "strings"

var MockFiles = map[string]string{
	"base_template.tpl": strings.Join(
		[]string{
			"# Base Template",
			"#include(part_template.tpl)",
			"#include(child_part_template.tpl)",
		},
		"\n",
	),
	"part_template.tpl": strings.Join(
		[]string{
			"# Partial Template",
			"#include(child_part_template.tpl)",
		},
		"\n",
	),
	"child_part_template.tpl": "# I am a child",
}
