#' Load libraries
if (!require("pacman")) install.packages("pacman")
pacman::p_load(tidyverse, # data manipulation
               viridis,
               leaflet,
               svglite)
#check figure folder
if(!dir.exists("figs")){dir.create("figs")}

#' Import data
df <- read_csv("data/preferences.csv")

# Group and count animal choices 
ap <- df %>% 
  mutate_at(vars(animal_pref), factor) %>%
  group_by(animal_pref) %>%
  dplyr::summarise(n = length(animal_pref))

# make bar plot to show popular choices
p <- ggplot(data = ap, aes(x = animal_pref, y = n)) +
  geom_bar(stat="identity")
p

ggsave("figs/preferedanimals.svg", p, device = "svg")

# Group and count colour choices 
colp <- df %>% 
  mutate_at(vars(colour_pref), factor) %>%
  group_by(colour_pref) %>%
  dplyr::summarise(n = length(colour_pref))

# make bar plot to show popular choices
p <- ggplot(data = colp, aes(x = colour_pref, y = n)) +
  geom_bar(stat="identity")
p

ggsave("figs/preferedcolour.svg", p, device = "svg")

# Group and count food choices 
fp <- df %>% 
  mutate_at(vars(food_pref), factor) %>%
  group_by(food_pref) %>%
  dplyr::summarise(n = length(food_pref))

# make bar plot to show popular choices
p <- ggplot(data = fp, aes(x = food_pref, y = n)) +
  geom_bar(stat="identity")
p

ggsave("figs/preferedfood.svg", p, device = "svg")

# Group and count season choices 
sp <- df %>% 
  mutate_at(vars(season_pref), factor) %>%
  group_by(season_pref) %>%
  dplyr::summarise(n = length(season_pref))

# make bar plot to show popular choices
p <- ggplot(data = sp, aes(x = season_pref, y = n)) +
  geom_bar(stat="identity")
p

ggsave("figs/preferedseason.svg", p, device = "svg")

# Group and count exercise choices 
ep <- df %>% 
  mutate_at(vars(exercise_pref), factor) %>%
  group_by(exercise_pref) %>%
  dplyr::summarise(n = length(exercise_pref))

# make bar plot to show popular choices
p <- ggplot(data = ep, aes(x = exercise_pref, y = n)) +
  geom_bar(stat="identity")
p

ggsave("figs/preferedexercise.svg", p, device = "svg")
