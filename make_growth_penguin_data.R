library(tidyverse)
library(palmerpenguins)
library(hrbrthemes)
library(ggthemes)

penguins <- penguins

glimpse(penguins)

adelie08 <- filter(penguins, species == "Adelie", year == 2008) %>%
            sample_n(30)

adelie09 <- filter(penguins, species == "Adelie", year == 2009) %>%
            sample_n(40)


grow_penguins <- penguins %>%
                   anti_join(adelie08) %>%
                   anti_join(adelie09) %>%
                   mutate(id = 1:n())


grow_penguins <- grow_penguins %>%
                 select(id, year, species, bill_length_mm, bill_depth_mm, sex)

write_csv(grow_penguins, "2007-2009_RV_scurvy_penguins.csv")


# Bill length trends
mean_bills <- grow_penguins %>%
                group_by(year) %>%
                filter(!is.na(year)) %>%
                summarize(bill_length_mean = mean(bill_length_mm, na.rm = T))

ggplot(mean_bills,
       aes(x = year, y = bill_length_mean)) +
  geom_col(aes(fill = year), show.legend = FALSE) +
  #geom_line(size = 3, color = "tomato", linetype = "dotted") +
  #geom_point(color = "tomato", size = 3) +
  geom_line(size = 2, color = "tomato", arrow = arrow()) +
  coord_cartesian(ylim = c(43.7, 47.2)) +
  #lims(y = c(43, 47.3)) +
  labs(title = "Penguin growth nears speed of light",
       subtitle = "The data don't lie",
       caption = "©2023 The R/V Topsy-Scurvy",
       x = "YEAR",
       y = "BILL SIZE") +
  theme_wsj(base_size = 15, color = "gray")
  #scale_fill_wsj()
  #theme_ipsum_rc(base_size = 22)
  theme_ipsum_es(base_size = 22)
  theme_minimal(base_size = 22)

# Bill by species

## facet_wrap
ggplot(grow_penguins %>%
         group_by(year, species) %>%
         filter(!is.na(year)) %>%
         summarize(bill_length_mm = mean(bill_length_mm, na.rm = T)),
       aes(x = as.character(year), y = bill_length_mm)) +
  geom_col() +
  facet_wrap(~species)

## facet_grid
ggplot(grow_penguins %>%
         group_by(year, species) %>%
         filter(!is.na(year)) %>%
         summarize(bill_length_mm = mean(bill_length_mm, na.rm = T)),
       aes(x = as.character(year), y = bill_length_mm)) +
  geom_col() +
  facet_wrap(~species, nrow = 1)


# Body mass
ggplot(grow_penguins %>%
         group_by(year) %>%
         filter(!is.na(year)) %>%
         summarize(body_mass_g = mean(body_mass_g, na.rm = T)),
       aes(x = as.character(year), y = body_mass_g)) +
  geom_col()

# Flipper
ggplot(grow_penguins %>%
         group_by(year, species, sex) %>%
         filter(!is.na(year), !is.na(flipper_length_mm)) %>%
         summarize(flipper_length_mm = max(flipper_length_mm)),
       aes(x = as.character(year), y = flipper_length_mm)) +
  geom_col() +
  facet_wrap(~species+sex)
