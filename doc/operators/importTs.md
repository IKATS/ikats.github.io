---
title: Import TS
date: 2018-03-11 08:00:00 +02:00
layout: default
published: true
---

# Import TS
This IKATS operator allows to import a set of timeseries located in the `/var/lib/ikats/IKATSDATA`, in CSV files.

## Operator Description

From the Root Path, the operator will scan for CSV files in all requested sub directories and will import the points of each to IKATS.
In a same time, depending on the path structure, it will extract some metadata and will associate them to the timeseries being created.

### CSV file format
- Column separator is `;`
- Extension may be different from CSV, only the content is checked
- First line will be skipped but is usually filled with `Time;Value`
- Each line refers to a single point referenced by a date and a value
  - *date* shall be compliant with the format : `[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}\.[0-9]([0-9]{2})?` (or `YYYY-MM-DDTHH:mm:ss.xxx` where xxx may have 1 or 3 digits, and hour is expressed in 24h format).
  Date can be completed with the GMT or UTC mention. In any case, these dates will be translated in GMT format in IKATS database.

  - *value* shall be a float

## Input and parameters

This operator takes no input but contains 5 parameters:

- **Dataset**: Name of the created Dataset
- **Description**: Description for this dataset
- **Root Path**: Root path of the data files on server side (UNIX format)
- **Path mapping rule**: Regular expression for defining metric over metadata
- **FID name rule**: Pattern used to define the name of each TS

## Outputs

This operator produces 3 outputs:

- **TS list**: List of timeseries imported
- **Name**: Name of the dataset created (same as parameter)
- **Log**: A summary (as text) of the import session

## Example

### Path structure
/portfolioMGH1/data/Group1/ewa.txt<br/>
/portfolioMGH1/data/Group1/ewb.txt<br/>
/portfolioMGH1/data/Group2/ewc.txt<br/>
/portfolioMGH1/data/Group2/ewd.txt

In this case, we have access to two metadata: the `Group` (between "Group1" and "Group2"), and the `metric` ("ewa", "ewb", "ewc", "ewd").

### Parameters
- **Dataset**: `DS_Test`
- **Description**: `My wonderful description`
- **Root Path**: `portfolioMGH1`
- **Path mapping rule**: `/data/Group(?<group>[0-9]+)/(?<metric>.*)\.txt`
- **FID name rule**: `Portfolio_${group}_${metric}`

Indeed, with this set of **Path mapping rule** parameter, operator will read all sub-directories, and create two metadata (`<group>` and `<metric>`), corresponding to two level of folder.

Need help with regex ? See [regex101](https://regex101.com/).


### Expected results

4 TS created:<br/>
Portfolio_1_ewa with following metadata : group=1, metric=ewa<br/>
Portfolio_1_ewb with following metadata : group=1, metric=ewb<br/>
Portfolio_2_ewc with following metadata : group=2, metric=ewc<br/>
Portfolio_2_ewd with following metadata : group=2, metric=ewd


See another example in [Tutorial 3 : Import your data](/doc/tutorials/tuto_imports.html)

## Warnings
  Due to OpenstSDB , import is not possible for data with timestamp inferior to 10000000000 ( date of 26 Apr 1970 17:46:40 ).

  In case of error, it can become impossible to run again the import operator, even with new parameters. In this case, press Ctrl-SHit-R, create a new workflow, and run again the import with new parameters.


Return to the [list of all operators](/operators.html)
