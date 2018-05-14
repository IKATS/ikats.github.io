---
title: Import Metadata
date: 2018-03-11 08:00:00 +02:00
layout: default
published: true
---




# Import Metadata
This IKATS operator allows to import a set of metadata located in a CSV file `provided from the user file system`

## Operator Description:

The operator will extract from the file the list of metadata to create for timeseries identified by its Functional Identifier (FID) or by its metric (found in *already imported metadata*).
Using *metric* instead of FID can be useful to apply a set of metadata common to a specific metric (as a metric *unit* for example).

### CSV file format
- Column separator is `;`
- First column indicate the Functional Identifier (FID) of the timeseries to fill or the metric
- First line provides the list of metadata names followed by their type (after `#` character), pay attention to the first `;`
- Types can be `number` (formatted with a dot *.*) or `string`
- Other columns contains the value of the desired metadata for a specific timeseries
- If "cell" is empty, no metadata will be created for this tuple (timeseries, metadata)  

**=> if a syntax error is detected in the csv file, no metadata will be imported at all**

## Input and parameters

This operator takes no input but contains 2 parameters:

- **Select a CSV file**: Location of the CSV file located on the user disk (client side)
- **Overwrite**: Set to true to overwrite if the metadata already exist. If false, the operator will fail if the metadata already exist

## Outputs

This operator produces 1 output:

- **Log**: A summary (as text) of the import

## Example with Portfolio:

### Time series already in database
- Portfolio_1_ewa  (metric=**ewa**)
- Portfolio_1_ewb  (metric=ewb)
- Portfolio_2_ewa  (metric=**ewa**)
- Portfolio_2_ewc  (metric=ewc)
- Portfolio_2_ewd  (metric=ewd)


### Parameters
- **Select a CSV fil** : file content provided to the operator :
```
;metadata1#number;metadata2#string
Portfolio_1_ewb;1.3;toto
Portfolio_2_ewa;2;titi
ewa;;testString
Portfolio_2_ewd;3;
```
- **Overwrite** : set to true to overwrite existing metadata, if exist
### Expected results
*metadata generated (functional id/metadata name/metadata value)* :    

Portfolio_1_ewb/metadata1/1.3  
Portfolio_2_ewa/metadata1/2  
Portfolio_2_ewd/metadata1/3  
Portfolio_1_ewb/metadata2/toto  
Portfolio_2_ewa/metadata2/titi  
Portfolio_1_ewa/metadata2/testString  
Portfolio_2_ewa/metadata2/testString


Return to the [list of all operators](/operators.html)
