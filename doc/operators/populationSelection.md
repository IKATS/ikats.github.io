---
title: Population selection
date: 2018-01-15 15:00:00 +02:00
layout: default
published: true
---
# Population Selection

This IKATS operator allows the import of a file (usualy a `csv` file) into a `Table` object. All these `Tables` are available in menu `Data Mgt/Tables`.


## Input and parameters

It takes 3 inputs from the user :

- **select a csv file** : file location in the disk
- **population name** : name given to the table which will contain the data file
- **table key (row name)** : primary key (must be in the header) that identifies each record (rows) in the table

## Outputs

The operator has one output :

 - **Table** : the given data  in a format `Table`

## Example
See [Tutorial : Import your data](/doc/tutorials/tuto_imports.html).



Return to the [list of all operators](/operators.html)
