---
title: Decision Trees
date: 2017-09-29 10:00:00 +02:00
layout: default
published: true
---


Simple prediction of geolocation according to the weather
---------------------------------------------------------


The objective here is to show you how to quickly transform a Dataset, train a machine Learning model and make predictions.

In this tutorial, we use data from [Kaggle](https://www.kaggle.com/selfishgene/historical-hourly-weather-data).The dataset contains ~5 years of high temporal resolution (hourly measurements) of various types of weather, such as temperature, humidity, air pressure, wind speed, wind direction, weather description. All for a set of 36 cities in North America and the Middle East.


First steps (import TS, quality indicators, discretize, Ts2Feature) have already be discussed.

Let's begin with table `aggreg_yearly_36_cities_1`, 36 rows (cities) and 30 indicators columns.

We search to answer that question : North America and Middle East weather are they so characteristics that we can predict the localisation of one city thanks to his historical weather ?

The target looks like :
![Texte alternatif](/img/tuto4/carto.png "geolocalisation")

with 30 cities in North America and 6 in MLiddle East.


Target is loaded by [Population Selection](/doc/operators/populationSelection.html) operator, then tables are [merged](/doc/operators/mergeTables.html).


We use [TrainTestSplit](/doc/operators/trainTestSplit.html) operator to genarte Train and Test tables (here 0.6 repartition rate was choosen because of the low number of entries.

[Decision Tree fit](/doc/operators/decisionTreeFit.html) operator has to outputs. One is .dot file, that allow to plot the decsion tree, for example with the tool [WebGraphviz](http://www.webgraphviz.com/).




 ![Texte alternatif](/img/tuto4/webgraphviz.png)


Then, the model is used to predict test set.

 ![Texte alternatif](/img/tuto4/predict.png "Decision Tree Predict")




[Decision Tree predict](/doc/operators/decisionTreePredict.html) operator offers two outputs, `score` and `confusion matrix`.

 ![Texte alternatif](/img/tuto4/score.png "Prediction score")

 ![Texte alternatif](/img/tuto4/confusion.png "confusion matrix")
