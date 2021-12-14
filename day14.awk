# each rule is there only once, so we can use an array to count changes. If
# we have the string NNCB, and NN --> V, then a[NN]-- and a[NV]++ and a[VN]++.
BEGIN { FS="" }
NR==1 {
    for (i=1; i<=NF; i++) { acc[$i]++ }
    for (i=2; i<=NF; i++) { a[$(i-1) $i]++ }
}
NR==2 { FS=" " }
/->/ { rule[$1]=$3 }

END {
    for (i=1; i<=40; i++) {
        copy(a, b)
        for (r in rule) {
            matches = a[r]
            if(matches > 0) {
                split(r, parts, "")
                b[r]-=matches
                b[parts[1] rule[r]]+=matches
                b[rule[r] parts[2]]+=matches
                acc[rule[r]]+=matches
            }
        }
        copy(b, a)
        if(i==10) {
            copy(acc,accp1)
            asort(accp1)
            print "part 1", accp1[length(acc)]-accp1[1]
        }
    }
    asort(acc)
    print "part 2", acc[length(acc)]-acc[1]
}

func copy(a,b,      i) {
    delete b
    for (i in a) { b[i]=a[i] }
}
