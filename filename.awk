{
  for (i=4; i < NF; i++) {
    gsub(/[\.,]/, "", $i)
    if (i < NF-1) printf("%s_", $i)
    else printf("%s", $i)
  }
  printf(".mp3")
}
