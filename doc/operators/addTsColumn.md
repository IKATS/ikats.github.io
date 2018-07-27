---
title: Add TS Column
date: 2018-01-15 15:00:00 +02:00
layout: default
published: true
---
# Add TS Column

Add a TS as new column to an existing table.

## Input and parameters


This operator takes 2 inputs:

- **DS name** : the dataset that contains TS you want to add
- **Table** : an existing table

This operator takes 5 inputs from the user :

<!-- TODO : Show a usecase -->

- **Metrics** : List of selected metrics (separated by `;`)
- **Join column name** : The name of the Table used by the join
- **Join meta name** : The name of the metadata used by the join (usefull when the column and the metadata are different)
- **target column name** : Name of the target column, if exist (Supervised Learning purpose)
- **output table name** : name of newly created table


## Outputs

The operator has 1 output:

- **Table** : The result table


Return to the [list of all operators](/operators.html).
