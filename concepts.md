---
title: Concepts
date: 2017-09-29 10:00:00 +02:00
layout: default
published: true
---


Concepts
=========
Please refer to the [Tutorials](/tutorials.html) for a step by step introduction to IKATS.

This page introduces all IKATS Concepts.

DataSet
-------
A dataset is a collection of timeseries (TS) you will manipulate in IKATS Workbench.

Datasets are created by ingestion of csv files or by manipulating existing datasets.

Timeseries
-----------
A timeseries is a set of values associated with a StampDate. There is no restriction of data set length - a timeseries could be compound of a few to millions of values.

Operator
--------
An operator is an object the user can select in order to perform a certain task on the data, in general a dataset but also other data types. Each operator embeds some input and proposes a single operation such as pre-processing (resampling, filtering, etc...) timeseries, merging tables, model fitting or evaluation task. Operators receive data as input and produce as output filtered or processed data, new tables, models …

All available operators are listed in the `Operators menu`. Operators are both browsable and searchable from this menu. Explore the list of operators via the [list of all operators](/operators.html).

Note :
Operators can be native or customized by the user (`My operators`). In future versions, it will be possible to integrate new operators via contributions.


[Operator] Parameters
----------
Each operator uses a set of parameters that the user may define through the `Parameters contextual menu`. Once the user has setup all parameters, he can « launch / trigger  » the operator so IKATS processes input data and computes the result.


Population
-----
A population is, in the learning process, a list of instances (also called individuals ), described according to a list of characteristics (also called variables).
In the case of supervised learning, one of these variables is the target, ie, the variable to be explained.

Note :
A population is given by the user and is represented in a table format, a row for each individual, and a column for each variable.


Workflow
--------
Workflow consists of a sequence of several operators in order to combine their effects in a same data analysis playscript.
In IKATS, Workflows can be saved in order to memorize both the `playscript`, with the parameter's values which have been specifically defined and all the associated results.
Workflows can be updated and deleted. In case of deletion, some computed results which are not stored specifically (in metadata or in tables for instance) will not be retreived later.

Workbench
---------
IKATS is a great data mining tool kit dedicated to timeseries. IKATS is designed for beginners as well as for expert data scientists. Thanks to its set of ready-to-use operators and its user-friendly interface, users can focus on data analysis instead of laborious coding, transforming a construction of complex data analytics tasks in a simple pipeline.

MetaData
---------
In order to describe or complete information about a given timeseries, the user may associate some specific attributes to each timeseries.
A `metadata` (MD) is an association (timeseries, metadata_name, values). For instance, the user may add the metadata *equipment* that indicates which equipment/ object/ sensor is the origin of the time series.

ALl timeseries MUST have a metadata named `metric` which will be used by IKATS as the main index to retrieve the TS.

Some metadata are computed automatically by IKATS , as soon as data are integrated, or mainly by the [quality indicators](/doc/operators/qualityIndicators.html) which computes the number of points, the frequency ... of each TS. These metadata can be identified since their name have the form *qual_\**.

After import, the user can always add new metadata , either manually, TS by TS , or from a .csv file, through the operator [Import Metadata](/doc/operators/importMetadata.html).



IKATS data types
================

IKATS assigns different data types to input and ouput attributes.


TS_list
-------
Many operators manipulate a list of timeseries. A list can be stored and identified with a dataset name, and stored through the [Save as a Dataset Metadata](/doc/operators/saveAsDataset.html) operator. On the other hand, the user may not need to rename the list to manipulate it. In this case, the output of one operator can be used as an input of a second one. the TS list type just informs the user about the type of linked data.


Table
------
A table can be useful to present information such as statistics or other results computed from the datasets.
A table in IKATS looks like any table  used in databases or in any Excel, with rows and columns. Rows and columns may have a header giving labels of these rows / columns.
According to the data included in the table, the user may interact with it. For instance, if a cell / row contains information concerning a unique timeseries, a simple click on this cell / line will open the visualisation tool for this timeseries.


DS_name
--------
Some operators require the name of a Dataset (text format) as input.


<!--Pattern_groups>
--------------
This data defines a list of grouped patterns used to store and to visualize search patterns algorithms results (like pattern matching, random projection, RHM …) -->


Other types
--------

Some operators manipulate specific objects. You will find the information on the expected input in the [operator documentation](/operators.html).
