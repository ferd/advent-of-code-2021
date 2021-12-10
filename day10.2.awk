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
                default: next
            }
        }
    }
    for (i=length(acc); i>=0; i--) {
        switch (acc[i]) {
            case "(": n[NR]=n[NR]*5+1; break;
            case "[": n[NR]=n[NR]*5+2; break;
            case "{": n[NR]=n[NR]*5+3; break;
            case "<": n[NR]=n[NR]*5+4; break;
        }
    }
}
END {
    asort(n)
    print n[int(length(n)/2)+1]
}

