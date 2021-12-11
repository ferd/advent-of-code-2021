BEGIN { FS=""; a[1][1]=0 }
{ for (i=1; i<=NF; i++) { a[NR][i]=$i } }
END { while (++s > 0) { step(a,NR,NF) } }

func step(a,x,y) {
    flashes(a,x,y)
    reset(a,x,y)
}

func flashes(a,x,y,   i,j,n) {
    for (i=1; i<=y; i++) {
        for (j=1; j<=x; j++) {
            n += flash(a,i,j,x,y)
        }
    }
    if (n==x*y) {
        print s; exit
    }
}
func flash(a,i,j,x,y,   n) {
    if (i<1 || i>y || j<1 || j>x) return 0
    a[i][j]++
    if (a[i][j] != 10) return 0
    n += flash(a,i-1,j-1,x,y)+flash(a,i-1,j,x,y)+flash(a,i-1,j+1,x,y)
    n += flash(a,i,j-1,x,y)  + 1            +flash(a,i,j+1,x,y)
    n += flash(a,i+1,j-1,x,y)+flash(a,i+1,j,x,y)+flash(a,i+1,j+1,x,y)
    return n
}

func reset(a,x,y,   i,j) {
    for (i=1; i<=y; i++) {
        for (j=1; j<=x; j++) {
            if (a[i][j] > 9)
                a[i][j]=0
        }
    }
}
