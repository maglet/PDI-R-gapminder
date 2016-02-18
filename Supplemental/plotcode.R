


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


