BEGIN { FS=""; a[0][0]=0 }

{ for (i=1; i<=NF; i++) { a[NR][i]=$i+1 } }

END {
    for (i=1; i<=NR; i++) {
        for (j=1; j<=NF; j++) {
            x=a[i][j]
            if ((0==a[i-1][j] || x<a[i-1][j]) &&
                (0==a[i+1][j] || x<a[i+1][j]) &&
                (0==a[i][j+1] || x<a[i][j+1]) &&
                (0==a[i][j-1] || x<a[i][j-1])) {
                    n+=x
            }
        }
    }
    print n
}
