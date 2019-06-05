
u<-seq(60,250,1)

for (i in 1:length(u)){
  #i<-60  
  file.name<-paste0('chianti_complex',i,'.png')
  png(file.name, width=1200, height=900, res=96)
  
  par(oma=c(5,1,7,1),
      par(mar=c(3,1,1,1)),
      bg=background.color,
      bty='n',
      family='Montserrat')
  layout(matrix(c(1,1,1,1,1,1,1,1,1,1,1,1,2,3,4,5), 4, 4, byrow = TRUE))
  
  
  ### main plot with dots
  plot(xlim=c(89,250), ylim=c(-0.6,0.6), NULL, axes=F, xlab="", ylab="", main='', cex.main=1.4, col.main=dark.color, font.main=2)
  segments(x0=seq(90,250,10), x1=seq(90,250,10), y0=rep(-0.6, 6), y1=rep(0.55,6), col='grey')
  axis (1, font=1, tck=-0.1, col=background.color, col.axis=dark.color, at=c(90, 120, 150, 180, 210, 240),line=-1, labels=c(90, 120, 150, 180, 210, 240), cex.axis=1)
  
  #title
  mtext(expression(bold('Chianti Classico 21k Trail Half-Marathon, 2019')),
        line=5, font=1, at=0.025, col=dark.color, cex=2., adj=0, padj=1, outer=T)
  mtext(expression('Distribution of finishing times in minutes, based on 281 finishing athletes (162 male and 119 female)'),
        line=1.5, font=3, at=0.025, col=dark.color, cex=1.4, adj=0, padj=1, outer=T)
  #signature
  mtext(text=expression("- dimiter " * phantom(".eu") * " -"),
        side=1, line=2, outer=T, font=1, family='Cairo', col=dark.color, cex=1.1, adj=1, padj=1)
  mtext(text=expression(phantom("- dimiter ") * ".eu" * phantom(" -")),
        side=1, line=2, outer=T, font=1, family='Cairo', col=main.color3, cex=1.1, adj=1, padj=1)
  
  points(x=95,  y=0.62, cex=2.7, pch=21, col='lightblue3', bg='lightblue3')
  points(x=115, y=0.62, cex=2.7, pch=21, col=main.color3, bg=main.color3)
  points(x=135, y=0.62, cex=2.7, pch=21, col=main.color2, bg=main.color2)
  points(x=155, y=0.62, cex=2.7, pch=21, col='red', bg='red')
  points(x=178, y=0.62, cex=2.7, pch=21, col=main.color, bg=main.color)
  
  text('Male Adult', x=95+1, y=0.62, cex=1.3, col='lightblue3', pos=4, font=3)
  text('Male Veteran', x=115+1, y=0.62, cex=1.3, col=main.color3, pos=4, font=3)
  text('Female Adult', x=135+1, y=0.62, cex=1.3, col=main.color2, pos=4, font=3)
  text('Female Veteran', x=155+1, y=0.62, cex=1.3, col='red', pos=4, font=3)
  text('me', x=178+1, y=0.62, cex=1.3, col=main.color, pos=4, font=3)
  
  d1<-subset(d, d$time2<u[i])
  points(x=d1$time2, y=d1$y, cex=2.7, pch=21, col=ifelse(d1$time=='02:28:23',main.color,
                                                         ifelse(d1$sex=='M' & d1$age=='V', main.color3,
                                                                ifelse(d1$sex=='M' & d1$age=='A','lightblue3',
                                                                       ifelse(d1$sex=='F' & d1$age=='A',main.color2, 'red')))),
         bg=ifelse(d1$time=='02:28:23',main.color,
                   ifelse(d1$sex=='M' & d1$age=='V', main.color3,
                          ifelse(d1$sex=='M' & d1$age=='A','lightblue3',
                                 ifelse(d1$sex=='F' & d1$age=='A',main.color2, 'red')))))
  rect(xleft=215, xright=248, ybottom=0.35, ytop=0.53, col=background.color, border=background.color)
  text(paste0(u[i], ' minutes'), x=230, y=0.45, cex=2.8, col=dark.color, font=3)
  
  
  ###ecdfs
  plot(xlim=c(85,250), ylim=c(0,1), NULL, axes=F, xlab="", ylab="", main='Males', col.main=main.color3, cex.main=1.3, font.main=3)
  #lines(time.m, (1:n)/n, type = 's',lwd=1, col=main.color3)
  polygon(x=c(c(85,time.m,250), rev(c(85,time.m,250))), y=c(c(0,(1:n)/n,1), rep(0,n+2)), col=main.color3, border=main.color3)
  rect (xleft=u[i], xright=250, ybottom = 0, ytop=1, col=background.color, border=background.color)
  abline(v=c(90,120,150,180,210,240), col='grey')
  abline(h=c(0, 0.25, 0.5, 0.75, 1), col='grey')
  axis (1, font=1, tck=-0.1, col=background.color, col.axis=dark.color, at=c(90, 120, 150, 180, 210, 240),line=0, labels=c(90, 120, 150, 180, 210, 240), cex.axis=1)
  axis (2, font=1, tck=-0.1, col=background.color, col.axis=dark.color, at=c(0,0.25,0.50,0.75, 1),line=-1, labels=c('0%','25%','50%','75%','100%'), cex.axis=0.9)
  
  
  plot(xlim=c(85,250), ylim=c(0,1), NULL, axes=F, xlab="", ylab="", main='Females', col.main=main.color2, cex.main=1.3, font.main=3)
  #lines(time.w, (1:n2)/n2, type = 's',lwd=1, col=main.color3)
  polygon(x=c(c(85,time.w,250), rev(c(85,time.w,250))), y=c(c(0,(1:n2)/n2,1), rep(0,n2+2)), col=main.color2, border=main.color2)
  rect (xleft=u[i], xright=250, ybottom = 0, ytop=1, col=background.color, border=background.color)
  abline(v=c(90,120,150,180,210,240), col='grey')
  abline(h=c(0, 0.25, 0.5, 0.75, 1), col='grey')
  
  axis (1, font=1, tck=-0.1, col=background.color, col.axis=dark.color, at=c(90, 120, 150, 180, 210, 240),line=0, labels=c(90, 120, 150, 180, 210, 240), cex.axis=1)
  axis (2, font=1, tck=-0.1, col=background.color, col.axis=dark.color, at=c(0,0.25,0.50,0.75, 1),line=-1, labels=c('0%','25%','50%','75%','100%'), cex.axis=0.9)
  
  ### histograms
  plot(h1, col=main.color3, border=main.color3, ylim=c(0,16), xlim=c(85,250), xlab='', ylab='', axes=F, main='Males', col.main=main.color3, cex.main=1.3, font.main=3)
  rect (xleft=u[i], xright=250, ybottom = 0, ytop=16, col=background.color, border=background.color)
  
  abline(v=c(90,120,150,180,210,240), col='grey')
  abline(h=c(0,4,8,12,16), col='grey')
  axis (1, font=1, tck=-0.1, col=background.color, col.axis=dark.color, at=c(90, 120, 150, 180, 210, 240),line=0, labels=c(90, 120, 150, 180, 210, 240), cex.axis=1)
  axis (2, font=1, tck=-0.1, col=background.color, col.axis=dark.color, at=c(0,4,8,12,16),line=-1, labels=c(0,4,8,12,16), cex.axis=1)
  
  plot(h2, col=main.color2, border=main.color2, ylim=c(0,12),xlim=c(85,250), xlab='', ylab='', axes=F, main='Females', col.main=main.color2, cex.main=1.3, font.main=3)
  rect (xleft=u[i], xright=250, ybottom = 0, ytop=12, col=background.color, border=background.color)
  abline(v=c(90,120,150,180,210,240), col='grey')
  abline(h=c(0,4,8,12), col='grey')
  axis (1, font=1, tck=-0.1, col=background.color, col.axis=dark.color, at=c(90, 120, 150, 180, 210, 240),line=0, labels=c(90, 120, 150, 180, 210, 240), cex.axis=1)
  axis (2, font=1, tck=-0.1, col=background.color, col.axis=dark.color, at=c(0,4,8,12),line=-1, labels=c(0,4,8,12), cex.axis=1)
  
  mtext(expression('Empirical cumulative density functions'), side=1, line=-1, font=1, at=0.11, col=dark.color, cex=1.2, adj=0, padj=1, outer=T)
  mtext(expression('Histograms'), side=1, line=-1, font=1, at=0.7, col=dark.color, cex=1.2, adj=0, padj=1, outer=T)
  
  dev.off()
}

#gif
img_frames <- paste0("chianti_complex", seq(1,191,1), ".png")
image_write_gif(image_read(img_frames), 
                path = "chianti.gif", 
                delay = 12/190)
