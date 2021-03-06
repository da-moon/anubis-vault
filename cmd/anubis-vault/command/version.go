package command

import (
	"bytes"
	"fmt"

	"github.com/mitchellh/cli"
)

// VersionCommand is a Command implementation prints the version.
type VersionCommand struct {
	Revision string
	Version  string
	UI       cli.Ui
}

var _ cli.Command = &VersionCommand{}

// Help ...
func (c *VersionCommand) Help() string {
	return "returns current release version"
}

// Synopsis ...
func (c *VersionCommand) Synopsis() string {
	return "returns current release version"
}

// Run ...
func (c *VersionCommand) Run(_ []string) int {
	var versionString bytes.Buffer
	fmt.Fprintf(&versionString, "anubis-vault v%s", c.Version)
	if c.Revision != "" {
		fmt.Fprintf(&versionString, " (%s)", c.Revision)
	}
	c.UI.Output(versionString.String())
	return 0
}
