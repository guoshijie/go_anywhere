#/bin/bash
#by zhangtaichao
#connect to Anywhere

function tips() {
	echo "
		******************************
		*                            *
		*    Connect to Anywhere!    *
		*         by gsj             *
		*                            *
		******************************
		"
}

tips
local=~/work/go_anywhere/local.txt

awk -F, '
BEGIN {
	#print "Please input your choice"
}
{
	printf "%-2s)-->%-18s path: %-35s\n",FNR,$1,$2
}
END {
    print "Q )-->Quit"
	print "\nPlease input your choice..."
}
' $local

read input
if [[ "$input" = "q" || "$input" = "Q" ]];then
    printf "Bye~\n\n"
else
    host=`awk -F, -v input=$input '
    {
        if(FNR==input) {
            print $2
        }
    }
    ' $local`

    if test -z $host;then
        echo "your select is error,Bye Bye!"
    else 
        echo "OK,Your select is "$host
        cd $host
    fi
fi


