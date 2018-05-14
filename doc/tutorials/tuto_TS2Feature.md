---
title: Discretize and TS2Feature
date: 2017-09-29 10:00:00 +02:00
layout: default
published: true
---


How to parse time series and create new features
---------------------------------------------


The objective here is to show you how to easily **convert continuous time series into features** that can be used by machine learning algorithms.

In this tutorial, we use a subset of data from [Kaggle](https://www.kaggle.com/selfishgene/historical-hourly-weather-data).The dataset contains ~5 years of high temporal resolution (hourly measurements) of various types of weather, such as temperature, humidity, air pressure, wind speed, wind direction, weather description. All for a set of 36 cities in North America and the Middle East.

In this tutorial, we will only use 3 indicators (weather_description, wind_speed, wind_direction) for 2 cities, Denver and Detroit.



After TS import (see [Import your data](/doc/tutorials/tuto_imports.html) for details about TS import), a dataset including 6 TS has been generated.   

![Texte alternatif](/img/tuto3/importedTSList.png "Imported TS")

These TS represent an indicator over a period of 5 years. To quickly compare the weather for each year, you can use the [discretize](/doc/operators/discretize.html) operator, to generate a table of annual average indicators.

 ![Texte alternatif](/img/tuto3/discretize.png "Discretize")

 ![Texte alternatif](/img/tuto3/output_discretize.png "Table 3 segments")

 In order to compare the weather in several cities, we need to transform a bit this table, so that all city-related indicators become explicitly features for this city.
 This is done by the operator [TS2Feature](/doc/operators/ts2Feature.html).

 ![Texte alternatif](/img/tuto3/Ts2Feature.png "TSFeature")

 ![Texte alternatif](/img/tuto3/table_TS2Feature.png "Table TSFeature")

The newly created table contains 2 entries (cities) and N*K features, with N: the number of initial flags, and K: the number of buckets.
