func push(a,b) { a[length(a)]=b }
func pop(a,   b) { b=a[length(a)-1]; delete a[length(a)-1]; return b }
BEGIN { FS=""; }
{
    delete acc
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
                       case ")": n+=3; break
                       case "]": n+=57; break
                       case "}": n+=1197; break
                       case ">": n+=25137; break
                   }
                   next
            }
        }
    }
}
END { print n }
