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
                    lows[i "," j]=basin(i,j,a)
            }
        }
    }
    asort(lows, r)
    print r[length(r)]*r[length(r)-1]*r[length(r)-2]
}

func basin(x,y,a) {
    if (a[x][y]==0 || a[x][y]==10) { return 0 }
    # we can destructively alter the basin since they're all separated
    a[x][y]=0
    return 1+basin(x,y-1,a)+basin(x-1,y,a)+basin(x+1,y,a)+basin(x,y+1,a)
}
