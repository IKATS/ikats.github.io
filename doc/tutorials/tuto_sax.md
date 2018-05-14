---
title: SAX and K-Means
date: 2017-09-29 10:00:00 +02:00
layout: default
published: true
---


Decreased representation complexity using SAX
---------------------------------------------

In this tutorial, we use a subset of data from [Kaggle](https://www.kaggle.com/selfishgene/historical-hourly-weather-data).This `Hourly_weather_36cities_1` dataset contains ~5 years of high temporal resolution (hourly measurements) of various types of weather, such as temperature, humidity, air pressure, wind speed, wind direction, weather description. All for a set of 36 cities in North America and the Middle East.

Here focus on temperature.

In this tutorial, we will seek to regroup cities with the same temperature evolutions over the last 5 years.

We will proceed in two steps: (i) the Symbolic Aggregate Approximation tool ([SAX](/doc/operators/sax.html)) will allow us to simplify the representation of the TS. (ii) The K-mean operator will perform the classification based on these new representations.


The temperature range is of the order of 60 °F. We choose an alphabet size of 25, which cuts the temperature range into segments of 2 or 3 °F.




The data present 45000 hours. 200 H segments (a little over 8 days) were chosen. The level of detail seems sufficient to observe general trends.
![Alternate Text](/img/tuto5/sax_parameters.png){: .center-image, width="500px" }

We connect the [K-means](/doc/operators/kmeans.html) operator to the SAX output by choosing for example 4 clusters.

![Alternate Text](/img/tuto5/kmeans_sax.png "Clusters Visualization"){: .center-image, width="600px" }

Cities names are accessible by simply hovering over the mouse. The relevance of clustering is easily verified, with nearby cities within the same clusters.
