---
title: Unwrap
date: 2018-01-15 15:00:00 +02:00
layout: default
published: true
---
# Unwrap

This IKATS operator allows to *unwrap* cyclic TS, like TS containing angles (between 0 and 359 degrees).

## Input and parameters

This operator only takes one input of the functional type `TS_list`.

It takes 3 parameters from the user :

- **Unit** : Angle unit of the provided TS
- **Discontinuity** : Maximum discontinuity in the inputed TS, according to `Unit` argument. E.g. `180` for `Degrees`, `pi` for `Radians`.
- **FuncId pattern** : Uses Python string format to create a new funcid where `(fid)` is replaced by the old funcid (e.g. `%(fid)s__unwrap`)


## Output

The operator has one output :

 - **TS list** : list of outputed TS.


### Examples

- `%(fid)s__unwrap` : return  "Albuquerque_wind_direction__unwrap"

Return to the [list of all operators](/operators.html)
