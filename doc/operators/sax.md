---
title: Symbolic Aggregate approXimation
date: 2018-01-15 15:00:00 +02:00
layout: default
published: true
---
# SAX

SAX transforms a time-series of length **qual_nb_points** into a string of arbitrary length L, using an alphabet A of size a > 2. The algorithm consist of two steps: it transforms the original time-series into PAA segments, then it converts the PAA data into a string.


## Input and parameters

This operator only takes one input of the functional type **ds_name**.

It also takes 2 inputs from the user :

- *alphabet size* : The number of equal areas along Y axis
- *Nb of PAA segments* : The number of equal segments (along X axis) calculated before applying SAX algorithm.


## Outputs

The operator has one output :

 - *result* :  A dictionary (JSON format) composed of the PAA result, the SAX breakpoints and the SAX string. Result can be visualized and used as input in [K-Means](/doc/operators/kmeans.html) operator


## Example

Portfolio is a list of timeseries found on the net in the Financial domain, with no specific interest oher than its simplicity.
- alphabet size : 6
- Nb of PAA segments : 20


![Portfolio_ewa SAX](/img/operators/sax_portfolio.png)


## Warning

If you are applying the operator to a series of TS, take care that each TS has enough points to be able to ensure the nb of PAA segments. In the case of missing data, upstream use of the [resample](/doc/operators/resample.html) operator may be useful.



Return to the [list of all operators](/operators.html)
