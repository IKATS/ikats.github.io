---
title: Correlation matrix
date: 2017-09-29 10:00:00 +02:00
layout: default
published: true
---


Features correlation
-------------------

In this tutorial, we use data from [Kaggle](https://www.kaggle.com/selfishgene/historical-hourly-weather-data).The dataset contains ~5 years of high temporal resolution (hourly measurements) of various types of weather, such as temperature, humidity, air pressure, wind speed, wind direction and weather description. All for a set of 36 cities in North America and the Middle East.

The first 5 characteristics are continuous (from sensors), while the characteristic weater_description is categorical and reports a "human" annotation of the weather. In the initial game, about fifty annotations were available, such as "high wind", "light rain", "good weather", "snowfall" ...

For the purposes of this tutorial, these features have been grouped into 5 classes ("good weather", "clouds" or "wind", "rain", "snow", "extreme conditions") and then transformed in their entirety by a OneHotEncoding step.
   
We are interested in this tutorial to look for the correlation between these features, on the whole dataset or for a given city.

The [Correlate ts loop](/doc/operators/correlateTsLoop.html) operator can be connected directly to the output of a Dataset Selection. In this usecase, we are interested in the correlation of our weather indicators for each city, the *Group by* parameter must be filled in with the metadata *city*.

We obtain a correlation matrix averaged over the entire dataset.

![Alternate text](/img/tuto6/correlationLoop.png "correlation loop"){: width="900px" class="center"}

Clicking on a box displays a detailed description of the correlation indices between two indicators for each of the 36 cities in the dataset.
![Alternative text](/img/tuto6/humidity_vs_weather_desc.png "weather_description"){: width="600px" class="center"}
