# Card-collecting-probability
How many card packs are needed to complete a card collection?

# Card collecting

Have you ever participated in card collecting? If you did,have you ever completed the full collection by yourself? Probably not. Most people exchange their copies with friends and acquaintances in order to fill missing cards. 

How hard is it to get a complete collection by oneself? How many card packs would you be expecting to buy?

And if you participate in a group, where copies are shared freely, how many packs would each person end up buying?

# Monte Carlo method

I don't know if this problem has an analytical mathematical solution, but I do know that it can be solved using the Monte Carlo method.

The Monte Carlo method consists of simulating the whole process (opening packs to complete a collection) a large number of times and then counting how many packs were needed in each one.

## Simulation files

This repository contains simulations in **R**:
- *One person simulation.R*
    - Only simulates a single person buying packs and counting how many were opened when completing the collection
- *Card packs simulations.R*
    - Analyzes several groups of persons opening one pack each until all of them have completed their collections.

## Results

### Simulation parameters

- Total number of different cards in collection: 200
- Number of cards inside each pack: 5 
- No rare cards, all have the same uniform probability


### Single person

For Simulations: 4000

Trying to complete the collection single-handedly will not be easy:
 - You need to open, on average, a total of 236 packs. 
 - Feeling lucky? Expect to open no less than 120 packs.
 - Extremely unlucky? Maybe you'll end up buying 500+ packs!


![Figure 1](probabiliy%20density%20single%20person.jpeg?raw=true)

*Figure 1: Probability density for a single person*

### Collaboration pays

Get together with friends to share all the packs you all open. The more the merrier!

Simulations per group: 1000

Advantages:
- For a group of two the average numbero packs goes down from 235 to 163.
- For three: 132, almost 50% less! 
- The more people involved: 
    - the less packs are expected per person,
    - lower dispersion of opened packs per person,
    - Packs per person converges to 40 ( = 200 cards / 5 per pack ) when the number of people goes to infinity.

![Figure 2](Packs%20per%20group.jpeg?raw=true)

*Figure 2: Average number of packs expected for each member in a group*

![Figure 3](probabilities_for_groups.jpeg?raw=true)

*Figure 2: Probability density of the number of packs per person in a group*

Note: one of the rules for groups is that no participant leaves the group when completing the collection. They keep buying a pack for the group to share.