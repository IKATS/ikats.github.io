---
title: resample
date: 2018-01-15 15:00:00 +02:00
layout: default
published: true
---
# Resample

This IKATS operator resamples each timeseries provided. The method is to process slices of original data, beginning at the first timestamp, of a size multiple of original period and of resampling period.

Several cases have to be considered :
DOWNSAMPLING (resampling period > original period) : we suppress points.
UPSAMPLING (resampling period <= original period) : we add points (or decompression for the equality case).


# Prerequisits
- Original period is based on metadata `qual_ref_period`, so use [Quality indicators](/doc/operators/qualityIndiactors.html) operator before resampling.

- Input timeseries shall be periodic (holes allowed)


## Input and parameters

This operator only takes one input of the functional type **TS_list**.

It has also 4 parameters :

- **period** : target period for resampling (in ms)
- **Adding method** : Method to use for interpolation ('VALUE_BEFORE', 'LINEAR_INTERPOLATION', 'VALUE_AFTER')
- **Timestamp Position** : timestamp position in the interval while downsampling ('BEG','MID','END')
- **Aggregation Method** : aggregation method for downsampling ('MIN','MAX','MED','AVG','FIRST','LAST')


## Outputs


The operator has only one output :

 - **Ts list** : New TS take a name defined by ${input_name}\_resampled\_to\_${period}ms\_${timestamp\_position}\_${aggregation_method}

## Warnings
If resample failed, be sure :
- metadata are calculated
- target name is available for each timeseries. It's not yet possible to perform the same resampling operation (same TS, all the same parameters) several times without first cleaning the database.    

Return to the [list of all operators](/operators.html)
