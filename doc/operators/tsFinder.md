---
title: TS Finder
date: 2018-01-15 15:00:00 +02:00
layout: default
published: true
---
# TS Finder

This IKATS operator allows to find TS according a pattern in their name.
This operator searchs among all the available TS, whether they are associated with a Dataset or not.

## Input and parameters

It takes 2 parameters from the user :

- **Pattern to find** : Linux style, wildcards ( \* ) allowed
- **Case Sensitive** : Off/On


## Output

The operator has one output :

 - **TS list** : list of TS found during the search


### Examples

- `fr_*A*-S*r` : return  "fr_Anakin-Skywalker" and "fr_American-Sniper"

See [Tutorial : Basics](/doc/tutorials/tuto_basics.html) or [Tutorial : Filter and clean data](/doc/tutorials/tuto_cutY.html) for more examples.


Return to the [list of all operators](/operators.html)
