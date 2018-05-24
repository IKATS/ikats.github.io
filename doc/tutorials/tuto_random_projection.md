---
title: Random Projections
date: 2017-09-29 10:00:00 +02:00
layout: default
published: true
---


Similarities between TS via random projections
---------------------------------------------
In this tutorial, we use a subset of a dataset proposed on [Kaggle](https://www.kaggle.com/c/web-traffic-time-series-forecasting). Each of these time series represent a number of daily views of a different Wikipedia article, starting from July, 1st, 2015 up until December 31st, 2016.
The subset include 11989 TS from 7 languages (Deutsch, English, French, Spanish, Chinese, Russian, Japanese).


Warning : this tutorial helps understanding the role of this operator but if you want to play it , it requires on a PC with 16 G° RAM; if you have only 8G°, you can reach the limits and get a stack overflow. in this case, the operator will turn red with no result. You can try to use this operator with the sandbox on a smaller dataset.


[Random Projection](/doc/operators/randomProjections.html) is a technique used to reduce the dimensionality of a set of points.

The implementation in IKATS is based on [SAX](/doc/operators/sax.html). In summary, the TS is fragmented and each segment is assigned a letter based on its relative value.

We filter a subset of 7 TS (country: Russia and name begin with A) and then apply a random projection.
Parameters are provided with default values and can be optimized as needed.

Here, in order to show the ability of the algorithm to identify very similar patterns, we chose a strong `sequences size` and decreased the `neighborhood radius` to restrict the visualization to obvious matchings.

![Alternate Text](/img/tuto8/params_random_projection.png)

We observe the identical `current pattern definition` for both examples and the similarity of the patterns.

![Alternate Text](/img/tuto8/random_projection_ru_ABBA.png)

![Alternate Text](/img/tuto8/random_projection_ru_Adidas.png)
