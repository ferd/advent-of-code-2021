# represent the drawn number as an array; use a[0] for tracking drawn numbers
# represent the bingo card as a flat array, navigate 5x5; draw numbers by -1
# values in the map, and check/count accordingly
func push(a,b) { a[length(a)]=b }
func mark(a,di,  ai) {
    # can't use for (ai in a) {...} here because the '0' value at index 0
    # used for initialization to make push() usable messes things up :(
    for (ai=1; ai<=25; ai++) {
        if (a[ai]==di) { a[ai] = -1; return }
    }
}
func win(a,    i) {
    for (i=1; i<=21; i+=5) { # rows
        if (a[i]+a[i+1]+a[i+2]+a[i+3]+a[i+4]==-5) { return 1 }
    }
    for (i=1; i<=5; i++) { # cols
        if (a[i]+a[i+5]+a[i+10]+a[i+15]+a[i+20]==-5) { return 1 }
    }
}
func score(a,   i,c) {
    for (i in a) { if (a[i] != -1) { c+=a[i] } }
    return c
}
NR == 1 { split($0,drawn,","); next }
$0 == "" { bc++; b[bc][0]=0 } # hack to initialize two-dimensional arrays
$0 != "" { push(b[bc],$1); push(b[bc],$2); push(b[bc],$3); push(b[bc],$4); push(b[bc],$5); next }
END {
    for (d in drawn) {
        di=drawn[d];
        for (bc in b) {
            mark(b[bc], di)
            if (win(b[bc])) {
                last=score(b[bc])*di
                delete b[bc]
            }
        }
    }
    print last
}

