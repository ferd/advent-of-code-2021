{
  for (i=12;i<=15;i++) {
      l=length($i)
      if(l==2) { j++ } # 1
      if(l==4) { j++ } # 4
      if(l==3) { j++ } # 7
      if(l==7) { j++ } # 8
  }
}
END { print j }
