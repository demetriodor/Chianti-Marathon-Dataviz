library(chron)
library(ggplot2)
library(plyr)
library(magick)
library(extrafont)
library(sysfonts)
library(showtext)

#fonts
font_add_google('Cairo') #get the fonts 
font_add_google("Montserrat")
font_families() #check that the fonts are installed and available
showtext_auto() #this is to turn on the custom fonts availability
showtext_opts(dpi = 96) #set the resolution: 96 is default

background.color=rgb(255, 246, 229, max=255) #color for the background
dark.color=rgb(45, 45, 68, max=255) # dark color

main.color=rgb(0, 102, 0, alpha=155, max=255) #main color
main.color2=rgb(255, 0, 51, alpha=155, max=255) #main color
main.color3=rgb(51, 0, 255, alpha=155, max=255) #main color

#data
d<-read.table('chianti_data.txt', header=T )

d$time<-times(d$time)
d$time2<-60 * hours(d$time) + minutes(d$time)
d$sex<-substr(d$cat,4,4 )
d$age<-substr(d$cat,1,1 )
d$cat2<-paste0(d$sex,d$age)

d$y<-rnorm(281, 0,0.2)

h1<-hist(d$time2[d$sex=='M'], nclass=30, freq=T)
h2<-hist(d$time2[d$sex=='F'], nclass=30, freq=T)

time.m = sort(d$time2[d$sex=='M'])
n=length(d$time2[d$sex=='M'])
time.w = sort(d$time2[d$sex=='F'])
n2=length(d$time2[d$sex=='F'])

