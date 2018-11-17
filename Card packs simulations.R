totalCards = 200
simulations = 1000

# Start with groups of 1 to 10 and then 10 by 10 up to 100
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
  packsPerPerson = c(packsPerPerson, mean(packs)/persons)
}

plot(x = groups, y = packsPerPerson, ylim = c(0, 300),
     main = "Average packs per person", ylab = "Packs", xlab = "Persons in group")
abline(b = 0,a = 40, col = "red")
