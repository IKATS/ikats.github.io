---
title: Viz Tools
date: 2017-09-29 10:00:00 +02:00
layout: default
published: true
---


Time series visualisation
---------------------------------------------

One of the first features is browsing the timeseries and their visualisation.

First of all, let's start by selecting the `webTraffic 1` dataset (1), then filter some TS (2) (here French sites starting with the letter C and having a certain audience).


<img src="/img/tuto1/selectData.png" width="600" class="center">

By clicking on filter, one arrives on the menu of the operator.
Let's look at the output TS list (1): TS can be viewed in different ways via the pull-down menu (2). The `TsTable` option lists all the TS, with their names (3), the possibility to view each TS (4) independently, to select it (5) or to access its TSUID (6) which is his unique identifier in the application.

<img src="/img/tuto1/TSTables.png" width="600" class="center">

The second tab `curve` allows the visualisation of the entire selection.

<img src="/img/tuto1/curve1.png" width="600" class="center">

By clicking on the names of the TS in the legend (on the right), one can (de) select a set of TS. It is possible to zoom vertically or horizontally. To do this, select an area to view by click and drop (vertical or horizontal depending on your choice).

Zoom in needs to aggregate the data in order to fit the number of pixels of the screen. According to your desktop, I/O and cluster performances, that may take some seconds to request the server.

<img src="/img/tuto1/curve2.png" width="600" class="center">


After some selections and zooms, we follow time series fr_candide and fr_Coluche on approximately 8 months. The two timseries seem correlated.

<img src="/img/tuto1/curve3.png" width="600" class="center">

To verify this, we choose the `scatterPlot` visualisation option in the drop-down menu that allows us to easily confirm this impression.

<img src="/img/tuto1/scatterPlot.png" width="600" class="center">
