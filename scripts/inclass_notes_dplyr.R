##loading up stuff
library(tidyverse)
library(gapminder)
##making the data set inside 
gapminder <- gapminder
view(gapminder)

##tells me what kind of set it is like a data frame (this one is a data.frame and a tibble_df)
class(gapminder)
##tells the structure of what is in the data frame
str(gapminder)

## |> is the same as %>%, we can pipe into a view
gap_country <- gapminder |> 
  select(country) |> view()

gapminder |> 
  select(country) |>  view()
##Can use starts with to find certain columns with whatever criteria
gap_country <- gapminder |> 
  select(starts_with("co")) |> view()

##select does columns, filter does rows)
gapminder |> 
  filter(pop < 100000) |> view()

## this is how to filter out a thing, ! make it opposite, so it hsould filter out everything besides africa
gapminder |> 
  filter(continent == "Africa") |> view()

gapminder |> 
  filter(continent != "Africa") |> view()

##can make it so it filters out multiple with , sign
gapminder |> 
  filter(continent != "Africa", year == 2007) |> view()


##mutate allows to multiply stuff together into new columns (new one is country totl gdp)

gapminder |> 
  mutate(country_total_gdp = pop*gdpPercap) |> view()
##allows us to move it to the front to see it easier
gapminder |> 
  mutate(country_total_gdp = pop*gdpPercap) |> 
  select(contains("total"), everything()) |>  view()

## Challenge: Write a single command (which can span multiple lines and includes pipes) that will produce a data frame that has the African values for lifeExp, country and year, but not for other Continents. How many rows does your data frame have and why? How else could you check that this worked properly?


Challenge_1 <- gapminder |> 
  filter(continent == "Africa") |> 
  select(country, lifeExp, year) |> view()


## Challenge 2 Now, repeat the exercise above, but include values for lifeExp, country, and year for both Africa and Oceania, but not the other continents. How many rows does this data frame have and why?

Challeng2 <- gapminder |> 
  filter(continent == c("Africa", "Oceania")) |> 
  select(country, lifeExp, year) |> view()


## If you go to Code (up on the top on mac) and go to soft wrap long lines, you can make it so it doesnt make super long lines.


## group by allows to 

gapminder |> 
  group_by(continent) |> 
  summarize(lowest_life_exp = min(lifeEXP))
















