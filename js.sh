#!/bin/bash

git() { 
	case "$1" in
	
		"commit")
			echo "Kindly follow these hints";
			echo "1. Try edit deleting console.logs";
			echo "2. converting == to === ";
			echo "3. Added space before and after if (e.g if () {...})"; 
			echo "4. When all is done, don't forget to create an MR if it does not exist"; 
			read  -n 1 -p "Have you confirmed these have been done:" choiceinput;
			if [[ "choiceinput" = "Y" || "choiceinput" = "y" || "choiceinput" = "Yes" || "choiceinput" = "yes" ]]; 
				then command git "${@}";
			fi;
		;;

		"push")
			echo "When push is completed, don't forget to create an MR for $3 if it does not exist";

			osascript -e 'display notification "Have you created an MR for '$3'" with title "MR notification" sound name "Glass"';
			command git "${@}";
		;;
		*)
			command git "${@}";
			;;
	esac	
}