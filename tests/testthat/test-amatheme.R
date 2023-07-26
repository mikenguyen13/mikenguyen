# Load the necessary packages
library(ggplot2)

test_that("amatheme returns a ggplot2 theme object", {
  ggplot(mtcars, aes(x = mpg, y = wt, color = factor(cyl))) +
    geom_point() +
    ggtitle("Scatter Plot of MPG vs. Weight") +
    xlab("Miles per Gallon (MPG)") +
    ylab("Weight (1000 lbs)") +
    amatheme()
})
