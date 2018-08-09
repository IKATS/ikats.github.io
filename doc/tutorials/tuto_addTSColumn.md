---
title: Tuto AddTSColumn
date: 2017-09-29 10:00:00 +02:00
layout: default
published: true
---

# How to "add" a TS inside a `Table`

This tutorial show a usecase for the [addTSColumn](/doc/operators/addTsColumn.html). Here, the purpose is to fill a `Table` with timeseries. This type of table could be used in some machine learning algorithm.

## Target

In this tutorial, we use data from [Previous tutorial](/doc/tutorials/tuto_TS2Feature.html), by default, these data are available in the `Historical_hourly_weather`. For pedagogical purpose, we limit the dataset, we just work on two cities (*Boston and Dallas*), and on two features (*humidity and pressure*)<SUP>[1](#create_ds)</SUP>.

We want to add a *link* to a TS inside a requested `Table`. In other words, we want to obtain this type of data:

![An example of requested output](/img/tuto_addTSColumn/output.png){: width="800px" class="center"}

*Where `Boston_humidity`, `Boston_pressure`, `Dallas_humidity`, and `Dallas_pressure` are links to TS.*
## Build inputs

This type of result is providen by [addTSColumn](/doc/operators/addTsColumn.html) operator. This operator takes 2 inputs: a `DS_name` (the list of timeseries to *"link"*), and a `Table` (in this case, the table containing columns *city* and *target*).

### `Table`
First, let's create this table (in a CSV file), and read it into IKATS.

Create a csv file containing the requested *city* name, and add a column *target* (representing for example the target value for a machine learning algorithm).

>city, Feature X, target
>
>Dallas, 0, 0
>
>Boston,0, 1

Save this table (the path does not matter), and use the [Population Selection](/doc/operators/populationSelection.html) operator to load it in IKATS.


### <a class="anchor" id="create_ds">`DS name`</a>
Here is a detail on the workflow to create your `DS name` i.e. the name of the `Dataset` (containing the requested list of TS). If you want more explanation about operations performed here, see this [tutorial](tuto_basics.html).

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

- **Metrics**: We want to add two columns to the input `Table` object (here, *humidity* and *pressure*). These columns correspond to existing `metrics` in the input `Dataset`. *(See [here](/doc/tutorials/tuto_basics.html) to add manually metadata, or operator [import metadata](/doc/operators/importMetadata.html).)*
- **join column names**: Identifier of the row in the input `Table` (here *city*)
- **join meta name**: A metadata field of the input `Dataset`.

The two last parameters are used to join inputs `Dataset` and `Table` (here *city*).

*Note that values of **city** corresponds in the input `Dataset` and `Table` (Boston, Dallas).*

- **target column name**: The name of the column put at last column, for a better visual effect on your `Table`(here column *target*)


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
