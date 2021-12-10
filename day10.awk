func push(a,b) { a[length(a)]=b }
func pop(a,   b) { b=a[length(a)-1]; delete a[length(a)-1]; return b }

BEGIN { FS=""; }
{
    delete acc;
    for (i=0; i<=NF; i++) {
        if ($i ~ /[[{<(]/) { push(acc, $i) }
        else {
            switch (pop(acc) $i) {
                case "[]": break
                case "{}": break
                case "()": break
                case "<>": break
                default:
                    switch($i) {
                       case ")": p1+=3; break
                       case "]": p1+=57; break
                       case "}": p1+=1197; break
                       case ">": p1+=25137; break
                   }
                   next
            }
        }
    }
    for (i=length(acc); i>=0; i--) {
        switch (acc[i]) {
            case "(": p2[NR]=p2[NR]*5+1; break;
            case "[": p2[NR]=p2[NR]*5+2; break;
            case "{": p2[NR]=p2[NR]*5+3; break;
            case "<": p2[NR]=p2[NR]*5+4; break;
        }
    }
}
END {
    asort(p2)
    print "p1:", p1, "p2:", p2[int(length(p2)/2)+1]
}
