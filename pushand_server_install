#! /bin/bash

#
# Overrides git-receive-pack on the current computer so, 
# when a repository is pushed to the computer, the repository 
# is created locally and, if it contains a .pushand script, 
# it will run the .pushand script.
#

source "$(dirname $0)/pushand_server_variables"

if [[ -f "$real_script_new_path" ]]; then
	echo "$real_script_new_path already exists"
else
	if [[ ! -w "$real_script_path" ]]; then
		echo "You don't have permission to modify $real_script_path"
	else 
		# make the directory that we back up git-receive-pack in.
		# it has to be in a directory because the script *must* keep 
		# the name 'git-receive-pack' (in the latest versions of git)	
		mkdir -p $real_script_new_dir

		# move the real git-receive-pack
		mv $real_script_path $real_script_new_path

		# copy our git-receive-pack to where the real one was
		cp $our_script_path $real_script_path

		# copy our post-receive hook (which we register with all git repos) 
		# somewhere where we can easily get to it
		cp $post_receive_hook_path $post_receive_hook_new_path

		echo 'pushand installed'
	fi
fi
