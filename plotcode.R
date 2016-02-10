
error.bar <- function(x, y, upper, lower=upper, length=0.1,...){
     if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
          stop("vectors must be same length")
     arrows(x,y+upper, x, y-lower, angle=90, code=3, length=length, ...)
}

```{r}
barplot(dragons$TalonLength, names = dragons$Population, 
        ylim=c(0,70),xlim=c(0,4),yaxs='i', xaxs='i',
        main="Dragon Talon Length in the UK",
        ylab="Mean Talon Length",
        xlab="Country")
par(new=T)
plotCI (dragons$TalonLength, 
        uiw = dragons$SE, liw = dragons$SE,
        gap=0,sfrac=0.01,pch="",
        ylim=c(0,70),
        xlim=c(0.4,3.7),
        yaxs='i', xaxs='i',axes=F,ylab="",xlab="")
```

```{r}
boxplot(iris$Sepal.Length ~ iris$Species)
```

```{r}
plot(moomins$Year, moomins$PopSize,                              # x variable, y variable
     type = "l",                                                 # draw a line graphs
     col = "red",                                                # red line colour
     lwd = 3,                                                    # line width of 3
     xlab = "Year",                                              # x axis label
     ylab = "Population Size",                                   # y axis label
     main = "Moomin Population Size on Ruissalo 1971 - 2001")    # plot title

fit1 <- lm (PopSize ~ Year, data = moomins)             # carry out a linear regression
abline(fit1, lty = "dashed")                            # add the regression line to the plot
text(x = 1978, y = 750, labels = "R2 = 0.896\nP = 2.615e-15")   # add a label to the plot at (x,y)
```

```{r}
pairs(iris, col = iris$Species)
```

