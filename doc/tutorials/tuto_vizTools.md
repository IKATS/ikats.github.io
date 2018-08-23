---
title: Viz Tools
date: 2017-09-29 10:00:00 +02:00
layout: default
published: true
---



# Time series visualisation

In Data science, one of the key features is browsing and visualize timeseries. This tutorial presents the simple manipulations to obtain your first interactive visualizations.


## Select requested dataset

First of all, let's start by selecting your `Dataset`. Select the *WEBTraffic* dataset in the `DatasetSelection` operator (1), then [filter](/doc/operators/filter.html) some TS (2) (here French sites starting with the letter C and having a certain audience<SUP>[1](#remark)</SUP>).

<img src="/img/tuto_vizTools/selectData.png" width="600" class="center">

<!-- class "anchor" permits to not hide link with header-->
<a id="remark" class="anchor">1</a>: Here, parameters choosen are:
- `language` *like* `fr`: select all TS which contains "fr" in their metadata *country*
- `qual_average` *>* `50`: select all TS corresponding to an averge value > 50
- `metric` *like* `C*`: Select all TS containing "C" as first letter in their metadata *metric*


## Operator visualisation menu
By double-clicking on `filter`, you arrive on the menu of the operator.
Let's look at the output TS list (1), TS can be viewed in different ways via the pull-down menu (2):
- the `TsTable` option lists all the TS, with their names (3),
- the possibility to view each TS independently is available via clicking on *"visualize"* (4),
- you can also focus on a single TS via option *"focus on"* (5)
- finaly, to access to a particular `TSUID` (unique identifier of a TS in IKATS), click on *"see TSUID"* (6)

<img src="/img/tuto_vizTools/TSTables.png" width="600" class="center">

## Global visualization
The second tab `curve` allows the visualization of the entire selection.

<img src="/img/tuto_vizTools/curve1.png" width="600" class="center">

By clicking on the names of the TS in the legend (on the right), you can (de)select a set of TS. It is possible to zoom vertically or horizontally. To do this, select an area to view by click and drop (vertical or horizontal depending on your choice).

In a *zoom in* operation, IKATS automaticaly fit the number of pixels of the screen, aggregating the data. Depending on your desktop, I/O and cluster performances, that may take some seconds to request the server.

After some selections and zooms, we follow time series `Candide_fr` and `Coluche_fr`.

<img src="/img/tuto_vizTools/curve2.png" width="600" class="center">

The two timseries seem correlated...

## ScatterPlot
To verify this, we choose the `scatterPlot` visualisation option in the drop-down menu that allows us to easily confirm this impression.

<img src="/img/tuto_vizTools/scatterPlot.png" width="600" class="center">

Now, you are familiar with the basic visualization tools of IKATS.


Return to the [list of all tutorials](/tutorials.html).
