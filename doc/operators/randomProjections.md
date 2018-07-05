---
title: random_projections
date: 2018-01-15 15:00:00 +02:00
layout: default
published: true
---
# Random Projection Algorithm
This IKATS operator implements the random projection algorithm for finding patterns in datasets without an a priori pattern. We call "pattern" the list of "similar" sequences.

## Algorithm Description:

### step 1: build SAX words
Each time serie is broken into sliding windows ("sequences"). The size of the sliding windows depends on *Sequence size*. The overlap is a % (*Window Overlap*), for example, a value of 0.75 means that the overlap between successive sliding windows is 75% meaning that the translation is 25% of the window size.

The time series can also be normalized locally to a sliding window and/or globally to the time series using the parameter *Norm Mode*. When selected, *Normalization Method* permits you to normalize by mean and/or variance.
Then, the algorithm proceeds to a linear filter, permiting to delete the useless sequences (constant sequences,... that pollute the dataset). First, the algorithm tests the value of the standard deviation (sd), a very low sd signifies a quasi-linear sequence. Then, linearity is checked against the slope of linear regression on the sequences. The parameter *Ignore linear/ constant* enables you to choose how aggressively these operations are done.

The next filter is called "trivial match". Each sequence is compared to the next sequences until finding non-trivial match. This process is performed on each sequence, all the "matching sequences" are deleted.
The parameter *Neighborhood radius* enables you to choose how aggressively these operations are done. Note that trivial match  between two sequences S and S' is defined by the condition: *d(S, S') < Neighborhood radius/2*.

Next, Piecewise Approximate Aggregation (PAA) and Symbolic Aggregate approXimation (SAX) are used on the sliding windows. PAA, controlled by the parameter *PAA* determines the number of segments to break a sliding window into and also the length of the words built by SAX. The results of PAA are divided into buckets, which are named by letter, equally under a gaussian curve. The number of buckets is determined by the parameter *Alphabet Size*.


![Texte alternatif](/img/operators/SAX_example.png "SAX example"){:  width="600px" class="center"}

*An example of a Symbolic Aggregate approXimation (SAX) on a time serie. Here, the curve (large number of points) can be "summarized" into the word : "aacddddcaabccbbbccbbccbbb" (25 letters)*

Then, we can build a "static lookup table", containing distances between letters. This matrix is used later. Once the collision matrix is built (see below) we need to find distances between sequences. Euclidean distance is not used. Instead we construct a static lookup table.

![Texte alternatif](/img/operators/dist_function.jpg "Calculation of the distances"){:  width="600px" class="center"}

*Image of breakpoints table and input values*

### step 2: build the *collision matrix*
Once SAX has been performed a random selection of columns is made. For each SAX entry, a word is built from 2 (or more, see *Collision nb indexes*) columns randomly selected. If two entries have the same word, they count as one collision (each word "ca", "cb", "cc" in the example). This is repeated until *Collision Iteration* is exceeded or if all the possible combinations are done (in the following example: between columns (1,2), (1,3), (1,4), (2,3), (2,4), and (3,4) ).

![Texte alternatif](/img/operators/collision_matrix.jpg "Collision Matrix"){:  width="600px" class="center"}



### step 3: find patterns
A Neighborhood search is then performed on sequences to group sequences into patterns. The search type is controlled by the parameter *Neighborhood Method* (brute force or using collision matrix). If "brute force" option is selected, all pairs of sequences are compared (very long operation). If "iterative" option is selected, the search is performed iteratively (number of iterations controlled by *Neighborhood Iterations*). The "global" option don't perform the search iteratively. The size of sequence can be expanded by the parameter *Neighborhood Radius*.

## Input and parameters

This operator only takes one input of the functional type **table**.

It also takes 12 inputs from the user :

- *Sequence Size* : The number of points in the sequence we are looking for. This a rough guide as the algorithm does a good job of finding smaller and larger sequences.
- *Window Overlap* : A float between 0 and 1 specifying how many common points will be between successive sliding windows. Lower numbers give better accuracy but take longer for the algorithm to run owing to more windows being generated.
- *PAA* : the number of PAA's for each sliding window and also determines the length of the words built by SAX
- *Alphabet Size* : SAX breaks up (local to sliding window / per time series ) so that points are divided into buckets equally under a gaussian curve. These buckets are given a letter to represent which bucket they fall in and distance is calculated by the average between buckets.
- *Norm Mode* : Norm mode decides which normalization is applied. There are 4 Norm modes available
  - *NO_NORM* : No normalization is applied
  - LOCAL_NORM : Values are normed per sliding window
  - GLOBAL_NORM : Values are normed for the entire time serie
  - LOCAL_GLOBAL : Values are normed for each sliding window and for the entire time serie
- *Normalization Method* : There are 3 normalization methods.
  - WITH_MEAN : Normalizaion is applied only to the mean
  - WITH_VARIANCE : Normalizaion is applied only to the variance
  - WIH_MEAN_VARIANCE : Normalizaion is applied to both the mean and variance
- *Ignore Linear/constant* : The algorithm uses linear regression to remove sequences that are effectively linear. By stting is value to high more such sequences will be ignored.
- *Collision Iteration* : Percentage between 0 to 100 of maximum collision matrix to build. Closer too 100 will be more accurate but take more time to run.
- *Collision nb indexes* : The number of random columns selected per iteration when building the collision matrix. Default value is 2.
- *Neighborhood Method* : GLOBAL is faster than ITERATIVE. BRUTE_FORCE is more precise than WITH_COLLISIONS but takes more time to run.
- *Neighborhood Iterations* : The number of iterations of the motif neighborhood search to be performed.
- *Neighborhood Radius* : Can be used to expand the search radius for patterns so that larger sequences can be found. Note that a lower radius produces less patterns.

## Outputs

Result is a type pattern_groups (see wiki).


Return to the [list of all operators](/operators.html)
