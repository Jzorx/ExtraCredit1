#update.packages()
library("dplyr")
library("ggplot2")
#install.packages("shiny")
library("shiny")
library("leaflet")
library("maps")
library("rsconnect")
library("DT")
library("plotly")
#install.packages("png")
library('png')
#install.packages("html")
#install.packages("shinythemes")
library("shinythemes")
library(stringr)

df <- read.csv("names.csv")

data_viz_2014 <- df %>%
  group_by(NM) %>% 
  filter(str_detect(BRTH_YR, "2014")) %>% 
  summarize(
    sum_names = sum(CNT)
  ) %>% 
  arrange(desc(sum_names)) 
data_viz_2011 <- df %>%
  group_by(NM) %>% 
  filter(str_detect(BRTH_YR, "2011")) %>% 
  summarize(
    sum_names = sum(CNT)
  ) %>% 
  arrange(desc(sum_names)) 
data_viz_2012 <- df %>%
  group_by(NM) %>% 
  filter(str_detect(BRTH_YR, "2012")) %>% 
  summarize(
    sum_names = sum(CNT)
  ) %>% 
  arrange(desc(sum_names)) 
data_viz_2013 <- df %>%
  group_by(NM) %>% 
  filter(str_detect(BRTH_YR, "2013")) %>% 
  summarize(
    sum_names = sum(CNT)
  ) %>% 
  arrange(desc(sum_names)) 

plot_names_2011 <- ggplotly(ggplot(data = data_viz_2011) +
                   geom_col(mapping = aes(x = NM, y = sum_names,fill = NM)) +
                   labs(
                     title = "Ranking the 100 of the most popular baby names in New York in 2011",
                     x = "Names",
                     y = "Count"
                   )
)
plot_names_2012 <- ggplotly(ggplot(data = data_viz_2012) +
                         geom_col(mapping = aes(x = NM, y = sum_names,fill = NM)) +
                         labs(
                           title = "Ranking the 100 of the most popular baby names in New York in 2012",
                           x = "Names",
                           y = "Count"
                         )
)
plot_names_2013 <- ggplotly(ggplot(data = data_viz_2013) +
                         geom_col(mapping = aes(x = NM, y = sum_names,fill = NM)) +
                         labs(
                           title = "Ranking the 100 of the most popular baby names in New York in 2013",
                           x = "Names",
                           y = "Count"
                         )
)
plot_names_2014 <- ggplotly(ggplot(data = data_viz_2014) +
                         geom_col(mapping = aes(x = NM, y = sum_names,fill = NM)) +
                         labs(
                           title = "Ranking the 100 of the most popular baby names in New York in 2014",
                           x = "Names",
                           y = "Count"
                         )
)
plot_names_2014
plot_names_2011
plot_names_2012
plot_names_2013