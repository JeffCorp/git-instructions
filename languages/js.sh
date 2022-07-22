#!/bin/bash

git() { 
	total="$@";
	last="${total##* }";
	case "$1" in
	
		"commit")
			echo "Kindly follow these hints";
			echo "1. Try edit deleting console.logs";
			echo "2. converting == to === (except for particular intention)";
			echo "3. Added space before and after if (e.g if () {...})"; 
			echo "4. When all is done, don't forget to create an MR if it does not exist"; 
			echo "Input \"y\" to continue or any other key to cancel";
			read  -n 1 -p "Have you confirmed these have been done:" choiceinput;
			if [[ "$choiceinput" = "y" ]]; then 
				printf "\n";
				command git "${@}";
			fi;
		;;

		"push")
			echo "When push is completed, don't forget to create an MR for $3 if it does not exist";

			[[ $OSTYPE == 'darwin'* ]] && osascript -e 'display notification "When push is completed, do not forget to create an MR for '$3' if it does not exist" with title "MR notification" sound name "Glass"';
			command git "${@}";
		;;
		*)
			command git "${@}";
			;;
	esac	
}