func min(a,b) { return (a<b) ? a : b }
func max(a,b) { return (a>b) ? a : b }
func abs(x) { return (x<0) ? x*-1 : x }

BEGIN { FS="," }
{ for (i=1; i<=NF; i++) { l[$i]++ } }
END {
    minf=9999999999
    for (i in l) { mi=max(i, mi) }
    for (i=0; i<=mi; i++) {
        g=0;
        for (j in l) {
            d=abs(j-i);
            g+=d*l[j]
        }
        minf=min(minf,g)
    }
    print minf
}

