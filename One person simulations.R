simulations = 4000

totalCards = 200
cardsPerPack = 5

totalPacksOpened = c()

for(k in 1:simulations){
  collectionsComplete = FALSE
  openedPacks = 0
  album = rep(0, totalCards)
  while (!collectionsComplete){

    # Open a pack
    cardsInPacks = floor(runif(cardsPerPack, 1, totalCards+1))
    openedPacks = openedPacks + 1
    
    # Add these cards to the album
    for(j in cardsInPacks){
      album[j] = album[j] + 1  
    }
    
    # If all elements in album are at least the number of members, then all have completed their collection
    if(all(album >= 1)){
      collectionsComplete = TRUE
    }
  }
  
  # Store the simulation results
  totalPacksOpened = c(totalPacksOpened,openedPacks)
}

hist(totalPacksOpened, breaks = 50, xlim = c(100,600), freq = F, ylim = c(0,.01), main = "Probability density of packs opened by one person")
lines(density(totalPacksOpened, bw = 7), ylim = c(0, 0.01), xlim = c(100,600), col = "red")
