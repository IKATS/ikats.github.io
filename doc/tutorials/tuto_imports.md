---
title: Imports
date: 2017-09-29 10:00:00 +02:00
layout: default
published: true
---


Import your data
================

In this tutorial, we are going to import external data, using 2 tools:
* import TS that will load a set of timeseries and create a dataset
* Population Selection, which will allow to import an object of type `table`.

## Import TS

Imported data is from a [Kaggle](https://www.kaggle.com/selfishgene/historical-hourly-weather-data) dataset.The dataset contains ~5 years of high temporal resolution (hourly measurements) of various types of weather, such as temperature, humidity, air pressure, wind speed, wind direction, weather description. All for a set of 36 cities in North America and the Middle East.

IKATS looks for data in subfolders of the root directory /var/lib/ikats/IKATSDATA, in this example in `Hourly_weather`.

Ikats uses the tree structure to generate its metadata. For each indicator, a folder is created and contains all associated TSs.

Tree :

/Hourly weather
  >/Humidity
  * Albuquerque.csv
  * Atlanta.csv
  * Beersheba.csv
  * ...

  >/Temperature
  * Albuquerque.csv
  * Atlanta.csv
  * Beersheba.csv
  * ...

  >...



  A file has been created for each TS.

  The files format can be found [here](/doc/operators/importTs.html) but here is an example :

timestamp;humidity
2012-10-01T12:00:00.0;0.0
2012-10-01T13:00:00.0;50.0
2012-10-01T14:00:00.0;49.0
2012-10-01T15:00:00.0;47.0
2012-10-01T16:00:00.0;48.0
2012-10-01T17:00:00.0;52.0  
2012-10-01T18:00:00.0;37.0
...

6 steps import :
(1) : Dataset name : must be unique. Note that to allow you to independently perform the other tutorials, the data has already been imported. Check that the name of the Dataset is available (`Data Mgt / Datasets menu`) and if necessary choose a new name for your import or delete the existing Dataset)
(2) : Description : be imaginative
(3) : f1 if folder is set at var/lib/ikats/IKATSDATA/f1
(4) : Path mapping rule : `metric` and `city` are metadata created during import. *metric* is mandatory, asked by other operators.
(5) : FID name rule : new name for TS.
(6) : progression indicator


![Texte alternatif](/img/tuto9/importTs.png )


## Population Selection

The [Population Selection](/doc/operators/populationSelection.html) operator allows you to import data as a table.

An example of a data format:

city,localisation
Vancouver,0
Portland,0
San Francisco,0
Seattle,0
Los Angeles,0
San Diego,0

The file can be loaded from any local location.

![Texte alternatif](/img/tuto9/pop_selection.png )
