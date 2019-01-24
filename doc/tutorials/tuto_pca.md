---
title: PCA
date: 2019-01-24 08:00:00 +02:00
layout: default
published: true
---

# Dimentionnal reduction with Principal Component Analysis

In signal analysis, an important step is dimentionnal reduction, for many purpose (reducing computational cost, reducing noise in data, produce syntetic visualizations, ...). A popular way is the usage of Principal Component Analysis ([PCA](https://en.wikipedia.org/wiki/Principal_component_analysis)).

## PCA operation in a nutshel
PCA is a procedure to combine data (linear combination) - here data are TS - and create new *synthetic* features. PCA transforms a set of possibly correlated TS (*k* TS) into a set of n \<< k un-correlated TS, called **principal components**. The number of TS produced *n* is a parameter of the operator (see [PCA operator](/doc/operators/pca.html) for details). These new features contains much more information than inputs. The information contained by its new dataset is called **variance explained**. It measures the information lost (or kept) after the PCA transformation (this variance increase with *n*). This information lost represents the noise removed.
In general, the choice of *n* shall correspond to an *explained variance* of ~80 % or more (*n*~6). This choise is absolutely empirical, and depends on the current use-case. But the *explaned variance* shall be larger enough to keep the complexity of the dataset, but not too much (> 95 %) to remove useless noise.

In IKATS, the [PCA operator](/doc/operators/pca.html) take in input a list of TS . It produces the **principal components** (TS) and a table containing variance explained per principal component.

## Dataset used

This tutorial aims to show a simple usage of the PCA operator in Ikats.

In this tutorial, we keep using the meteorological dataset from [tutorial "Filter and clean data"](/doc/tutorials/tuto_cutY.html).
This dataset, called `Historical_hourly_weather`, has already be loaded in a previous step. It's now directly usable thanks to [Data Selection](/doc/operators/datasetSelection.html) operator. The dataset contains 5years of meteorological indicators.

For pedagogical purpose, we just keep a sample of this dataset: we just some cities, and parameter *temperature*.

![filter](/img/tuto_pca/tuto_pca_filter.png "select dataset"){: class="center"}

*Parameters used in the filter:*
* *`metric` like `t*`*
* *`city` in `Albuquerque;Boston;Miami;Jacksonville;Atlanta;Beersheba;Charlotte`*

Then, a [quality Indicators](/doc/operators/qualityIndicators.html) shall be launched on this dataset. Indeed TS inputed to PCA operator shall contain metadata `qual_ref_period`. This meta is computed by the `quality Indicators`.

![quality Indicators](/img/tuto_pca/tuto_pca_qualityStat.png "qualityStat"){: class="center"}

## scaling

PCA is sensitive to the scaling of the original variables. There is no consensus as to how to best scale the data to obtain optimal results. Usually, the [Z-Norm](https://en.wikipedia.org/wiki/Standard_score) (center and scale data).

![scaling](/img/tuto_pca/tuto_pca_scale.png "scaling"){: class="center"}

## PCA

Then, we perform a PCA on these data.

![PCA](/img/tuto_pca/tuto_pca_pca.png "PCA"){: class="center"}

*Parameters used in the PCA:*
* *`Number of components`: 4* (the number of **principal components** to compute)
* *`table name`: `explained_var_meteo`* (name of the table containing **explained variance** of each principal components)
*  *`FuncID pattern`: `PC{pc_id}`* (pattern used to name the TS computed as principal component, `pc_id` is replaced by the id )

*Note:
* `table_name` shall not correspond to an already existing table name (else, raise an error)
* idem for `FuncId pattern`: shall not correspond to an already existing TS name.*


## Results

### Principal components

Double click on the `PCA` operator, and select option `curve` to plot the principal components calculated by the operator.

![result](/img/tuto_pca/tuto_pca_result1.png "result"){: class="center"}

Now, select just `PC1` and `PC2`, you shall obtain this kind of plots.

![result](/img/tuto_pca/tuto_pca_result2.png "result"){: class="center"}

* `PC1` represents the seasonal phenomenon of temperature (winter / summer)
* `PC2` a daily phenomenon (day / night)

`PC2` and `PC3` have a complexe physical behaviour (noise).

### Explained variance

Now, select the `table` visualization to view *explained variance* of each Principal Component (PC).

![table](/img/tuto_pca/tuto_pca_table.png "table"){: class="center"}

The explained variance fastly decrease: we can consider `PC1` and `PC2` to explain 92% of variance explained. We have reduced 7 TS into 2.

Now, you are able to perform perform a dimentionnal reduction on your data.

Return to the [list of all tutorials](/tutorials.html).
