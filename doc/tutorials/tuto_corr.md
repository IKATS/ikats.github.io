---
title: Correlation matrix
date: 2017-09-29 10:00:00 +02:00
layout: default
published: true
---


# Features correlation

In data mining, once we have imported our own dataset ([Tutorial : Import your data](/doc/tutorials/tuto_imports.html)), and clean our dataset - removed outliers ([Previous tutorial](/doc/tutorials/tuto_cutY.html)); we have to perform a data analysis. The goal is finding dependancies / links between features. This operation can be performed by the [correlation TS loop](/doc/operators/correlateTsLoop.html) operator.

This tutorial is a usecase of this operator.

## The Dataset

In this tutorial, we use data data from [Previous tutorial](/doc/tutorials/tuto_cutY.html).

The first 5 characteristics (temperature, humidity, air pressure, wind speed and wind direction) are continuous (from sensors), while the characteristic `weater_description` is categorical and reports a "human" annotation of the weather. In the initial dataset, about fifty annotations were available, such as "high wind", "light rain", "good weather", "snowfall" ...

For the purposes of this tutorial, these features have been grouped into 5 classes ("good weather", "clouds" or "wind", "rain", "snow", "extreme conditions") and then transformed in their entirety by a OneHotEncoding step. We are interested in the links (correlations) between thses features on the whole dataset or for a given city.

## Applying correlation loop

In our usecase, we use the [Correlate ts loop](/doc/operators/correlateTsLoop.html) operator can be connected directly to the output of a Dataset Selection. In this usecase, we are interested in the correlation of our weather indicators for each city, the *Group by* parameter must be filled in with the metadata *city*.

We obtain a correlation matrix averaged over the entire dataset.

![Alternate text](/img/tuto_corr/correlationLoop.png "correlation loop"){: width="900px" class="center"}

Clicking on a box displays a detailed description of the correlation indices between two indicators for each of the 36 cities in the dataset.
![Alternative text](/img/tuto_corr/humidity_vs_weather_desc.png "weather_description"){: width="600px" class="center"}

Return to the [list of all tutorials](/tutorials.html).
