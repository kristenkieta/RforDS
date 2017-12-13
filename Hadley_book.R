#R Script to make sure I am actually understanding how to commit/push/pull to GitHub
#Working through Hadley's R4ds

library(tidyverse)
library(timeSeries)
library(gridExtra)
library(grid)
library(MASS)
library(car)
library(faraway)
library(moments)

#ggplot(data = <DATA>) +
#<GEOM_FUNCTION>(mapping = aes(<MAPPINGS))

ggplot(data = mpg) + 
  geom_point(aes(cyl,hwy))
ggplot(data = mpg) + 
  geom_point(aes(displ,hwy, stroke = 2))

ggplot(data = mpg) +
  geom_point(aes(displ,hwy)) +
  facet_wrap(~ class, nrow=2)

ggplot(data = mpg) +
  geom_point(aes(displ,hwy, color = drv)) +
  facet_grid(. ~ cyl)

ggplot(data = mpg) +
  geom_smooth(mapping = aes(displ, hwy))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(displ, hwy, group = drv))

ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(displ, hwy, colour = drv),
    show.legend = FALSE
    )
#This piece of code is repetitive
ggplot(data = mpg) +
  geom_point(mapping = aes(displ, hwy)) +
  geom_smooth(mapping = aes(displ, hwy))
#Instead of mapping x,y in both geoms, map it globally
ggplot(data = mpg, mapping = aes(displ, hwy)) +
  geom_point() +
  geom_smooth()
#You can also then place mapping sin one of the geom functions
ggplot(data = mpg, mapping = aes(displ, hwy)) +
  geom_point(mapping = aes(color=class)) +
  geom_smooth()

ggplot(
  data = mpg,
  mapping = aes(displ, hwy)) +
  geom_point() +
  geom_smooth(se = FALSE)

ggplot(data = diamonds) +
  geom_bar(aes(x = cut, y = ..prop..,group = 1))

demo <- tribble(
  ~a, ~b,
  "bar_1", 20,
  "bar_2", 30,
  "bar_3", 40
)

ggplot(data = demo) +
  geom_bar(aes(a,b), stat = "identity")

ggplot(data = diamonds, mapping = aes(cut, fill = clarity)) +
  geom_bar(alpha = 1/5, position = "identity")

ggplot(data = diamonds, mapping = aes(cut, colour = clarity)) +
  geom_bar(fill = NA, position = "identity")

ggplot(data = mpg) +
  geom_jitter(aes(displ, hwy))
