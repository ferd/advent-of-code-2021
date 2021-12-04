# I particularly like the little trick of using the byte*2-1 to
# get either a +1 or -1 increment that lands the counter at <0
# if the most common byte is 0, and >0 if it’s 1 (0 if equal),
# so doing a b[i]>0 casts the value to “most common” and b[i]<0
# casts it to “least common” since true/false are 1/0 respectively.

BEGIN {FS=""}

{ for (i=1; i<=NF; i++) { b[i] += $i*2-1 } }

END {
    for (i=1; i<=NF; i++) {
        g=lshift(g,1)+(b[i]>0)
        e=lshift(e,1)+(b[i]<0)
    }
    print g*e
}

