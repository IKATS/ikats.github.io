---
title: Basics
date: 2017-09-29 10:00:00 +02:00
layout: default
published: true
---


My first Data Exploration
-------------------------

Data mining exploration starts usually with the data selection but not necessarly - it could be the output of a workflow already designed. At the start, IKATS opens an empty framework screen. From here you can either create a new data mining workflow or browse through the ones you have already created/saved. If you are running IKATS for the first time, start by clicking on the [IKATS Overview page](/overview.html) to get quick insights on IKATS interface.

IKATS operators communicate with each other: they receive data on the input and send out filtered or processed data, or anything the operator does on the output. Please, refer to the  [Operators available](/operators.html) to have a full description of all operators available.



## Dataset Selection

To select a Dataset :
Drag and drop the Dataset Selection operator from the toolbox to the workflow panel (1), use the parameters panel to choose the Dataset you want to exploit  (2) and then press “Run” to load the result into the Dataset Selection component  (3) which turns green :

![Texte alternatif](/img/tuto0/datasetSelection.png "DataSet selection"){: .center-image, width="600px" }


## Metadata edition

A dataset is composed of several timeseries (TS).
In addition to the data, each one also contains a series of metadata, such as the number of points, the date ... Some metadata are calculated when the dataset is created (see [Dataset import](/doc/operators/importTs.html)), but most (those whose names begin with **qual _**) are calculated via the [Quality indicators](/doc/operators/qualityIndicators.html) operator.

![Texte alternatif](/img/tuto0/mdedit.png "MDEDIT"){: .center-image, width="600px" }

Warning
=======
Through this interface, you can also updtae, delete, or add a new metadata (TS by TS). Be careful, changes are under your responsability : some calauclated metadata are required for further computations or visualisations.

## TS Filter

 Drag and drop the Filter operator from the toolbox to the workflow panel (1) and connect by click and move the output of the previous component to its entry (2), use the parameters panel to choose among the previous component metadata those you want to filter  (3) and then press “Run” to load the result into the Filter Component (4) which turns green :

Here we have filtered 97 TS from the 11989 of the entire dataset.

![Texte alternatif](/img/tuto0/filter.png "filter")

## Manual selection
It is also possible to manually choose TS, without applying a filter on the metadata.
To select manually from the TS among those available in the previous component: Drag and drop the Manual Selection operator from the toolbox to the workflow panel (1) and connect by click and move the output of the previous component TS List entry (2) use by Ctrl + click (3) and then press "Run" to load the result in the Manual Selection component of your workflow (4) which turns green:

![Texte alternatif](/img/tuto0/manualSelection.png "manual selection")

## Save as new DataSet

Here we have selected 4 interesting TS that we can save in a dataset in order to use it independently de l'ancien dataset.

To save this TS list in a new Dataset :
Drag and drop Save as Dataset operator from the toolbox to the workflow panel (1). Click and move to the TS list entry from the output of previous operator (2). Select in the TS list those you want to save, give a name and a description to the new dataset  (3). Press “Run” to load the TS chosen into the new dataset (4) : the Save as Dataset component turns green :


![Texte alternatif](/img/tuto0/saveDataset.png "save as dataset")


## TS Finder

We now want to enrich our selection of other TS, which may belong to other Datasets or not be associated with a particular dataset.

To select new TS list :
Drag and drop [TS finder](/doc/operators/tsFinder.html) operator from the toolbox to the workflow panel (1). Choose a pattern to find (for example all the TS whose nome starts with *fr_A*) (2).  Press “Run” to filter the TS matching the pattern (3).


![Texte alternatif](/img/tuto0/TSFinder.png "TS Finder")

## Merge TS Lists

We can gather several TS lists in one via the [Merge  TS Lists](/doc/operators/mergeTsLists.html) operator.

To merge TS lists :
Drag and drop Merge  TS Lists](/doc/operators/mergeTsLists.html) operator from the toolbox to the workflow panel (1) and connect by click and move the outputs of previous components to its TS List entries (2). Press “Run” to merge the TS lists (3).

![Texte alternatif](/img/tuto0/MergeLists.png "Merge TS Lists")
