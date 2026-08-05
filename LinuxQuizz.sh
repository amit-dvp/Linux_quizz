#!/bin/bash

# -----------------------------------------------------------
#  This script is intended to help learn Linux Bash commands
#  Prepared by : Amit S.
#  Date        : 06.10.23  
# -----------------------------------------------------------
#
# before the start of use this script add directory of scripts to path, 
# go to myscripts folder and add it to $PATH system variable
# for example : 
#     cd ~/Documents/myscripts
#     export PATH="$PATH:$PWD"
#
# To run the script change user permissions to allow execute:  
#    chmod u+x LinuxExam.sh 
#    ./LinuxExam.sh
#
# -----------------------------------------------------------

while true; do
clear

ArrayMiscShell=('cd' 'ls' 'pwd' 'mkdir' 'cp' 'mv'
                'rm' 'rmdir' 'cat' 'tree' 
                'tree_-p' 'file' 'type' 'trash'   
                'history' 'touch' 
                'wc' 'bc' 'cal' 'date' 'sleep' 
                'nemo' 'find' 'shopt' 'wget' 'wine'
                'man' )

ArrayEditorsTextProcessing=('nano' 'echo' 'printf' 
                            'cat' 'grep')                

ArrayGccCommand=('gcc' 'nm' 'xxd' 'readelf' 'od' 'strace')

ArrayUserGroup=( 'finger'  'whoami'  'hostname' 'who'
                 'groups'  'members' 'adduser'
                 'useradd' 'deluser' 'userdel' 
                 'su'      'exit'    'passwd'
                 'usermod')
                    
ArrayTaskCtrl=( 'jobs'   'bg'     'fg'
				'disown' 'time'   'top'
				'htop'   'renice' 'kill' 
				'pgrep'  'pkill') 
              
ArrayFilePermissionsAndLinks=("ln_-s" 'ln' 
                              "ls_-l" 'stat' 
                              'chmod' 'cmod_-R') 

ArrayAdditionalInfo=('<tab>' '.' '..' '/' '~' 'globbing')                                 

printf "Chapters:
            1. Miscellaneous commands
            2. Editors, text operations
            3. GCC, binary files oper.
            4. User Group Operations
            5. Task Control Operations
            6. File permissions and links
            7. Additional Info\n"
printf "Select chapter: "
#read variable ChapterNum
read ChapterNum      
clear
                 
CommandNum=0

# delete array :
unset ChapterArray
 
case $ChapterNum in 
1) ChapterArray=("${ArrayMiscShell[@]}")   # to copy an array must use @ symbol and ()
   printf "Chapter $ChapterNum - Miscellaneous commands:\n";; 
2) ChapterArray=("${ArrayEditorsTextProcessing[@]}")   # to copy an array must use @ symbol and ()
   printf "Chapter $ChapterNum - GCC compiler, binary files:\n";; 
3) ChapterArray=("${ArrayGccCommand[@]}")   # to copy an array must use @ symbol and ()
   printf "Chapter $ChapterNum - GCC compiler, binary files:\n";; 
4) ChapterArray=("${ArrayUserGroup[@]}")   # to copy an array must use @ symbol and ()
   printf "Chapter $ChapterNum - User Group Operations:\n";;                                        
5) ChapterArray=("${ArrayTaskCtrl[@]}")
   printf "Chapter $ChapterNum - Task Control Operations:\n";;                                          
6) ChapterArray=("${ArrayFilePermissionsAndLinks[@]}")
   printf "Chapter $ChapterNum - File permissions and links:\n";; 
7) ChapterArray=("${ArrayAdditionalInfo[@]}")
   printf "Chapter $ChapterNum - Additional Info:\n";;                                           
esac

# Bash print command format explanation : https://linuxhandbook.com/bash-printf/
pFormat="%2s. %s\n"  

echo "--------------------------"
for i in ${ChapterArray[*]}; do
	printf "$pFormat" $CommandNum ${ChapterArray[$CommandNum]} 
	((CommandNum++))
done
echo "--------------------------"

printf "Select command: "
read CommandSelect;
clear

