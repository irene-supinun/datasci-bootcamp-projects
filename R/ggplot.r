
library(tidyverse)

##First GGplot 
#aes = aesthetic
ggplot(data = mtcars, 
      mapping = aes(x = hp, y = mpg)) +
      geom_point() +
      geom_smooth() +
      geom_rug()

##shortversion
ggplot(mtcars,aes(hp,mpg)) +
    geom_point(size = 2, col="salmon", alpha= 0.3)

##alpha 0-1 opacity

ggplot(mtcars, aes(hp)) +
  geom_histogram(bins = 10,
                 fill="Salmon", alpha= 0.5)


ggplot(mtcars, aes(hp)) +
  geom_boxplot()

p <- ggplot(mtcars, aes(hp))
p + geom_histogram(bins=10)
p+ geom_density()


## box plot by groups

diamonds %>%
  count(cut)

ggplot(diamonds, aes(cut)) +
  geom_bar(fill = "salmon")

ggplot(diamonds, mapping = aes(cut, fill=color)) +
  geom_bar(position = "stack")

ggplot(diamonds, mapping = aes(cut, fill=color)) +
  geom_bar(position = "dodge")

ggplot(diamonds, mapping = aes(cut, fill=color)) +
  geom_bar(position = "fill")


##scatter plot

##ล็อคสุ่มตัวอย่าง
set.seed(42)

##สุ่มตัวอย่าง
small_diamonds <- sample_n(diamonds, 5000)

ggplot(small_diamonds, aes(carat, price)) +
  geom_point(size = 1)

## FACET : Small multiples
ggplot(small_diamonds, aes(carat, price)) +
  geom_point(size = 1) +
  geom_smooth(method = "lm") +
  facet_wrap( ~color , ncol=2) +
  theme_minimal() +
  labs(title = "Relationship between carat and price by color",
        x = "Carat",
       y = "Price USD",
       caption = "Source: Diamonds")


ggplot(small_diamonds, aes(carat, price, col=cut)) +
  geom_point(size = 1, alpha = 0.2) +
  facet_wrap( ~color , ncol=2) +
  theme_minimal()



