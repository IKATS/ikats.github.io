---
title: Cut-DS by metric
date: 2019-01-22 10:00:00 +02:00
layout: default
published: true
---

# Advanced filtering with `Cut-DS by metric`

In this tutorial, we will see how to use operator [Cut-DS by metric](/doc/operators/cutByMetric.html) cuts all the timeseries that satisfy a condition on a given metric.

## Use-case

In this tutorial, we keep using the meteorological dataset from [tutorial "Filter and clean data"](/doc/tutorials/tuto_cutY.html).
This dataset, called `Historical_hourly_weather`, has already be loaded in a previous step. It's now directly usable thanks to [Data Selection](/doc/operators/datasetSelection.html) operator. The dataset contains 5years of meteorological indicators.

What is the behaviour of the meteorological indicators when temperature is hight (T > 29° C). Note that temperatures are in Kelvin, the criterion is in fact *T > 300° K*.

### Notes
In fact, this operator can be used to select data corresponding to a season for example. Or, in more complex use-cases, to focus on a particular event impossible to select with a simple [cut DS operator](/doc/operators/cutDS.html).

## Select requested TS
Let's have a look on some sample. In this tutorial, we just consider 2 cities: `Miami` and `Jacksonville` (Florida). And 2 meteorological indicators (`temperature`, `pressure`).

You can select the corresponding TS with [filetr operator](/doc/operators/filter.html)

![Filter](/img/tuto_cutDSMetric/tuto_cutDS_filter_operation.png){: class="center"}

Parameters used:
* *`metric` in `temperature;pressure`*
* *`city` in `Jacksonville;Miami`*

## Perform `cut-DS by metric`

We want to select the `pressure` when temperature in the city is higher than 300° K (~29° C). We cat do that using the `cut-DS by metric` operator.
Note that this operator have a `DSname` in input. You have to perform a [Save as dataset](/doc/operators/saveAsDataset.html) after the `Filter`.

![cut](/img/tuto_cutDSMetric/tuto_cutDS_cutOperation.png){: class="center"}

Parameters used:
* *Metric (M): `temperature` (the metric for the cut condition)*
* *Cut condition: `M>300` (the condition used to select points in TS)*
* *Group by: `city` (the aggregation used, must be a metadata)*
* *FuncId pattern: `{fid}_{M}_cut` (the resulting TS will be named according to this pattern)*

We then obtain this kind of curves.

![result](/img/tuto_cutDSMetric/tuto_cutDS_curves.png){: class="center"}

To conclude, `cut-DS by metric` can be used to perform complex filtering according to data values. Note that the usage of metadata (especially `metric`) is essential in this operation. Keep it in mind when you creates your TS !

Return to the [list of all tutorials](/tutorials.html).
