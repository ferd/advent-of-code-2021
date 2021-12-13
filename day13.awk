# Today is haunted. I'm maybe too sleepy to figure out why but for
# some hellish reason I need to do y+0 or x+0 in the comparisons but
# without that comparisons fail and 30<5 or whatever.
# I couldn't figure it out, it's something to do with types, but casting
# with a +0 somehow fixes it.
#
# What the hell.
BEGIN { FS="," }
/,/ && NR=2 { a[$1][$2]=1 }
!/=/ && !/,/ { FS="="; next }
/^fold along y/ {
    delete b
    for (x in a) {
        for (y in a[x]) {
            b[x][((y+0)<=$2) ? y : ($2-(y-$2))]++
        }
    }
    copy(b,a)
    p1(a)
}
/^fold along x/ {
    delete b
    for (x in a) {
        for (y in a[x]) {
            b[((x+0)<=$2) ? x : ($2-(x-$2))][y]++
        }
    }
    copy(b,a)
    p1(a)
}

END {
    print "part 2"
    for (x in a) {
        if (x+0>mx+0) { mx=x+0 }
        for (y in a[x]) {
            if (y>my) { my=y }
        }
    }
    for (y=0; y<=my; y++) {
        for (x=0; x<=mx; x++) {
            c = (a[x][y] ? "#" : " ")
            printf "%s", c
        }
        print ""
    }
}

func copy(a,b,      i,j) {
    delete b
    for (i in a) {
        for (j in a[i]) {
            b[i][j]=a[i][j]
        }
    }
}
func p1(a,     x,y) {
    if (!p1_done) {
        for (x in a) { for (y in a[x]) { n++ }}
        print "part 1"; print n
        p1_done=1
    }
}
