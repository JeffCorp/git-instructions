#!/bin/bash

git() {
	total="$@";
	last="${total##* }";
	RED='\033[0;31m'
	NC='\033[0m' # No Color
	case "$1" in
	
		"add")
			echo "Kindly follow these hints";
			printf "${RED} ============== ${NC} \n";
			printf "${RED} General rules ${NC} \n";
			printf "${RED} ============== ${NC} \n";
			echo "1. Try deleting irrelevant console.logs";
			echo "2. converting == to === (except for particular intentions)";
			echo "3. Added space before and after if (e.g if () {...})"; 
			echo "4. Added space before and after = "; 
			echo "4. Which the indentations. Make sure to use 4 space indentations.";
			echo "4. Added space before and after = "; 
			
			printf "${RED} ============== ${NC} \n";
			printf "${RED} New line rules ${NC} \n";
			printf "${RED} ============== ${NC} \n";
			echo "5. Add new line - Between the variable definition statements and normal statements.";
			echo "6. Add without new line - All of the variable definitions."
			echo "7. Add without new line - Other normal statements after variable declaration";
			echo "8. If there are control statements like if, for, while, switch..., we should put new line before that, except when those are the first line of the code block.";
            echo "9. If there are return statements, we should put a new line before that, except when those are the first line of the code block.";
			echo "10. Always add a new line at the end of a file"
			printf "${RED} ============== ${NC} \n";
			echo "11. Don't forget to check previous comments on MRs";
			echo "12. When all is done, don't forget to create an MR if it does not exist"; 
			echo " - Acknowledgement Christer Ekker";
			random=$RANDOM;
			echo "Input $random to continue or any other key to cancel";
			read -p "Have you confirmed these have been done:" choiceinput;
			if [[ "$choiceinput" = $random ]]; then 
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
