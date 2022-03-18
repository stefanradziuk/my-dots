#!/usr/bin/env python

import i3

outputs = i3.get_outputs()
workspaces = i3.get_workspaces()

# find the focused workspace
focused_workspace = next(filter(lambda s: s["focused"], workspaces))

# TODO instead use move workspace to output next?
# find the non-focused output
secondary_output = next(
    filter(
        lambda output: output["active"]
        and output["name"] != focused_workspace["output"],
        outputs,
    )
)

# move the current workspace to the secondary output
i3.command("move", f"workspace to output {secondary_output['name']}")

# focus the initially focused workspace
i3.workspace(focused_workspace["name"])
