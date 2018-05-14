---
title: Datasets
date: 2017-09-29 10:00:00 +02:00
layout: default
published: true
---


IKATS datasets List
====================

Data can be initialized from external files, which are expected in .csv format, containing numeric data, text ...

## Already included in IKATS


### Portfolio
- **description** : sample of financial data
- **zip**


## Datasets that can be loaded to play with

### WebTraffic
- **description** : based on a [Kaggle](https://www.kaggle.com/c/web-traffic-time-series-forecasting) dataset. Each of these timeseries represent a number of daily views of a different Wikipedia article, starting from July, 1st, 2015 up until December 31st, 2016. The selected subset loaded in IKATS includes 11989 TS from 7 languages (Deutsch, English, French, Spanish, Chinese, Russian, Japanese).
  - **zip**


### Historical hourly weather
  - **description** : based on a [Kaggle](https://www.kaggle.com/selfishgene/historical-hourly-weather-data) dataset. The dataset contains ~5 years of high temporal resolution (hourly measurements) of various types of indicators, such as temperature, humidity, air pressure, wind speed, wind direction, weather description. All for a set of 36 cities in North America and the Middle East. In the Kaggle dataset, weather description is a categorial textual feature and reports a "human" annotation of the weather. In the initial set, about fifty annotations were available, such as "high wind", "light rain", "good weather", "snowfall" ... In our datset, these features have been grouped into 5 classes ("good weather", "clouds" or "wind", "rain", "snow", "extreme conditions") and then transformed in integer by a OneHotEncoding step.
  - **zip**




You can obviously import your own datasets. See [Import TS](/doc/operators/importTs.html) for the format expected for timeseries source files.
