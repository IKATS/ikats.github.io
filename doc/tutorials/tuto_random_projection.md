---
title: Random Projections
date: 2017-09-29 10:00:00 +02:00
layout: default
published: true
---


# Similarities between TS via random projections

In signal analysis, an important feature is the identification of patterns, which may be characteristic of a particular event. IKATS provides operator [TS Pattern matching](/doc/operators/tsPatternMatching.html) to easily perform this operation, with a particular choosen pattern (see [this tutorial](/doc/tutorials/tuto_matching_pattern.html) for details).

In some case, the dataset used can be huge. Searching similarities between each TS can be quasi-impossible with a simple [TS Pattern matching](/doc/operators/tsPatternMatching.html) operator. Especially if you want to search multiple patterns. IKATS provides the [Random Projection](/doc/operators/randomProjections.html) to perform a global search of pattern between all TS of your Dataset.
This tutorial is a usecase for this operator.

### Warning
This tutorial helps understanding the role of the `Random projection` operator. Due to it's complexity, it requires a lot of memory: at least 16 Go of RAM. With a lower value you can reach the limits and get a stack overflow. In this case, the operator will turn red with no result.

Try to use this operator with the sandbox on a smaller dataset.

## Dataset used
In this tutorial, we use the default dataset `WEBTraffic`, a subset of a dataset proposed on [Kaggle](https://www.kaggle.com/c/web-traffic-time-series-forecasting). Each of these TS represent a number of daily views of a different Wikipedia article, starting from July, 1st, 2015 up until December 31st, 2016.
The subset include 11989 TS from 7 languages (Deutsch, English, French, Spanish, Chinese, Russian, Japanese).

The purpose of this tutorial is to extract all identical patterns from this dataset, detecting the links between the different Wikipedia articles.

For pedagogical purpose, we limit the dataset to 7 TS, using the [filter](/doc/operators/filter.html) operator. We search TS corresponding to Russian pages (`languages` *like* `ru`), and with a name begining with A (`metric` *like* `A*`). Note that the *name* of the TS correspond to its metadata `metric`.

We obtains 7 TS: *ABBA_ru, Adobe-Flash_ru, Adidas_ru, Airbus-A320_ru, Alekseev_ru, Android_ru* and *Apple_ru*. A simple view on these TS (visualization option `Curve`) show identical behaviours in curves. These TS contains 800 points (metadata `qual_nb_points`).

![curve_zoom](/img/tuto_random_projection/zoom_curves.png "A zoom on the data"){: class="center"}
*Note that this visualization is a zoom on a particular time-range (values do not matter, just note the global shape).*

## Random projection

Our implementation of Random projection is based on the [SAX](/doc/operators/sax.html) algorithm. It consists in cutting all time series into sequences, and summarize them into "words". Then, the `random projection` perform a smart similarity search over these words (in huge quantity).

Parameters are provided with default values and can be optimized as needed. Due to the quantity of tunnable parameters, we won't explains all here. Refer to the [operator documentation](/doc/operators/randomProjections.html) for explanation about algorithm, and parameters.


Here, in order to obtain fast results, we limit the matching to very similar patterns (strong "link"). Thus, we let all parameters as default, except:
- `sequences size`: the number of point considered as a sequence. We choose a large value: 200 points to limit the search (the TS contains 800 points),
- `neighborhood radius`: enables you to choose how aggressively the *mathcing pattern* operation is performed.  Here, to restrict the visualisation to obvious matchings we choose a low value: 0.5 (less than default).

![Alternate Text](/img/tuto_random_projection/params_random_projection.png)

*Note: This workflow contains much more operator than requested: the filtering operation can be performed in one single `Filter`. And the `Quality operator` is not necessary if you choose a default Dataset (like `WEBTraffic`): already calculated.*

## Results

We observe the identical `current pattern definition` for both examples and the similarity of the patterns.

![Patterns](/img/tuto_random_projection/patterns.png "A selection of two TS sharing same pattern"){: class="center"}

IKATS provides some information about results:
- the list of pattern name `Pattern` (e.g. `P1`)
- the current TS to plot (e.g. `ru_Android`)
- the `current pattern definition` summarized into *SAX word*, in regexp expression (each SAX word sequence corresponding to this`current pattern definition` expression is associated to current `Pattern`)

![Results](/img/tuto_random_projection/random_projection_ru_Android.png "Some results")

Now, you are able to perform pattern matching without any model of pattern.

Return to the [list of all tutorials](/tutorials.html).
