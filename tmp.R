require(ggplot2)

nosim <- 10000
x <- apply(matrix(sample(rexp(nosim, rate = 0.2),
                         nosim * 40, replace = TRUE),
                  nrow = nosim),
           1, mean, 40)
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