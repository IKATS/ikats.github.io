---
title: How to...
date: 2017-09-29 10:00:00 +02:00
layout: default
published: true
---


How To...
=========
>## How to start?
* You have either already ingested your data or not. IKATS allows you either to start from a DataSelection or to start from a workflow already saved.
See  the [Tutorials](/tutorials.html) section for practice.

<!--How to use a ML?

How to use Jupyter? -->

>## ... create a new TS from an existing one ?
* IKATS offers several ways to [cut a TS](/doc/operators/cutTs.html) and create a new one.

>## ... save/export a table ?
* See [tutorial Basics](/doc/tutorials/tuto_basics.html).


>## ... save operator parameters to allow them to be reused?
* For example, the [import](/doc/operators/importTs.html) operator takes several parameters, including REGEX expressions, and may require several tries before a successful import. The failure to the import changes the status of the operator to `failed`. You must then create a new operator for the next test. **Tip:** before clicking `run`, select the operator and click on` Save selection as Custom Operator` (bottom left panel). Parameters are saved (in `My Operators`) for the next try.

>## ... deal with floating points ?
* Decimal digits are stored as single-precision floats (4 bits) in `OpenTSDB`. A slight loss of precision can therefore be observed on import (eg a value of 0.7 in a `.csv` file is stored as 0.69999987 in OpenTSDB). Make sure you bear this in mind when using certain operators, such as [filter](/doc/operators/filter.html).

>## ... deal with Data management through PostgreSQL ?
* See [Some TIPS concerning Data management through PostgreSQL](/postgresql.html).
