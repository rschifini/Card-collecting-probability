library(ggplot2)
library(ggridges)

totalCards = 200
simulations = 1000

# Start with groups of 1 to 10 and then 10 by 10 up to 100
df = data.frame(group = c(), opened = c())
groups =  c(1:10, seq(from = 12, to = 18, by = 2), seq(from = 20, to = 100, by = 10))
packsPerPerson = c()

for(persons in groups){
  packs = c()
  for(k in 1:simulations){
    collectionsComplete = FALSE
    openedPacks = 0
    album = rep(0, totalCards)
    while (!collectionsComplete){
      # we open as many packs as menmbers in the group
      cardsInPacks = floor(runif(persons * 5, 1, totalCards+1))
      openedPacks = openedPacks + persons
      # Add these cards to all albums
      for(j in cardsInPacks){
        album[j] = album[j] + 1  
      }
      # If all elements in album are at least the number of members, then all have completed their collection
      if(all(album >= persons)){
        collectionsComplete = TRUE
      }
    }
    # Store the simulation result
    packs = c(packs,openedPacks)
  }
  df = rbind(df, data.frame(group = persons, opened = packs))
  # packsPerPerson = c(packsPerPerson, mean(packs)/persons)
}

df$packsPerPerson = df$opened / df$group
df$group = as.factor(df$group)

# p = ggplot(df, aes(y = group, x = packpsPerPerson)) +
#   # xlim(0,400) +
#   geom_density_ridges(
#     scale = 5,
#     jittered_points = TRUE,
#     position = position_points_jitter(width = 0.05, height = 0),
#     point_shape = '|', point_size = 3, point_alpha = 1, alpha = 0.7
#   )

p = ggplot(df, aes(x=packpsPerPerson, y=group, fill = group)) +
  geom_density_ridges(
    rel_min_height = 0.01,
    aes(point_color = group, point_fill = group, point_shape = 20),
    alpha = .1, point_alpha = 1, jittered_points = TRUE
  ) +
  scale_point_color_hue(l = 40) +
  xlim(0,500) +
  theme_linedraw()+
  labs(title = "Probability density for different groups", x = "Packs per person", y = "Persons in group")


print(p)
