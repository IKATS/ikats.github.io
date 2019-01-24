---
title: Merge tables
date: 2018-01-15 15:00:00 +02:00
layout: default
published: true
---
# Merge Tables

This operator produces an inner join between 2 tables only. The first table (in the order) is the reference : all columns will be in the result. The operator will copy all the columns of the second table except the join column.

The join key should be found in the 2 tables. If the join key is not provided, the first column in the first table is selected :
- If the first table has a header name for that column, that name will be used as join key to select the join column in the second table
- If the first table has no header, the first column of the second table is used to search matches for the join

If the first table has no header and there is no key provided, the first columns of the two tables are used to match for the join

## Input and parameters

This operator takes 2 `tables` as inputs

It also takes 2 inputs from the user :

- **Join on** : name of the column used as key to join. If not given, operator try to join thanks first columns. Each of the 2 input columns must contain this column (case sensitive).
- **Merged table name** : name of newly created table


## Outputs

The operator has 1 output:

- **Table** : The outputed `Table`

Return to the [list of all operators](/operators.html)
