# https://www.youtube.com/watch?v=eR-XRSKsuR4
5 + 6
a <- 5
b <- 6
a + b

sum(a,b)

ages <- c(5,6)
ages
sum(ages)

names <- c("John","James")

friends <- data.frame(names, ages)
View(friends)
str(friends)

friends$ages

friends$names

friends[1,1]
friends[1,]
friends[,1]


data()
View(starwars)

install.packages("tidyverse")
library(tidyverse)
View(starwars)

starwars %>% 
  filter(height > 150 & mass < 200) %>% 
  mutate(height_in_meters = height/100) %>% 
  select(height_in_meters, mass) %>% 
  arrange(mass) %>% 
  plot()

View(msleep)

glimpse(msleep)

head(msleep)

class(msleep$name)

length(msleep)

length(msleep$name)

names(msleep)

unique(msleep$vore)

missing <- !complete.cases(msleep)

msleep[missing,]

starwars %>% 
  select(name, height, mass)


starwars %>% select(1,2,3)

starwars %>% select(ends_with('color')) %>% View()

starwars %>% select(name, mass, height, everything()) %>% View()

starwars %>% rename('characters' = 'name') %>%  head()

class(starwars$hair_color)

starwars$hair_color <- as.factor(starwars$hair_color)

starwars %>%  mutate(hair_color = as.character(hair_color)) %>%  glimpse()


df <- starwars
df$sex <- as.factor(df$sex)

levels(df$sex)

df <- df %>% 
  mutate(sex = factor(sex,
                      levels = c("male", "female", "hermaphroditic", "none")))


#select choose columns
#fielder chooses rows

starwars %>%  select(mass, sex) %>% 
  filter(mass < 55 & sex == "male")


#recode data

starwars %>%  select(sex) %>% 
  mutate(sex = recode(sex, "male" = "man",'female'='woman'))


#mean
mean(starwars$height, na.rm = TRUE)


Names <- c("Peter", "John", "Andrew", "Peter")
Age <- c(22,33,44,22)

friends <- data.frame(Names, Age)

friends
friends %>%  distinct()

install.packages("languageserver")
install.packages("rmarkdown")

remotes::install_github("ManuelHentschel/vscDebugger")

install.packages("httpgd")