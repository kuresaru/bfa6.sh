{
  a[$1,$2] = $3
} END {
  for (i in a) {
    split(i, j, SUBSEP);
    if (j[2] == "attribute") {
      if (a[i] == 6) {
        print a[j[1],"uname"]
      }
    }
  }
}