import i3ipc
import operator

i3 = i3ipc.Connection()

# gets a list of workspaces, sorted by num
workspaces = sorted(i3.get_tree().workspaces(), key=operator.attrgetter("num"))

# move the workspaces to their desired numbers
for i, workspace in enumerate(workspaces):
    # todo check for dual-monitor visibility
    # todo restore focus
    # if this workspace contains the focused window
    # switch to the workspace it's being moved to
    for leaf in workspace.leaves():
        print("leaf of workspace no %d, focused? %s" % (i + 1, workspace.focused))
    if workspace.find_focused() != None:
        i3.command("workspace %d" % (i + 1))

    # move all of the workspace's children to the desired workspace
    workspace.command_children("move to workspace %d" % (i + 1))


