---
layout: post
title:  "Release 0.13"
date:   2019-03-27 08:00:00 +0100
categories: website
---

Major news for the 0.13 release :

- OpenTSDB has been updated to 2.3.1, HBase has been updated to 2.0.2.
- New operators:
  - PCA operator is a standard statistical mean for analysing data.
  - *K-Means on TS* operator aims at clustering datasets of TS, resulting clusters can be then visualized in a 2D representation. Once visualized, a cluster of TS can be saved as a new dataset thanks to a dedicated button 'save selected TS as a new dataset'.
  - The resulting model  of *K-Means on TS* operator can then be used to classify a new list of TS thanks to the second new operator called *K-Means on TS Predict* operator aims at clustering datasets of TS.
- The operator *Rollmean* has been updated to use Spark dataframes.


## 0.13.0 - 2019-02-22

### Improvements

* **gui-builder**: Changed the text field for a list in the read-table operator
* **gui-builder**: hid the parameter panel when result is displayed
* **hbase**: HDFS replication customisation
* **hbase**: merged hbase configurations from docker-compose and kubernetes
* **hbase**: upgraded hbase version to 2.0.2
* **ikats-baseimages**: upgraded OpenTSDB to 2.3.1
* **ikats-datamodel**: Aligned OpenTSDB host/port variables names with all IKATS environments
* **ikats-datamodel**: Moved ikats-ingestion to a part of ikats-datamodel
* **ikats-datamodel**: Recovered TU for the TableDAO from an old branch
* **ikats-pybase**: Added pandas library
* **ikats-pybase**: Fixed bad SparkSession stop
* **ikats-sandbox**: Aligned OpenTSDB host/port variables names with all IKATS environments
* **ikats-sandbox**: replaced Hbase internal component
* **operator-fetcher**: adding pca operator
* **op-kmeans**: Added kmeans_on_ts operator
* **op-kmeans**: Added K-Means on TS Predict operator
* **op-kmeans**: Modified K-means outputs order to have a default associated viztool
* **op-pca**: adding PCA operator
* **vt-curve**: created the button 'save selected TS as a new dataset'

### Fixes

* **gui-builder**: fixed filter bad conditions
* **gui-builder**: fixed local viztool inclusion error
* **gui-builder**: fixed proxy endpoints for internal services
* **gui**: fixed max body size for requests
* **gui**: fixed proxy endpoints for internal services
* **hbase**: enabled HBase ZK management in standalone mode
* **hbase**: updated mirror location for hbase
* **ikats-baseimages**: fixed spark version due to CVE-2018-11760
* **ikats-pybase**: fixed vulnerabilities for python modules
* **ikats-pybase**: updated Unit Test dependency location
* **ikats-sandbox**: updated python service name to be compliant with RFC1034/1035
* **ikats_standalone**: fixed bad service name (gui)
* **ikats_standalone**: fixed bad variables name
* **ikats_standalone**: updated way to provide version after reloading viztools
* **op-kmeans**: fixed bad input type pattern_groups
* **op-kmeans**: fixed bad output type kmeans_mds

See more details on the full [CHANGELOG](https://github.com/IKATS/IKATS/blob/master/CHANGELOG.md)
