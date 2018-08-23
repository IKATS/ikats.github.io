---
title: Export TS
date: 2017-09-29 10:00:00 +02:00
layout: default
published: true
---
# Export TS

Export a `Dataset` in a csv file (or in multiple csv files).
## Input and parameters


This operator takes 1 inputs:

- **DS name** : the name of the `Dataset` to export


This operator takes 1 parameter from the user :

- **Destination tree pattern** : Pattern used to build destination tree. You can use metadate name, and 2 more keywords `{DSname}`, and `{fid}`.

*Example: `{DSname}/{qual_nb_points}_{fid}.csv` will create :
- one directory (named as the name of the input Dataset),
- one csv file per TS of the input `Dataset`. E.g. *450_PORTFOLIO_EWA*, if the TS contains 450 points (=`{qual_nb_point}`), and  has `PORTFOLIO_EWA` as Functionnal IDentifier (`{fid}`)

## Outputs

The operator has 1 output:
sudo apt install tree
- **Path** : Path of the created file(s)


Return to the [list of all operators](/operators.html).
