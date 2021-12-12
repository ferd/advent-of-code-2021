# This is less than optimal as a search, but since Awk makes array so
# annoying to copy and manipulate around, we use a string to store
# the path, and regexes to search it. This works fine on the first
# part of the day (subsecond result) but takes close to 10 seconds to
# do part 2 with a recursive depth-first search.
#
# This is particularly more painful in p2 because annoying array stuff
# makes me cheat and just prefix the whole regex with '2' if a dupe
# has been set. It works but it's not elegant.
BEGIN { FS="-"; }
{ push(g, $1, $2); push(g, $2, $1) }
END {
    paths("start", ",start,");
    print res
}

func push(a,k,v) {
    a[k][length(a[k])]=v
}

func paths(node, p) {
    if (node == "end") { res++; return }
    for (n in g[node]) {
        if (p2 = visiting(g[node][n], p))
            paths(g[node][n], p2)
    }
}

func visiting(node, p) {
    if (node ~ /[A-Z]/) return p node ","
    if (p ~ "," node ",") {
        if (ALLOW_DUP == 0) { return 0 }
        if (node == "start") { return 0 }
        if (p ~ /^2,/) { return 0 }
        return "2" p node ","
    }
    return p node ","
}
