#hist with ggplot2
png('chianti_hist.png', width=1200, height=900, res=92)
ggplot(d, aes(x=time2, fill=sex, color=sex)) +
  theme_minimal()+geom_histogram(position="identity", alpha=0.4, binwidth = 5)+
  geom_vline(xintercept = 148, color='blue', size=1.2)+
  annotate("text", x = 138, y = 18.5, label = "That's my time ->")+
  labs(title = 'Distribution of finishing times at the Chianti Classico 21k Trail Half-Marathon, 2019', 
       subtitle = 'Based on 281 finishing athletes (162 male and 119 female)', caption = 'dimiter.eu')+
  scale_y_continuous(breaks=c(0,5,10,15), labels=c(0,5,10,15), limits=c(0,18.5), name='Number of finishing athletes')+
  scale_x_continuous(breaks=c(90, 120, 150, 180, 210, 240), labels=c(90, 120, 150, 180, 210, 240), limits=c(90,250), name='Finishing time in minutes') +
  theme(legend.position = c(0.85, 0.47), legend.background = element_rect(color = "white", fill = "white", size = 1, linetype = "solid"),
        text=element_text(size=18,  family="Cairo"),
        plot.title = element_text(size=24),
        panel.grid.minor.y = element_blank())
dev.off()
