---
title: Workflow
date: 2017-09-29 10:00:00 +02:00
layout: default
published: true
---


Welcome !!
-------------------------
You have probably completed the installation of IKATS and launched the application ( see
  <a href="https://github.com/IKATS/ikats-sandbox">installation tutorial</a> otherwise). Now let's connect to the interface (just type `localhost` in a browser). You should access this screen.

![Texte alternatif](/img/tuto00/DatasetSelection.png "Default screen interface"){:  width="600px" class="center"}

Now it's time to show you how IKATS works. We will also launch some operations to validate the correct installation of all components.


## IKATS Interface

IKATS provides an easy to use way to manipulate operators in order to explore and analyze time series.

If needed, let's have a look at <a href="/overview.html"> Overview page</a>  to understand main principles of how to use IKATS.


### Operators menu

In IKATS, each function (data import, selection, transformation, training of an algorithm, ...) is packaged in an operator. An operator includes entries (a Dataset, a list of Timeseries, a Table ...), usually parameters, and often one or more output(s) (transformed objects that will be used by the following operators in the workflow). A visualization tool is also integrated with each operator ( `double click` on the operator and then  navigate in the menu that appears to open the visualization tool).

For example, by default, a [Dataset Selection](/doc/operators/datasetSelection.html) operator is already integrated into the Workflow.

### Visualization tools
IKATS provides multiple visualization tools. When `double click` on an operator, user can access to different menu (click on the small eye to open the visualization). A lot of operaor shared these visualization tools:
  * *Curve* : Plot all the TimeSeries on the same panel
  * *MDEdit* : View (and edit) all the meta data per TimeSeries
  * *ScatterPlot* : Perform a scatter plot over a pair of TimeSeries
  * *TSTable* : See the recap of TimeSeries into the operator.

![Top left of IKATS operator menu](/img/tuto00/visualize_menu.png "Top left of IKATS operator menu"){:  width="600px" class="center"}

Note that some visualizations are specific to some operators ([Sax](/doc/operators/sax.html), [k-means](/doc/operators/kmeans.html)).

## Workflow

By default, operator `Dataset Selection` is in the workflow. Click on it, choose `Portfolio` in the drop-down menu, and `run`.
An operator has a state:
- green: action done successfully, you can click on the operator to view the result of the action
- orange: in progress (most operations are parallelized, but if IKATS deals with large datasets, some actions may take some time)
- red: the action failed. The causes can be multiple. Start by looking at the [operator's doc](/operators.html) to see if you are using it well and what are the boundary cases. It can also be a problem of connection between the components (see [Troubleshooting](https://github.com/IKATS/ikats-sandbox/blob/master/TROUBLESHOOTING.md) page for more details)

In our case, if it turns green, then, the Portfolio Dataset (which contains 13 Timeseries) has been loaded.

Now, choose the [Slope](/doc/operators/slope.html) operator from the `Operators` menu (left menu), drag and drop in the workflow. Link the `TS list` output of the [Dataset Selection](/doc/operators/datasetSelection.html) operator to the entry `TS list` of the [Slope](/doc/operators/slope.html) operator. Click on the operator Slope. A contextual menu appears on the right.
Slope does not take parameters, just click on `run`. A calculation of slope is realized on the 13 time series. After a few seconds, the operator turns green and you have access to the visualization of the new TS.

![Example of workflow](/img/tuto00/slope.png "Slope"){:  width="600px" class="center"}

At this point, we checked for access to most components (Hbase, OpenTSDB, Java for data selection, Spark and the Python layer of algorithms with slope computation).


### Workflow Management

Now save our new workflow (menu `Workflow Mgt / Save`).

![Texte alternatif](/img/tuto00/SaveWorkflow.png "Save Workflow"){:  width="600px" class="center"}

It now appears in the list of workflows that can be loaded.

![Texte alternatif](/img/tuto00/loadWorkflow.png "Load Workflow"){:  width="600px" class="center"}

### Datasets Management

With the use of the [Slope](/doc/operators/slope.html) operator, we generated new TS (double click on the operator and then on the little eye in the menu that appears)

![Texte alternatif](/img/tuto00/newTSSlope.png "TS created by slope"){: class="center"}

These TS are stored in database (we can apply the [TSFinder](/doc/operators/tsFinder.html) operator from any workflow of IKATS), referenced in the workflow (if you close and reopen the workflow **test_installation**, these TS are still available in the Slope operator's results), but not yet linked to a Dataset (which facilitates their grouped use). Let us use the [saveAsDataset](/doc/operators/saveAsDataset.html) operator on the Slope operator output and give the new Dataset the name *Portfolio_slope*.

![Save as dataset](/img/tuto00/SaveAsDataset.png "Save as dataset"){:  width="600px" class="center"}

Now the Dataset appears in the Datasets list (`Data Mgt/Datasets` menu).

![Texte alternatif](/img/tuto00/deleteDataset.png "Menu delete a dataset"){: class="center"}

Two delete actions are available from this menu. The blue bin removes the link between the TS and the Dataset (*the container object*), the Dataset is deleted but not the associated TS. The red bin removes Dataset and TS, provided that TS are not still linked to another Dataset.
