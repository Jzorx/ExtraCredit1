df <- read.csv("names.csv")

data_viz <- df %>%
  group_by(NM) %>% 
  summarize(
    sum_names = sum(CNT)
  ) %>% 
  arrange(desc(sum_names)) %>% 
  top_n(100)

plot_names <- ggplotly(ggplot(data = data_viz) +
                   geom_col(mapping = aes(x = NM, y = sum_names,fill = NM)) +
                   labs(
                     title = "Ranking the 100 of the most popular baby names in New York between the years of 2011-2014",
                     x = "Names",
                     y = "Count"
                   )
)
plot_names