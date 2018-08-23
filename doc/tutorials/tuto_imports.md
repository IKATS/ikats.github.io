---
title: Imports
date: 2017-09-29 10:00:00 +02:00
layout: default
published: true
---


# Import your data

In this tutorial, we are going to import two type of data from external files:
- load a set of timeseries, and create a `Dataset` (`Import TS` operator),
- load a matrix of data, and create a `Table` (`Population Selection` operator)


## Import TS

In this example, imported data came from a [Kaggle](https://www.kaggle.com/selfishgene/historical-hourly-weather-data) dataset. The dataset contains ~5 years of high temporal resolution (hourly measurements) of various types of weather, such as temperature, humidity, air pressure, wind speed, wind direction, weather description. All for a set of 36 cities in North America and the Middle East.

IKATS looks for data in subfolders of the root directory `/var/lib/ikats/IKATSDATA`, this example use the `Historical_hourly_weather` dataset.

*Note: If you do not have `Historical_hourly_weather` dataset, refer to Ikats sandbox [install steps](https://github.com/IKATS/ikats-sandbox).*


### Structure of the dataset

Ikats uses the tree structure to generate its metadata. In this example, we have 2 levels of folders:
- first level is metadata `metric` (Humidity, Temperature, ...)
- second (file name) is metadata `city` (Albuquerque, Atlanta, ...)

Each csv file correspond to one single TS.

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

The files format can be found [here](/doc/operators/importTs.html) but here is an example :

>timestamp;humidity
>
>2012-10-01T12:00:00.0;0.0
>
>2012-10-01T13:00:00.0;50.0
>
>2012-10-01T14:00:00.0;49.0
>
>2012-10-01T15:00:00.0;47.0
>
>2012-10-01T16:00:00.0;48.0
>
>2012-10-01T17:00:00.0;52.0
>
>2012-10-01T18:00:00.0;37.0
>
> ...


6 steps import :

(1) : Dataset name : must be unique. Note that to allow you to independently perform the other tutorials, the data has already been imported. Check that the name of the Dataset is available (`Data Mgt / Datasets menu`) and if necessary choose a new name for your import or delete the existing Dataset)

(2) : Description : be imaginative

(3) : `f1` if folder is set at `var/lib/ikats/IKATSDATA/f1` (here `Historical_hourly_weather`)

(4) : Path mapping rule : `metric` and `city` are metadata created during import. *metric* is mandatory, asked by other operators. (here `\/(?<metric>.*?)\/(?<city>.*?)\.csv`)

(5) : FID name rule : new name for TS (have to contain at least `${metric}`).

(6) : progression indicator


![Texte alternatif](/img/tuto_import/importTs.png ){: .center-image"  border="100" height="400" }


## Population Selection

The [Population Selection](/doc/operators/populationSelection.html) operator allows you to import data as a table.

An example of a data format:

>city,localisation
>
>Vancouver,0
>
>Portland,0
>
>San Francisco,0
>
>Seattle,0
>
>Los Angeles,0
>
>San Diego,0


The file can be loaded from any local location.

![Texte alternatif](/img/tuto_import/pop_selection.png )

Now, you are able to download your own data into IKATS.

Return to the [list of all tutorials](/tutorials.html).
