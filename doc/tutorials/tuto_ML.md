---
title: Decision Trees
date: 2017-09-29 10:00:00 +02:00
layout: default
published: true
---


# Geolocation prediction using Random Trees

The purpose of this tutorial is to provide a basic machine learning usecase (transform dataset, train a model and perform predictions), using the [decision Tree Fit](/doc/operators/decisionTreeFit.html) operator. More precisely, we will perform simple prediction of geolocation according to the weather.

## Usecase

In this tutorial, we use data from [previous tutorial](/doc/tutorials/tuto_addTSColumn.html), by default, these data are available in the `Historical_hourly_weather` dataset.

This dataset contains the weather of 36 cities in North America and Middle East. Are they so characteristics that we can predict the localisation of one city thanks to his historical weather ?

The target looks like :

![Texte alternatif](/img/tuto_ML/carto.png "geolocalisation"){: class="center"}

<!-- TODO: Finish this tuto
In this tutorial, for pedagogical purpose, we have simplified the problem, considering just 4 cities in the dataset: 2 in USA (Florida), and 2 in the north of Israel (*Jacksonville, Miami, Haïfa,
Nahariyya*). The choice of these regions is totally random, and can be changed (you have access to 36 cities).

Here is the position of the 4 choosen cities in the North of Israel (*Haïfa, Nahariyya* - left map), and in Florida
(*Jacksonville, Miami* - right map)

![map](/img/tuto_ML/maps.png "4 choosen cities"){: class="center"}
-->

We note that the cities of the same region are close: they should share the same "meteorological characteristic" (same climate).

### Create and transform the dataset
First steps (import TS, quality indicators, discretize, Ts2Feature) have already be discussed.

Let's begin with table `aggreg_yearly_36_cities_1`, 36 rows (cities) and 30 indicators columns.

<!--
We create a Dataset from `Hourly_weather`, containing just temperatures data.
-->


with 30 cities in North America and 6 in MLiddle East.


Target is loaded by [Population Selection](/doc/operators/populationSelection.html) operator, then tables are [merged](/doc/operators/mergeTables.html).


We use [TrainTestSplit](/doc/operators/trainTestSplit.html) operator to genarte Train and Test tables (here 0.6 repartition rate was choosen because of the low number of entries.

[Decision Tree fit](/doc/operators/decisionTreeFit.html) operator has to outputs. One is .dot file, that allow to plot the decsion tree, for example with the tool [WebGraphviz](http://www.webgraphviz.com/).




 ![Texte alternatif](/img/tuto_ML/webgraphviz.png)


Then, the model is used to predict test set.

 ![Texte alternatif](/img/tuto_ML/predict.png "Decision Tree Predict")




[Decision Tree predict](/doc/operators/decisionTreePredict.html) operator offers two outputs, `score` and `confusion matrix`.

 ![Texte alternatif](/img/tuto_ML/score.png "Prediction score")

 ![Texte alternatif](/img/tuto_ML/confusion.png "confusion matrix")

Return to the [list of all tutorials](/tutorials.html).
