require(ggplot2)

nosim <- 1000
cfunc <- function(x, n) 2 * sqrt(n) * (mean(x) - 0.5) 
dat <- data.frame(
    x = c(apply(matrix(sample(0:1, nosim * 10, replace = TRUE), 
                       nosim), 1, cfunc, 10),
          apply(matrix(sample(0:1, nosim * 20, replace = TRUE), 
                       nosim), 1, cfunc, 20),
          apply(matrix(sample(0:1, nosim * 30, replace = TRUE), 
                       nosim), 1, cfunc, 30)
    ),
    size = factor(rep(c(10, 20, 30), rep(nosim, 3))))
g <- ggplot(dat, aes(x = x, fill = size)) + geom_histogram(binwidth=.3, colour = "black", aes(y = ..density..)) 
g <- g + stat_function(fun = dnorm, size = 2)
g + facet_grid(. ~ size)