# string comparison: 
# Note: spaces between if and [ and ] are important !!!
UCommand=${ChapterArray[$CommandSelect]}
if [ "$UCommand" = "echo" ];then
  printf "echo command explain:\n\n"  
  printf 'Display line of text/string that
  are passed as an argument.
  Mostly used in shell scripts
  and batch files to output status
  text to the screen or a file'    
  printf "echo command examples:\n" 
  printf '  echo hello   world
  : hello world
  echo ""hello   world""
  : hello   world
  echo ~
  : /home/amit
  echo ""~""
  : ~
  echo ls *.txt
  : to see command after
  : expansion 
  echo ls[0-9][0-9][0-9].txt
  echo ls[^0-9].txt
  echo {1..9}
  :1 2 3 4 5 6 7 8 9
  '  
  printf "\n\nSelect option: (1-tldr, 2-man, 3-back, 4-exit)"
  read OptionSelect;     
      case $OptionSelect in 
      1) tldr `echo ${ChapterArray[$CommandSelect]}`;; 
      2) man `echo ${ChapterArray[$CommandSelect]}`;;                                        
      3) ;;
      4) exit 0;;                                       
      esac

elif [ "$UCommand" = "ls" ];then
  printf "ls command explain:\n\n"  
  printf '  List directory contents\n\n'
  printf "ls command examples:\n"
  echo ' ls           # files list (alef bet order)'  
  echo ' ls -l        # display detailed info - long format' 
  echo ' ls -a        # include hidden files'
  echo ' ls -lh       # size of files in human format'
  echo ' ls -R        # include subdirs'
  echo ' ls -ld docs  # dir info only'
  echo ' ls -t        # most recent first'
  echo ' ls -r        # oldest first'
  echo ' ls -S        # sort by size (largest first)'
  echo ' ll           # alias of ls -l'
  echo ""
  echo ' file types:'
  echo '  - : regular file'
  echo '  d : directory'
  echo '  l : link file'
  echo '  s : socket file'
  echo '  p : pipe file'
  echo '  c : char file'
  echo '  b : block file' 

  printf "\n\nSelect option: (1-tldr, 2-man, 3-back, 4-exit)"
  read OptionSelect;     
      case $OptionSelect in 
      1) tldr `echo ${ChapterArray[$CommandSelect]}`;; 
      2) man `echo ${ChapterArray[$CommandSelect]}`;;                                        
      3) ;;
      4) exit 0;;                                         
      esac

elif [ "$UCommand" = "nm" ];then
  printf "nm command explain:\n\n"  
  printf '  List symbols from object files\n\n'
  printf "\n\nSelect option: (1-tldr, 2-man, 3-back, 4-exit)"
  read OptionSelect;     
      case $OptionSelect in 
      1) tldr `echo ${ChapterArray[$CommandSelect]}`;; 
      2) man `echo ${ChapterArray[$CommandSelect]}`;;                                        
      3) ;;
      4) exit 0;;                                         
      esac

elif [ "$UCommand" = "readelf" ];then
  printf "readelf command explain:\n\n"  
  printf '  Display metadata information about ELF files\n\n'
  printf "readelf command example:\n"
  echo '   cd ~/C_programs; readelf -a ex1'  
  printf "\n\nSelect option: (1-tldr, 2-man, 3-back, 4-exit)"
  read OptionSelect;     
      case $OptionSelect in 
      1) tldr `echo ${ChapterArray[$CommandSelect]}`;; 
      2) man `echo ${ChapterArray[$CommandSelect]}`;;                                        
      3) ;;
      4) exit 0;;                                        
      esac

elif [ "$UCommand" = "xxd" ];then
  printf "xxd command explain:\n\n"  
  printf '  Hex representation of binary file\n\n'
  printf "readelf command example:\n"
  echo '   cd ~/C_programs; xxd ex1'  
  printf "\n\nSelect option: (1-tldr, 2-man, 3-back, 4-exit)"
  read OptionSelect;     
      case $OptionSelect in 
      1) tldr `echo ${ChapterArray[$CommandSelect]}`;; 
      2) man `echo ${ChapterArray[$CommandSelect]}`;;                                        
      3) ;;
      4) exit 0;;                                        
      esac

