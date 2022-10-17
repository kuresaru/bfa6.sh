{
  a[$1,$2] = $3
} END {
  for (i in a) {
    split(i, j, SUBSEP);
    if (j[2] == "attribute") {
      if (a[i] == 6) {
        uname = a[j[1],"uname"]
        sign = a[j[1],"sign"]
        uname = substr(uname, 2, length(uname) - 2)
        sign = substr(sign, 2, length(sign) - 2)
        print "["uname"]: ", sign
      }
    }
  }
}