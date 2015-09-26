Effective MPG Prediction
========================================================
author: DVille
date: 9/26/15

Introduction
========================================================

Miles Per Gallon is a metric that everyone looks for when buying a car. It can help determine:

- Fuel Efficiency
- Cost to fill up the tank
- Total Car Range

Wouldn't it be great if there was an application that could tell us the effective range of a car based on a few common metrics? Now there is!

Effective Range of a Vehicle
========================================================
Just because a vehicle posts an mpg rating of 20 mpg, doesn't mean that it has an effective rating of 20 mpg. There are many factors that determine the efficiency of your vehicle. According to fueleconomy.gov, some factors may have a drastic effect on the range of the vehicle.

For example, quick acceleration and hard braking can impact your vehicle's efficiency by up to 33%!

Application Instructions
========================================================

1) Enter the gas tank size (in gallons)
2) Check the box if you would like to see the range of the vehicle, accounting for heavy braking/quick acceleration
3) Select whether you would like to predict City Range, Highway Range, or both
4) Depending on which option you select in step 3, 1 or 2 input boxes will appear. If you selected City, Enter the city miles/gallon your vehicle receives. If you selected highway, enter the highway miles/gallon your vehicle receives. If you selected both, enter both values.

The output will show:
1) Potential range = Gas Tank Size * Miles/Gallon
2) Range lost due to factors = 33% * Potential Range for highway and 5% * Potential Range for City
3) Net Range = Potential Range - Range lost due to factors




Sample Code - Calculating Potential Range
========================================================
Calculating the potential range of a vehicle (ex: 10 mpg, 10 gallon tank)

```r
Range <- function (mpg,tank)
{
  mpg*tank
}
Range(10,10)
```

```
[1] 100
```

