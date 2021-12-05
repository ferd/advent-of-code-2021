# Discovery of the day: you can use regexes as a field separator
func min(a,b) { return (a<b) ? a : b }
func max(a,b) { return (a<b) ? b : a }
BEGIN { FS="[,> -]+"; m[0][0]=0 }
$1==$3 || $2==$4 {
    for (i=min($1,$3); i<=max($1,$3); i++) {
        for (j=min($2,$4); j<=max($2,$4); j++) {
            m[i][j]++
        }
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
