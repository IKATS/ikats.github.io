---
title: Tuto AddTSColumn
date: 2017-09-29 10:00:00 +02:00
layout: default
published: true
---

# How to "add" a TS inside a `Table`

This tutorial shows a usecase for the [addTSColumn](/doc/operators/addTsColumn.html). Here, the purpose is to fill a `Table` with timeseries. This type of table is used in some machine learning algorithm.

## Target

In this tutorial, we use data data from [Previous tutorial](/doc/tutorials/tuto_TS2Feature.html), by default, these data are available in the `Historical_hourly_weather`. To limit the dataset, we just work on two cities (*Boston and Dallas*), and on two features (*humidity and pressure*)<SUP>[1](#create_ds)</SUP>.

We want to add a *target value* to each TS. In other words, we want to obtain this type of data:

![An example of requested output](/img/tuto_addTSColumn/output.png){: width="800px" class="center"}

## Build inputs

This type of result is providen by [addTSColumn](/doc/operators/addTsColumn.html)operator. As you know, this operator takes 2 inputs: a `DS_name` (the list of timeserie to *"link"*), and a `Table` (in this case, the table containing column *city* and *target*).

### `Table`
First, let's create this table (in a CSV file), and add it into IKATS.

Create a csv file containing the requested *city* name, and add a column *target* (representing for example the target value for a machine learning algorithm).

>city, target
>
>Dallas, 0
>
>Boston, 1

Save this table (the path do not import), and use the [Population Selection](/doc/operators/populationSelection.html) operator to load it in IKATS.


### <a class="anchor" id="create_ds">`DS name`</a>
Here is a detail on the workflow to create your `DS name` containing names of the requested TS. If you want more explanation about operations performed here, see this [tutorial](tuto_basics.html).

![DS name creation workflow](/img/tuto_addTSColumn/workflow_create_DS.png){: width="800px" class="center"}

This workflow contains:
- A [Dataset Selection](/doc/operators/datasetSelection.html) operator, extracting the standard `Historical_hourly_weather` dataset
- A [Manual Selection](/doc/operators/manualSelection.html) to select requested TS (*not mandatory*)
- A [Save as dataset](/doc/operators/saveAsDataset.html) operator, to save a `Dataset` containing the 4 requested timeseries (*mandatory to output a `DS name` object containing our requested TS*).

At this point, you have access to a `Dataset` containing 4 timeseries.

## The Add TS Column operation

### Parameters

The requested result is provided by `Add TS Column` operator. This section explains the arguments to set to obtain these result.

![parameters used](/img/tuto_addTSColumn/params.png){: width="800px" class="center"}

- **Metrics**: We want to add two columns to the input `Table` object (here, *humidity* ans *pressure*). These columns corresponds to existing `metrics` in the input `Dataset`. *(See [here](/doc/tutorials/tuto_basics.html) to add manually metadata, or operator [import metadata](/doc/operators/importMetadata.html).)*
- **join column names**: Identifier of the row in the input `Table` (here *city*)
- **join meta name**: A metadata field of the input `Dataset`. Used to join inputs `Dataset` and `Table` (here *city*).

*Note that values of **city** corresponds in the input `Dataset` and `Table` (Boston, Dallas).*

- **target column name**: The name of the column to add to result (here column *target*)


### Result

We obtain the requested table, some cells contains *link* to entire TS.

![An example of requested output](/img/tuto_addTSColumn/output.png){: width="800px" class="center"}

IKATS provides an interactive interface for this type of data. Click on a cell to visualize the linked TS. For example, double clicking on **Boston_humidity** provides this curve:

![Boston humidity](/img/tuto_addTSColumn/boston_humidity.png){: width="800px" class="center"}

## Full workflow

Here is the full workflow used during this tutorial.

![full_workflow](/img/tuto_addTSColumn/full_workflow.png){: width="600px" class="center"}

Now, you are able to use the `Add TS Column` operator.

Return to the [list of all tutorials](/tutorials.html).
