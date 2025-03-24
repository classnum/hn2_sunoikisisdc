pacman::p_load(tidyverse)

d <- read_csv("hn2_sunoikisisdc_data.csv")

inst <-
    d %>% select(contains("institutions_")) %>% unlist() %>% unique()
inst <- inst %>% as_tibble() %>% arrange(value)
view(inst)

people <-
    d %>% select(contains("contributors_")) %>% unlist() %>% unique()
people <- people %>% as_tibble() %>% arrange(value)
view(people)

d %>%
    select(contains("contributors_")) %>%
    unlist() %>% na.omit() %>% as_tibble() %>%
    group_by(value) %>% add_count() %>%
    arrange(desc(n)) %>% distinct()

d %>%
    select(contains("themes_")) %>%
    unlist() %>% na.omit() %>% as_tibble() %>%
    group_by(value) %>% add_count() %>%
    arrange(desc(n)) %>% distinct()

d %>%
    arrange(season) %>%
    group_by(season) %>%
    count()

theme_set(theme_minimal())

d %>%
    ggplot() +
    geom_bar(aes(acad_year))

d %>%
    ggplot(aes(acad_year, n_total, color = acad_year)) +
    geom_step()

d %>%
    ggplot() +
    geom_point(aes(date, themes_1)) +
    geom_point(aes(date, themes_2)) +
    geom_point(aes(date, themes_3)) +
    geom_point(aes(date, themes_4)) +
    geom_point(aes(date, themes_5)) +
    geom_point(aes(date, themes_6))
# + geom_point(aes(date, themes_7))

d %>%
    ggplot() +
    geom_point(aes(date, contributors_1)) +
    geom_point(aes(date, contributors_2)) +
    geom_point(aes(date, contributors_3)) +
    geom_point(aes(date, contributors_4)) +
    geom_point(aes(date, contributors_5)) +
    geom_point(aes(date, contributors_6)) +
    geom_point(aes(date, contributors_7))

d %>%
    ggplot() +
    geom_point(aes(date, institutions_1)) +
    geom_point(aes(date, institutions_2)) +
    geom_point(aes(date, institutions_3)) +
    geom_point(aes(date, institutions_4)) +
    geom_point(aes(date, institutions_5)) +
    geom_point(aes(date, institutions_6)) +
    geom_point(aes(date, institutions_7))

