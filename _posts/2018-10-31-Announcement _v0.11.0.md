---
layout: post
title:  "The 0.11 release of IKATS is available on Github!"
date:   2018-10-31 08:00:00 +0100
categories: website
---

The latest 0.11 release of IKATS is available, wihch succeeds to releases 0.9 and 0.10
========================================================================================

Major improvements since the first release 0.8 are listed below, detailed by release


## 0.11.0 - 2018-10-16

### Improvements

New functionality : Created ExportTable operator to download tables as CSV
New operator : *Scale* operator aims at normalizing TS, with three scaler modes 
The operator *Rollmean* has been updated to use SPark dataframes

* **gui-builder**: added IKATS version in the GUI footer 
* **gui-builder**: updated LICENSE headers
* **gui**: new front server / reverse proxy



## Version 0.10.1 - 2018-08-31

### Improvements
* **ikats-baseimages** and **ikats-pybase** : updated spark version to 2.3.1
* **gui-builder** and **ikats-datamodel**: updated message returned to user in case of operator error

### Fixes
* **op-resampling**: changed upsampling VALUE_BEFORE or VALUE_AFTER behaviour on a single point chunk
* **vt-sax**: fix on the viztool to use correct input name to know the source dataset

## Version 0.10.2 - 2018-08-31

This release concerns installation - this has no impact on the user

## Version 0.10.0 - 2018-07-30 

### Improvements
A new operator *Export TS*  allows to export TS in .csv files , in order to do an archive, to reimport the TS in a new instance, or to use them outside IKATS
The operator *Cut TS* has been extended to manage long and/or many TS (using Spark)


### Fixes

fixed API call (concerns operators sax, rollmean, discretization)
* **gui-builder**: replaced ikats by IKATS + removed copyright date in footer
* **ikats-datamodel**: added table API  V2 + headers management
* **ikats-pybase**: Fixed versions for python modules
* **ikats-pybase**: fixed gunicorn version 


## Version 0.9.0 - 2018-07-05
 
### Improvements
 
* **gui-builder**: default viztool displayed depending on output type 
* **gui-builder**: updated families of core operators 
* **op-discretization**: updated family for operator discretize 
* **operator-fetcher**: catalog modification to be robust to evolutions on operator (addd/replace / delete)
 
### Fixes
 
* **ikats-pybase**: updated `Requests` python module to fix 'Connection pool is full'
* **catalog def fixes 


The sandbox to test IKATS has evolved in the same way and embeds the same fixes and evolutions than the versions above as far as it is concerned. 
