# Visualizing data from the Chianti Classico Marathon 2019

This repository contains the `R` scipts and data file to produce the plots of the distribution of the finishing times of the 
2019 [Chianti Classico 21k Trail Half-Marathon](http://www.chianticlassicomarathon.com/en)

## A static histogram with `ggplot2`
First, let's start with a simple histogram with overlapping distributions for men and women
![](https://github.com/demetriodor/Chianti-Marathon-Dataviz/blob/master/chianti_hist.png)


## An animated multi-plot gif done with `base R`
Now, let's combine histograms and plots of the empirical cumulative distribution functions with a big one-dimensional dotplot of the finishing times. We can also animate all panels by looping through the finishing times to make the graphs more dynamic and engaging. 
![](https://github.com/demetriodor/Chianti-Marathon-Dataviz/blob/master/chianti.gif)

## Happy running and happy plotting!