elif [ "$UCommand" = "gcc" ];then
  printf "gcc is C and C++ compiler\n\n"
  printf "To run gcc for single file:\n"
  printf "    gcc ex01.c -Wall -Wextra -Wshadow -Og -pedantic -std=c99 -lm -o program\n"  
  printf "    # -Wshadow : warn if shadow variables exist\n" 
  printf "    # -o       : output file name\n"
  printf "    # -O<num>  : set optimization level\n"
  printf "    # -O0      : reduce compilation time, allow debug\n"
  printf "    # -O1      : optimize\n"  
  printf "To run gcc for multiple files in folder:\n"
  printf "    gcc *.c -Wall -Wextra -Wshadow -O0 -pedantic -std=c99 -lm -o program\n"  
  echo '-----------------------'
  printf "Compilation stages:\n"
  printf "   1 Pre-processing\n"
  printf "   2 Compiling\n"
  printf "   3 Assembpling\n"
  printf "   4 Linking\n"
  echo '-----------------------'
  echo ""
  echo '  Preprocessor stage: -E (intermediate, translation unit): '
  echo '     gcc -E ex1.c -o ex1.i '
  echo "" 
  echo '  Compilation stage (Assembly instructions, still text): -S : '
  echo '     gcc -S ex1.c -o ex1.s'
  echo ""  
  echo "" 
  echo '  Assembly stage (binary object file before linker): -c '
  echo '     gcc -c ex1.c -o ex1.o'
  echo '     nm ex1.o'
  echo ""  
  printf "\n\nSelect option: (1-tldr, 2-man, 3-back, 4-exit)"
  read OptionSelect;     
      case $OptionSelect in 
      1) tldr `echo ${ChapterArray[$CommandSelect]}`;; 
      2) man `echo ${ChapterArray[$CommandSelect]}`;;                                        
      3) ;;
      4) exit 0;;                                       
      esac

elif [ "$UCommand" = "<tab>" ];then
  printf "<tab> explain:\n\n"  
  printf '  Press <tab> to autocomplete command\n'
  printf '  Press <tab tab> to see options for complete\n\n'
  
  printf "\n\nSelect option: (3-back, 4-exit)"
  read OptionSelect;     
      case $OptionSelect in 
      3) ;;
      4) exit 0;;                                         
      esac

elif [ "$UCommand" = "." ] || [ "$UCommand" = ".." ] || 
     [ "$UCommand" = "/" ] || [ "$UCommand" = "~" ];then
  printf "explain:\n\n"  
  printf '  .  : hard link to current dir.\n'
  printf '  .. : hard link to parent dir.\n'
  printf '  /  : hard link to root dir.\n' 
  printf '  ~  : hard link to user home dir.\n'   
  printf "\n\nSelect option: (3-back, 4-exit)"
  read OptionSelect;     
      case $OptionSelect in 
      3) ;;
      4) exit 0;;                                         
      esac

elif [ "$UCommand" = "." ] || [ "$UCommand" = ".." ] || 
     [ "$UCommand" = "/" ] || [ "$UCommand" = "~" ];then
  printf "explain:\n\n"  
  printf '  .  : hard link to current dir.\n'
  printf '  .. : hard link to parent dir.\n'
  printf '  /  : expansion to root dir.\n' 
  printf '  ~  : expansion to user home dir.\n'   
  printf "\n\nSelect option: (3-back, 4-exit)"
  read OptionSelect;     
      case $OptionSelect in 
      3) ;;
      4) exit 0;;                                         
      esac

elif [ "$UCommand" = "globbing" ] ;then
  printf 'Globbing examples : \n\n'
  printf '  ls *.txt            # * : any number of charachters\n'
  printf '  ls ?.txt            # ? : exactly one char\n'
  printf '  echo ??.txt         # ??: exactly two chars\n'
  printf '  echo 1?.txt         # 1?: one char after 1\n'
  printf '  echo *.????         # list of files with extention of 4 chars\n'
  printf '  echo ls *.txt       # to see a command after expansion\n'
  printf '  echo [123b]*        # files that begin only with 1,2,3,b\n'
  printf '  echo [0-9][0-9].txt # define option for 1st and 2nd char\n'
  printf '  echo [a-z].txt      # define option for 1st char\n'
  printf '  echo [^0-9]*.txt    # files that NOT(!) start with 0-9 char\n'
  printf '  echo {1..9}         # 1 2 3 4 5 6 7 8 9\n'
  printf '  echo {1..9}.txt     # 1.txt 2.txt 3.txt 4.txt 5.txt 6.txt 7.txt 8.txt 9.txt\n'   
  printf '  shopt -s failglob   # set failglob check in bash\n'
  printf '  shopt -u failglob   # unset failglob in bash\n' 


  printf "\n\nSelect option: (3-back, 4-exit)"
  read OptionSelect;     
      case $OptionSelect in 
      3) ;;
      4) exit 0;;                                         
      esac


else
  echo To see ${ChapterArray[$CommandSelect]} command info
  printf "\n\nSelect option: (1-tldr, 2-man, 3-back, 4-exit)"
  read OptionSelect;     
      case $OptionSelect in 
      1) tldr `echo ${ChapterArray[$CommandSelect]}`;; 
      2) man `echo ${ChapterArray[$CommandSelect]}` ;;                                        
      3) ;;
      4) exit 0;;                                        
      esac
fi

if [ "$OptionSelect" = "1" ];then 
   printf "Press any key to return main menu ..."
   read ConinueParam 
fi


done