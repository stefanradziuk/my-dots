import operator

import i3ipc


# def debug(obj):
#     import json
#
#     print(json.dumps(obj.__dict__, sort_keys=True, indent=4, default=str))

# TODO empty workspace on secondary output handling


def main():
    i3 = i3ipc.Connection()

    # gets a list of workspaces, sorted by num
    workspaces = sorted(i3.get_tree().workspaces(), key=operator.attrgetter("num"))
    # non_empty_workspaces = filter(
    #     lambda workspace: len(workspace.nodes) + len(workspace.floating_nodes) > 0,
    #     workspaces,
    # )

    # move the workspaces to their desired numbers
    for i, workspace in enumerate(workspaces):
        idx_curr = workspace.ipc_data['name']
        idx_target = i + 1
        i3.command(f"rename workspace {idx_curr} to {idx_target}")

        # print(f"curr: {idx_curr}")
        # print(f"target: {idx_target}")

        # node = (workspace.nodes if len(workspace.nodes) > 0 else workspace.floating_nodes)[0]
        # workspace_output = node.ipc_data["output"]
        # print(workspace_output)
        # outputs.append(workspace_output)

        # # if this workspace contains the focused window
        # # focus the workspace it's being moved to
        # if workspace.find_focused() is not None:
        #     i3.command(f"workspace {i + 1}")

        # move_cmd = f"move to workspace {i + 1}"
        # workspace.command_children(move_cmd)
        # for floating_node in workspace.floating_nodes:
        #     floating_node.command(move_cmd)

    # workspaces = sorted(i3.get_tree().workspaces(), key=operator.attrgetter("num"))
    # for output, workspace in zip(outputs, workspaces):
    #     print(f"moving {workspace.ipc_data['name']} to {output}")
    #     workspace.command(f"move to output {output}")


if __name__ == "__main__":
    main()
