## This portion of code helps to answer the first of the three questions:

## 1. Show the sample mean and compare it to the theoretical mean of the
## distribution.

require(ggplot2)

nosim <- 10000
x <- c(apply(matrix(sample(rexp(nosim, rate = 0.2),
                           nosim * 40, replace = TRUE), 
                    nosim), 1, mean))
df <- data.frame(x)
g <- ggplot(df, aes(x = x))
g <- g + geom_histogram(binwidth = 0.25, colour = "black", fill = "white")
g <- g + geom_vline(aes(xintercept = mean(x, na.rm=T)),
                    color="red", linetype="dashed", size=1)
g <- g + labs(title = paste("Distribution of the Sample Mean",
                            "for an Exponential Function"),
              x = "Sample Means",
              y = "Instances")
print(g)