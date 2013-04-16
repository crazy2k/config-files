#!/usr/bin/python

import i3

if __name__ == "__main__":
    workspaces = i3.get_workspaces()

    current_workspace = filter(lambda w: w["focused"], workspaces)[0]
    last_workspace = workspaces[-1]

    next_workspace_num = current_workspace["num"] + 1

    if current_workspace["num"] == last_workspace["num"]:
        i3.workspace(str(next_workspace_num))

    i3.workspace(str(next_workspace_num))
