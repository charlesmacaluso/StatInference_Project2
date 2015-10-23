## This portion of code potentially helps to answer the second of the 
## three questions:

## 2. Show how variable the sample is (via variance) and compare it to
## the theoretical variance of the distribution.

require(ggplot2)

nosim <- 1000
cfunc <- function(x, n) sqrt(n) * ((mean(x) * 0.2) - 1)
x <- c(apply(matrix(sample(rexp(nosim, rate = 0.2),
                           nosim * 40, replace = TRUE), 
                    nosim), 1, cfunc, 40))
df <- data.frame(x)
g <- ggplot(df, aes(x = x))
g <- g + geom_histogram(binwidth = 0.25, colour = "black", fill = "white")
g <- g + geom_vline(aes(xintercept = mean(x, na.rm=T)),
                    color="red", linetype="dashed", size=1)
g <- g + labs(title = paste("Distribution of Standard Errors of",
                            "the Sample Mean for an Exponential Function"),
              x = "Standard Errors of the Sample Mean",
              y = "Instances")
print(g)