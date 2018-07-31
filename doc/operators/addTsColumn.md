---
title: Add TS Column
date: 2017-09-29 10:00:00 +02:00
layout: default
published: true
---
# Add TS Column

Add a TS as new column to an existing `Table` (providen in input). More precisely, each cell of these new columns contains one *links* to an unique timeserie.

## Input and parameters


This operator takes 2 inputs:

- **DS name** : the dataset that contains TS you want to add (*link*)
- **Table** : an existing table to modify

This operator takes 5 inputs from the user :

- **Metrics** : List of selected metrics of the input `DataFrame` (separated by `;`), columns to add to the input `Table`
- **Join column name** : Identifier of the row in the inputed `Table`, used by the join
- **Join meta name** : A metadata field of the input `Dataset`. used by the join (usefull when the column and the metadata are different)
- **target column name** : Name of the target column, if exist (Supervised Learning purpose)
- **output table name** : name of newly created table

*Note: The operator need to perform a "join" operation between the two inputs (`Dataset` and `Table`). This operation is performed using:*
- *content of column "Join column name" in the input `Table`*
- *values of metadata "Join meta name" in the input `DataSet`*

*Values should correspond (else error).*

## Outputs

The operator has 1 output:

- **Table** : The result table

The operator will create a `Table` containing *Join column name* values as row names, content of *target column name*, and one column per *Metrics* provided.

A tutorial with a full usecase is available in [Tutorial : How to "add" a TS link inside a `Table`](/doc/tutorials/tuto_addTSColumn.html).


Return to the [list of all operators](/operators.html).
