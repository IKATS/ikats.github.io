---
title: Cut-Y
date: 2017-09-29 10:00:00 +02:00
layout: default
published: true
---


Filter and clean data
-------------------------

In this tutorial, we will see how to select a part of a dataset in order to clean some erroneous data.

We use a subset of data from [Kaggle](https://www.kaggle.com/selfishgene/historical-hourly-weather-data).The dataset contains ~5 years of high temporal resolution (hourly measurements) of various types of weather, such as temperature, humidity, air pressure, wind speed, wind direction, weather description. All for a set of 36 cities in North America and the Middle East.

The dataset, called Hourly_weather_36cities_1, has already be loaded in a previous step.
It's now directly usable thanks to [Data Selection](/doc/operators/datasetSelection.html) operator. The dataset contains 216 time series (6 indicators per 36 cities).

Let's have a look on some sample, for example the temperature of cities whose name begins by M : ![Texte alternatif](/img/tuto2/temp_cities_M.png){: class="center"}

We see that the Miami time series contains some erroneous values at 0.
 ![Texte alternatif](/img/tuto2/metadata_temp_Miami.png){: class="center"}


 We will clean this time series, removing these points, thanks to the tool [cut-Y](/doc/operators/cutY.html). This tool generates two time series, one for the points validating the cut condition and one for those that do not validate it (suffix "\_compl").
 It is mandatory that each time series is plottable (more than one point). The other cities of our selection (Minneapolis and Montreal) have no missing points, we need to start by applying a 2nd filter in order to isolate Miami, then apply the cut in Y.

![Texte alternatif](/img/tuto2/cut_Y_temp_Miami.png){: width="500px" class="center"}



We obtain a new cleaned time series.

![Texte alternatif](/img/tuto2/cleaned_temp_Miami.png)
