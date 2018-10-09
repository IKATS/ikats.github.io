---
title: Basics
date: 2017-09-29 10:00:00 +02:00
layout: default
published: true
---


# My first Data Exploration

Data mining exploration starts usually with the data selection but not necessarly - it could be the output of a workflow already designed. At the start, IKATS opens an empty framework screen. From here you can either create a new data mining workflow or browse through the ones you have already created/saved. If you are running IKATS for the first time, start by clicking on the [IKATS Overview page](/overview.html) to get quick insights on IKATS interface.

IKATS operators communicate with each other: they receive data on the input and send out filtered or processed data, or anything the operator does on the output. Please, refer to the  [Operators available](/operators.html) to have a full description of all operators available.

This tutorial show some operations to manage an available `DataSet`. If you want to direclty work on your own data, please, refer to the [Tutorial : Import your data](/doc/tutorials/tuto_imports.html).

## Dataset Selection

To select a Dataset :
- drag and drop the [Dataset Selection](/doc/operators/datasetSelection.html) operator from the toolbox to the workflow panel (1),
- use the parameters panel to choose the Dataset you want to exploit (e.g. `WEBTraffic`) (2)
- press “Run” to load the result into the `Dataset Selection` component (3) which turns green.

![Texte alternatif](/img/tuto_basic/datasetSelection.png "DataSet selection"){: width="600px" class="center"}


## Metadata edition

A dataset is composed of several timeseries (TS).
In addition to the data, each one also contains a series of metadata, such as the number of points, the date ... Some metadata are calculated when the dataset is created (see [Dataset import](/doc/operators/importTs.html)), but most (those whose names begin with `qual_`) are calculated via the [Quality indicators](/doc/operators/qualityIndicators.html) operator.

![Texte alternatif](/img/tuto_basic/mdedit.png "MDEDIT"){:width="600px"  class="center"}

### Warning
Through this interface, you can also update, delete, or add a new metadata (TS by TS). Be careful, changes are under your responsability : some calculated metadata are required for further computations or visualisations.

## TS Filter
Then, a filter must be applied to reduce the data set:
- drag and drop the [Filter](/doc/operators/filter.html) operator from the toolbox to the workflow panel (1)
- connect the two operators (click and move the output of the previous component to the new operator's entry) (2), - use the parameters panel to choose among the previous component metadata those you want to filter<SUP>[1](#remark)</SUP> (3)
- press “Run” to load the result into the Filter Component (4) which turns green.

Here we have filtered 97 TS from the 11989 of the entire dataset.

![Texte alternatif](/img/tuto_basic/filter.png "filter"){: width="600px" class="center"}

<!-- class "anchor" permits to not hide link with header-->
<a id="remark" class="anchor">1</a>: Here, parameters choosen are:
- `language` *like* `de`: select all TS which contains "de" in their metadata *country*
- `qual_average` *>* `50`: select all TS corresponding to an averge value > 50.

## Manual selection
It is also possible to manually choose TS, without applying a filter on the metadata.
To select manually from the TS among those available in the previous component:
- drag and drop the [Manual Selection](/doc/operators/manualSelection.html) operator from the toolbox to the workflow panel (1)
- connect it with the output `TS List` of the previous component (2)
- choose requested TS to keep in output (use by Ctrl + click for select multiple) (3)
- press "Run" to load the result in the `Manual Selection` component of your workflow (4) which turns green.

![Texte alternatif](/img/tuto_basic/manualSelection.png "manual selection"){: width="800px" class="center"}

## Save as new DataSet

In the previous example, we have selected 4 interesting TS that we can save in a dataset in order to use it independently from previous dataset.

To save this TS list in a new Dataset :
- drag and drop [Save as Dataset](/doc/operators/saveAsDataset.html) operator from the toolbox to the workflow panel (1)
- connect entry to previous output (2)
- select in the TS list those you want to save, and give a name and a description to the new dataset (e.g. *subset_webTraffic)  (3)
- press “Run” to load the TS chosen into the new dataset (4). The `Save as Dataset` component turns green.


![Texte alternatif](/img/tuto_basic/saveDataset.png "save as dataset"){: width="800px" class="center"}


## TS Finder
We now want to add new TS (from an other DataSet) to our selection (*subset_webTraffic* in previous the example). We have to use the [TS finder](/doc/operators/tsFinder.html) operator.
Note that in IKATS, each TS have an unique `Functional IDentifier` (FID). The `TS Finder` operator permits to find TS searching on the FID.

To select new TS list :
- drag and drop [TS finder](/doc/operators/tsFinder.html) operator from the toolbox to the workflow panel (1)
- choose a pattern to find (for example all the TS whose name starts with *fr_A*) (2)
- press “Run” to find all registered TS matching the pattern (3)


![Texte alternatif](/img/tuto_basic/TSFinder.png "TS Finder"){: width="700px" class="center"}

## Merge TS Lists

We can merge several TS Lists in one single `Dataset` via the [Merge  TS Lists](/doc/operators/mergeTsLists.html) operator.

To merge TS lists :
- drag and drop the [Merge  TS Lists](/doc/operators/mergeTsLists.html) operator from the toolbox to the workflow panel (1)
- connect it with the result of the 2 previous outputs of type `TS List` (2)
- press “Run” to merge the TS lists (3)

![Texte alternatif](/img/tuto_basic/MergeLists.png "Merge TS Lists"){: width="700px" class="center"}

Now, you know how to select requested TS to build your own `Dataset`.


## Export a table as CSV

To finish, we want to export a table into a `CSV file`.

To export a table :
- go to `Data Mgt`(1)
- select `Tables` button (2)
- find the table you want to export and press “Download” in the *actions* column (3)

![Texte alternatif](/img/tuto_basic/ikatsExportTable.png "Merge TS Lists"){: width="700px" class="center"}

Now, you know how to `export` a table.

Return to the [list of all tutorials](/tutorials.html).
