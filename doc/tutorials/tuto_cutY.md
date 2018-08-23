---
title: Cut-Y
date: 2017-09-29 10:00:00 +02:00
layout: default
published: true
---


# Filter and clean data

In this tutorial, we will see how to select a part of a dataset in order to clean some erroneous data (outliers).

## Select requested TS
We use a subset of data from [Kaggle](https://www.kaggle.com/selfishgene/historical-hourly-weather-data).The dataset contains ~5 years of high temporal resolution (hourly measurements) of various types of weather, such as temperature, humidity, air pressure, wind speed, wind direction, weather description. All for a set of 36 cities in North America and the Middle East.

The dataset, called `Historical_hourly_weather`, has already be loaded in a previous step.
It's now directly usable thanks to [Data Selection](/doc/operators/datasetSelection.html) operator. The dataset contains 216 time series (6 indicators per 36 cities).

Let's have a look on some sample, for example the temperature of cities whose name begins by M : ![Texte alternatif](/img/tuto_cutY/temp_cities_M.png){: class="center"}

We obtain 3 time series (Miami, Minneapolis and Montreal). We see that the Miami time series (the blue one) contains some erroneous values at 0° F (~ -17.7° C) !

![Texte alternatif](/img/tuto_cutY/temp_Miami.png){: class="center"}

Here is a view of the available metadata for this TS (here, minimal value is `qual_min_value = 0.0` !).

![Texte alternatif](/img/tuto_cutY/metadata_temp_Miami.png){: class="center"}

*Note that, if you do not have access to these metadata, use the [quality indicator](/doc/operators/qualityIndicators.html) operator.*

## Remove outliers

We want to clean this Miami time serie, removing outliers, thanks to the tool [cut-Y](/doc/operators/cutY.html). First, select this unique TS using `manual selection` operator.

![Texte alternatif](/img/tuto_cutY/workflow_manual_selection.png){: width="500px" class="center"}

Then, use the [cut Y](/doc/operators/cutY.html) operator. This tool generates two time series, one for the points validating the cut condition and one for those that do not validate it (suffix `\_compl`).
It is mandatory that each time series is plottable (more than one point). That's why the other cities of our selection (Minneapolis and Montreal) were not considered (no missing points).

![Texte alternatif](/img/tuto_cutY/cut_Y_temp_Miami.png){: width="500px" class="center"}

We obtain a new cleaned time series.

![Texte alternatif](/img/tuto_cutY/cleaned_temp_Miami.png)

Now, you are able to cut outliers from requested timeseries in IKATS.

Return to the [list of all tutorials](/tutorials.html).
