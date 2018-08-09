---
title: Discretize and TS2Feature
date: 2017-09-29 10:00:00 +02:00
layout: default
published: true
---


# How to parse time series and create new features

The previous [tutorials](/tutorials.html) shows how to extract and pre-process TS. The next step is using **machine learning** algorithm. To do that in IKATS, you have to convert your `Dataset` (list of continuous TS) objects into `Tables`. It is the objective of the current tutorial.

## Dataset

In this tutorial, we use data from [Previous tutorial](/doc/tutorials/tuto_corr.html). Here, we will only use 3 indicators (`weather_description`, `wind_speed`, `wind_direction`) for 2 cities, Denver and Detroit.

After TS import (see [Import your data](/doc/tutorials/tuto_imports.html)), and applying a [filter](/doc/operators/filter.html), we have access to a dataset including 6 TS has been generated.

![Texte alternatif](/img/tuto_TS2Feature/importedTSList.png "Imported TS")

## Summarize available information
These TS represent an indicator over a period of 5 years. To quickly compare the weather for each year, you can use the [discretize](/doc/operators/discretize.html) operator, to generate a table of annual average indicators.

 ![Texte alternatif](/img/tuto_TS2Feature/discretize.png "Discretize")

And here is the result:

![Texte alternatif](/img/tuto_TS2Feature/output_discretize.png "Table 3 segments")

*Note: The fields `AVG_Bi` are the "Average value of Bucket i". Here, we obtain 5 values: 1 per year.*

## Transform a table
In order to compare the weather per city, we need to transform a bit this table, so that all city-related indicators become explicitly features for this city.

This is done by the operator [TS2Feature](/doc/operators/ts2Feature.html).

![Texte alternatif](/img/tuto_TS2Feature/Ts2Feature.png "TSFeature")

And here is the result:

![Texte alternatif](/img/tuto_TS2Feature/table_TS2Feature.png "Table TSFeature")

The newly created table contains 2 entries (cities) and N*K features, with N: the number of initial flags, and K: the number of buckets.

Now, you are able to transform your dataset into `Tables`, with requested format, for launching machine learning algorithm.

Return to the [list of all tutorials](/tutorials.html).
