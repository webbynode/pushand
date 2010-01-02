#! /bin/bash

#
# Undoes what pushand_server_install does.
#

source "$(dirname $0)/pushand_server_variables"

if [[ -f "$real_script_new_path" ]]; then
	if [[ ! -f "$real_script_path" ]]; then
		echo "You don't have permission to modify $real_script_path"
	else
		# restore the original git-receive-pack script
		mv $real_script_new_path $real_script_path

		# get rid of the copy of our post-receive hook that we no longer need
		rm $post_receive_hook_new_path

		# get rid of the directory we made to backup the original git-receive-hook in
		rm -r $real_script_new_dir

		echo 'pushand uninstalled'
	fi
else
	echo "$real_script_new_path doesn't exist."
fi
