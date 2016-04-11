#/bin/bash
#by zhangtaichao
#connect to Anywhere
saved=$(pwd)
cd $(dirname $0)
#base=$(pwd -P)
base=/Users/shinc/work/go_anywhere/
base=$base/servers.txt
cd $saved
function tips() {
	echo "
******************************
*                            *
*    connect to Anywhere!    *
*        by ztc              *
*                            *
******************************
"
}
tips
awk -F, '
BEGIN {
	#echo "Please input your choice..."
}
{
	if(NF==4) {
        printf "%-2s)-->%-35s%-45s password:%-30s command:%-5s\n",FNR,$4,$2,$3,$1	
	}else if(NF==3) {
		printf "%-2s)-->%-35scommand:%-5s %-45s \n",FNR,$3,$1,$2	
	}else {
		print $0
	}
}
END {
    printf "Q )-->Quit\n"
	print "\nPlease input your choice..."
}
' $base
read input
if [[ "$input" = "q" || "$input" = "Q" ]];then
    printf "Bye~\n\n"
    exit
fi
host=`awk -F, -v input=$input '
{
	if(FNR==input) {
		print $1,$2	
	}
}
' $base`
if test -z "$host" ;then
echo "your select is error,Bye Bye!"
exit
fi
echo "Your select is "$host
$host
