---
title: SAX and K-Means
date: 2017-09-29 10:00:00 +02:00
layout: default
published: true
---


# Decreased representation complexity using SAX

This page is a tutorial of the [SAX operator](/doc/operators/sax.html). In this tutorial, we use the default dataset `Historical_hourly_weather`, used in all [previous](/tutorials.html) tutorials. Here,we focus on temperature.

The aim of [SAX operator](/doc/operators/sax.html) is to summarize a time serie into a short group of *letters* (a *word*). It consists in cutting the TS into segments, and affecting a letter to each segment (according to the average value of this segment).

In this tutorial, we will seek to regroup cities with the same temperature evolutions over the last 5 years.

We will proceed in two steps:
- **simplify the dataset**: using the Symbolic Aggregate Approximation tool ([SAX](/doc/operators/sax.html))
- **performm a clustering** on these results to provide a synthetic visualization (usage of the [K-mean](/doc/operators/kmeansOnPatterns.html) operator).

## Step 1: simplify the dataset

The temperature range is of the order of 60 °F. We choose an `alphabet size` of 25, which cuts the temperature range into segments of 2 or 3 °F.
The data present 45000 hours. 200 H segments (a little over 8 days) were chosen. The level of detail seems sufficient to observe general trends.Then, the [SAX operator's](/doc/operators/sax.html) parameter can be set.

![Alternate Text](/img/tuto_Sax/sax_parameters.png){: .center-image, width="500px" }

## Step 2: A representation of the result

`Sax` operator output words, which are not directly workable... This result have to be transformed to produce a synthetic visualization. An usual way is to perform a *k-means clustering* on these data. This operation is performed by the IKATS operator [K-means](/doc/operators/kmeans.html).

Connect the [K-means](/doc/operators/kmeans.html) operator to the SAX output by choosing for example 4 clusters. We obtain this visualization:

![Alternate Text](/img/tuto_Sax/kmeans_sax.png "Clusters visualisation"){: .center-image, width="600px" }

Cities names are accessible by simply hovering over the mouse. The relevance of clustering is easily verified, with nearby cities within the same clusters. In this visualization, the cross point represents the centroid of the cluster.

You can interact with this visualization:
- click on a point leads to the visualisation of the corresponding TS (e.g. *Toronto_temperature*)
- click on a cross point (a *centroid*) to access to the visualisation of all the TS of the cluster (e.g : *Toronto_temperature, Montreal_temerature, Boston_temperature, Detroit_temperature*)

Now, you are able to use efficiently the SAX operator.

Return to the [list of all tutorials](/tutorials.html).
