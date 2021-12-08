function find_len(len, arr,      i) {
    for (i in arr) {
        if (length(arr[i]) == len) { return arr[i] }
    }
}
function excl(a, b,       tmp) {
    tmp = b
    gsub("[" a "]", "", tmp)
    return tmp
}
function contains(str, pattern) {
    return length(excl(pattern, str)) == (length(str)-length(pattern))
}
function find_contains(len, pattern, arr,      i) {
    for (i in arr) {
        if (length(arr[i]) == len && contains(arr[i], pattern)) {
            return arr[i]
        }
    }
}
func sortc(s,   i,a,t) {
    split(s,a,"")
    for (i=1; i<=asort(a); i++) {
        t = t a[i]
    }
    return t
}

{
    for (i=1; i<=10; i++) { constraint[i]=$i }
    n1 = find_len(2, constraint)
    n4 = find_len(4, constraint)
    n7 = find_len(3, constraint)
    n8 = find_len(7, constraint)
    n3 = find_contains(5, n1, constraint)
    n9 = find_contains(6, n3, constraint)
    aaaa = excl(n1, n7)
    ee = excl(n9, n8)
    bb = excl(n3, n9)
    n2 = find_contains(5, ee, constraint)
    ff = excl(n2, n3)
    cc = excl(ff, n1)
    n5 = find_contains(5, bb, constraint)
    gggg = excl(bb cc ff, n4)
    dddd = excl(n4 aaaa, n9)
    n6 = aaaa bb dddd ee ff gggg
    n0 = aaaa bb cc ee ff gggg
    delete v # don't cross-pollute runs
    v[sortc(n0)]="0"; v[sortc(n1)]="1"; v[sortc(n2)]="2"; v[sortc(n3)]="3"; v[sortc(n4)]="4";
    v[sortc(n5)]="5"; v[sortc(n6)]="6"; v[sortc(n7)]="7"; v[sortc(n8)]="8"; v[sortc(n9)]="9";
    num = v[sortc($12)]*1000+v[sortc($13)]*100+v[sortc($14)]*10+v[sortc($15)]
    #print "segments:", "a:" aaaa, "b:" bb, "c:" cc, "d:" dddd, "e:" ee, "f:" ff, "g:" gggg
    #print "0:" n0, "1:" n1, "2:" n2, "3:" n3, "4:" n4, "5:" n5, "6:" n6, "7:" n7, "8:" n8, "9:" n9
    tot+=num
}
END { print tot }
