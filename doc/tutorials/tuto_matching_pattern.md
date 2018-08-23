---
title: Matching Patterns
date: 2017-09-29 10:00:00 +02:00
layout: default
published: true
---


# Pattern matching

In signal analysis, an important feature is the identification of patterns, which may be characteristic of a particular event. IKATS provides operator [TS Pattern matching](/doc/operators/tsPatternMatching.html) to easily perform this operation.

This tutorial provides a usecase for this operator.

## Step 1: How to select a pattern

We start by viewing a TS (here it is the TS New-York_temperature from the `Historical_hourly_weather` dataset). We chose a small area of ​​this TS (see [Tutorial : Time series visualisation](/doc/tutorials/tuto_vizTools.html) to see how to interact with a TS). Note that the selection must contain less than 5000 points. We save this pattern by clicking on the `save visible area as new TS` button and name it `NY_partA` for example.

![Alternate Text](/img/tuto_pattern_matching/pattern_to_match.png "pattern to match"){: class="center"}
*This figure is an example, do not focus on the values.*

Now, we will try to find this pattern in all the temperature TS of the 36 cities.

## Step 2: Matching patterns

As said before, this step is performed by the [TS Pattern Matching](/doc/operators/tsPatternMatching.html) operator.
It takes several parameters, including the limit number of results (`Score limit`).

![Alternate Text](/img/tuto_pattern_matching/params_pattern_matching.png "workflow used"){: class="center"}

Here is the parameters choosen:
- **Pattern**: The name of the TS (`fid`: Functionnal - unique - IDentifier) used as pattern (here, our `NY_partA`)
- **Rate sliding** : The overlap between sliding windows (here default: *0.5*)
- **Rate size**: The maximum length of searching window for the Fast-DTW distance calculation (here default *1.75*)
- **Metric**: The distance used for detecting matches (here, the fast / best distance is *Fast-DTW*)
- **Score limit** : he limit number of results (here default *10*)
- **Normalize mode**: The type of normalization applied on the windows (here default scaling *MEAN_VARIANCE*, permiting to compare shape of the curves)

### Some details about metric used

The metric used here is `FAST-DTW`. It's a fast version of the [DTW](https://fr.wikipedia.org/wiki/D%C3%A9formation_temporelle_dynamique) (Dynamic Time Warping) metric. This metric is usefull to compared TS without the same length, focusing on the *shape* of the curve instead of values (like in the *MANHATTAN* metric). In a nutshell, it compares for each points of a TS the minimal distance with an other curve.

![DTW](/img/tuto_pattern_matching/DTW.png "The DTW distance"){: class="center"}

For more details about *DTW* and *FAST-DTW*, refers to [this article](https://arxiv.org/pdf/1703.01541.pdf).

### Results

We find this pattern in other TS (red curves), with a relative agreement (green curve at the bottom)

![Alternate Text](/img/tuto_pattern_matching/pattern_found.png "result"){: class="center"}

Now, you are able to perform pattern matching with a particular pattern (here, `NY_partA`). See [tutorial : Similarities between TS via random projections](/doc/tutorials/tuto_random_projection.html) for the next step: find all replicated patterns into a `Dataset` (without any model of pattern).

Return to the [list of all tutorials](/tutorials.html).
