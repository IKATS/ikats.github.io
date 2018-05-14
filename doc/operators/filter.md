---
title: Filter
date: 2018-01-15 15:00:00 +02:00
layout: default
published: true
---


# Filter

This IKATS operator filters TS based on metadata criteria

## Input and parameters

This operator only takes one input of the functional type `TS_list`.

It also takes 1 or more parameters from the user :

- **metadata** : filtering criteria, can be string, boolean, number ...




## Output

The operator has one output :

 - **TS list** : list of TS that validate the filter

## Examples


- select a pattern :
> `city` **like** %York

- metadata in a list of value :

 >`city` **in** Miami;Atlanta;New-York


- select TS whose metadata are also in a table named
`usa_pop` :

  <TABLE usa_pop class="table-bordered">
	<TR>
		<TH>cities</TH> <TH>population</TH>
	</TR>
	<TR>
		<TD>New-York</TD> <TD>  8 538 000  </TD>
	</TR>
  <TR>
		<TD>Miami</TD> <TD>453 579</TD>
	</TR>
	<TR>
		<TD>Atlanta</TD> <TD>472 522</TD>
	</TR>
  </TABLE>


> `cities` **in table** usa_pop
  extract all TS with a metric `cities` that have for value 'New-York', 'Miami' or 'Atlanta'.


> `city` **in table** usa_pop.cities
extract all TS with a metric `city` that have for value 'New-York', 'Miami' or 'Atlanta'.



 For other examples, see [Tutorial 4 : Filter and clean data](/doc/tutorials/tuto_cutY.html)


Return to the [list of all operators](/operators.html)
