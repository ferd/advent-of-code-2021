BEGIN { FS="," }
{ for (i=1; i<=NF; i++) { l[$i]++ } }
END {
    for (i=1; i<=DAYS; i++) {
        t=l[0]
        for (j=0; j<8; j++) { l[j]=l[j+1] }
        l[8]=t; l[6]+=t
    }
    for (i in l) { c+=l[i] }
    print c
}
