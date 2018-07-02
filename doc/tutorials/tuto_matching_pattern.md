---
title: Matching Patterns
date: 2017-09-29 10:00:00 +02:00
layout: default
published: true
---


Pattern matching
---------------------------------------------

In signal analysis, an important feature is the identification of patterns, which may be characteristic of a particular event.

To illustrate the use of this operator, we start by viewing a Time series (here it is the TS New-York_temperature from the `Hourly_weather_36cities_1` dataset). We chose a small area of ​​this TS (see [Tutorial 2 : Time series visualisation](/doc/tutorials/tuto_vizTools.html) to see how to interact with a TS). Note that the selection must contain less than 5000 points. We save this pattern by clicking on the `save visible area as new TS` button and name it `NY_partA`.

![Alternate Text](/img/tuto7/pattern_to_match.png)

Now, we will try to find this pattern in all the temperature TS of the 36 cities.

The [TS Pattern Matching](/doc/operators/tsPatternMatching.html) operator takes several parameters, including the limit number of results.

![Alternate Text](/img/tuto7/params_pattern_matching.png)

We find this pattern in other TS (red curves), with a relative agreement (green curve at the bottom)
![Alternate Text](/img/tuto7/pattern_found.png)
