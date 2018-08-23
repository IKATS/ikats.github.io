---
title: resampling TS
date: 2018-01-15 15:00:00 +02:00
layout: default
published: true
---
# Resampling TS

This IKATS operator resamples each timeseries provided. The method is to process slices of original data, beginning at the first timestamp, of a size multiple of original period and of resampling period.

Two cases have to be considered :
- *downsampling* : (resampling period > original period) : we suppress points ("Agregation")
- *upsampling* : (resampling period <= original period) : we add points, or decompression for the equality case ("Interpolation")


## Prerequisits
- Original period is based on metadata `qual_ref_period`, so use [Quality indicators](/doc/operators/qualityIndicators.html) operator before resampling

- Input timeseries shall be periodic (holes allowed)


## Input and parameters

This operator only takes one input of the functional type **TS_list**.

It has also 4 parameters :

- **Period** : target period for resampling (in *ms*)
- **Adding method** : Method used in case of upsampling (interpolation) ('VALUE_BEFORE', 'LINEAR_INTERPOLATION', 'VALUE_AFTER')
- **Timestamp Position** : timestamp position in the interval while downsampling ('BEG': Begin,'MID': Middle,'END': End)
- **Aggregation Method** : aggregation method for downsampling:
  - MIN: Apply minimum
  - MAX: Apply Maximum
  - MED: Get the median point
  - AVG: Apply average
  - FIRST: Get the first point
  - LAST: Get the last point

## Outputs


The operator has only one output :

 - **Ts list** : New TS take a name defined by `${input_name}\_resampled\_to\_${period}ms\_${timestamp\_position}\_${aggregation_method}`

Example: *PORTFOLIO_EWA_resampled_to_90ms_VALUE_BEFORE*.

## Warnings
If resample failed, be sure :
- metadata are calculated
- target name is available for each timeseries. It's not yet possible to perform the same resampling operation (same TS, all the same parameters) several times without first cleaning the database.

Return to the [list of all operators](/operators.html)
