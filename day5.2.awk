# Discovery of the day: you can use regexes as a field separator
func max(a,b) { return (a<b) ? b : a }
func abs(x) { return (x<0) ? x*-1 : x }

BEGIN { FS="[,> -]+"; m[0][0]=0 }
$1==$3 || $2==$4  || abs($3-$1) == abs($4-$2) {
    #    straight |  diagonal
    xi=$1==$3 ? 0 : ($3-$1)/abs($3-$1)
    yi=$2==$4 ? 0 : ($4-$2)/abs($4-$2)
    for (i=0; i<=max(abs($3-$1),abs($4-$2)); i++) {
        m[$1+i*xi][$2+i*yi]++
    }
}
END {
    for (i in m) {
        for (j in m[i]) {
            if (m[i][j]>1) { c++ }
        }
    }
    print c
}

