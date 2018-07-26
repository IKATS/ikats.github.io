---
title: random_projections
date: 2018-01-15 15:00:00 +02:00
layout: default
published: true
---
# Random Projection Algorithm
This IKATS operator implements the random projection algorithm for finding patterns in datasets. We call "pattern" the list of "similar" sequences.

## Warning

This operator needs a great amount of RAM to run (at least 16 Go for few TSList in input). We advice to check your available memory before running this operator (especially in local mode with the `sandbox`).

## Input and parameters

This operator only takes one input of the functional type `TS_list`.

It also takes 12 inputs from the user :

- **[Sequence size](#Sequence_size)**: The number of points in the sequence we are looking for. This is a rough guide as the algorithm does a good job of finding smaller and larger sequences. Positive number required.
- **[Window Overlap](#Window_overlap)** : A float between 0 and 1 specifying how many common points will be between successive sliding windows. Lower numbers give better accuracy but take longer for the algorithm to run owing to more windows being generated.
- **[PAA](#PAA)** : The number of PAA's for each sliding window. Also determines the length of the words built by SAX
- **[Alphabet Size](#Alphabet_size)** : The number of equal areas along Y axis. (see [sax operator](/doc/operators/sax.html))
- **[Norm Mode](#Norm_mode)** : Norm mode decides which normalization is applied. There are 4 Norm modes available
  - NO_NORM : No normalization is applied
  - LOCAL_NORM : Values are normed per sliding window
  - GLOBAL_NORM : Values are normed for the entire time serie
  - LOCAL_GLOBAL : Values are normed for each sliding window and for the entire time serie
- **[Normalization Method](#Normalization_method)** : There are 3 normalization methods.
    - WITH_MEAN : Normalizaion is applied only to the mean
    - WITH_VARIANCE : Normalizaion is applied only to the variance
    - WIH_MEAN_VARIANCE : Normalizaion is applied to both the mean and variance
- **[Ignore Linear/constant](#Ignore_linear)** : The algorithm uses linear regression to remove sequences that are effectively linear.
    - NO FILTER : Pass the *ignore linear sequences* pre-selection
    - LOW : delete sequences which are extremely linear (or constant)
    - MEDIUM : balanced mode
    - HIGH : delete sequences which looks like linear (or constant) (more sequences are deleted)
- **[Collision Iteration](#Collision_iteration)** : Percentage between 0 to 100 of maximum collision matrix to build. Closer too 100 will be more accurate but take more time to run.
- **[Collision nb indexes](#Collision_nb_indexes)** : The number of random comumns selected per iteration when building the ollision matrix. Default value is 2.
- **[Neighborhood Method](#Neighborhood_method)** : Choose a method to find patterns. GLOBAL is faster than ITERATIVE. BRUTE_FORCE is more precise than WITH_COLLISIONS but takes much more time to run.
- **[Neighborhood Iterations](#Neighborhood_iterations)** : The number of iterations of the motif neighborhood search to be performed.
- **[Neighborhood Radius](#Neighborhood_radius)** : Can be used to expand the search radius for patterns so that larger sequences can be found. Note that a lower radius produces less patterns.

## Outputs

Result is a type `pattern_groups` (the list of pattern with their properties: size, ...).

## Algorithm Description

The algorithme inside the `random_projection` operator is quite complex. It consists in cutting all time series into sequences, and summarize them into "words" (*Step 1: build sax words). Then, the algorithm perform a smart similarity search over these words.

### Step 0: Pre-processing
<!--Note that class "anchor" avoid hiding anchor link with header -->
Each time serie is broken into siding windows ("sequences"). The size of the sliding windows depends on <a class="anchor" id="Sequence_size"> *Sequence size* </a>. The overlap is a % (<a class="anchor" id="Window_overlap">*Window Overlap*</a>), for example, a value of 0.75 means that the overlap between successive sliding windows is 75% meaning that the translation is 25% of the window size.

The time series can also be normalized locally to a sliding window and/or globally to the time series using the parameter <a id="Norm_mode">*Norm Mode*</a>. When selected, <a class="anchor" id="Normalization_method">*Normalization Method*</a> permits you to normalise by mean and/or variance.
Then, the algorithm proceeds to a linear filter, permiting to delete the useless sequences (constant sequences,... that pollute the dataset). First, the algorithm tests the value of the standard deviation (sd), a very low sd signifies a quasi-linear sequence. Then, linearity is checked against the slope of linear regression on the sequences. The parameter <a class="anchor" id="Ignore_linear">*Ignore linear/ constant*</a> enables you to choose how aggressively these operations are done.

The next filter is called "trivial match". Each sequence is compared to the next sequences until fiding non-trivial match . This process is performed on each sequence, all the "matching sequences" are deleted.
The parameter <a class="anchor" id="Neighborhood_radius">*Neighborhood radius*</a> enables you to choose how aggressively these operations are done. Note that trivial match  between two sequences S and S' is defined by the condition: *d(S, S') < Neighborhood radius/2*.

### Step 1: build SAX words
Next, Piecewise Approximate Aggregation (PAA) and Symbolic Aggregate Approximation (SAX) are used on the sliding windows. PAA, controlled by the parameter <a class="anchor" id="PAA">*PAA*</a> determines the number of segments to break a sliding window into and also the length of the words built by SAX. The results of PAA are divided into buckets, which are named by letter, equally under a gaussian curve. The number of buckets is determined by the parameter <a class="anchor" id="Alphabet_size">*Alphabet Size*</a>.

![PAA](/img/operators/random_projection/PAA.png "SAX"){: class="center"}

<!-- Image from:
http://www.cs.uoi.gr/~pkarvel/images/rotorbar/fig4.png
-->

*An example of a Symbolic Aggregate Approximation (SAX) on a time serie. Here, the curve (large number of points) can be "summarized" into the word : "aacddddcaabccbbbccbbccbbb" (25 letters)*

Then, we can build a "static lookup table", containing distances between letters. This matrix is used later. Once the collision matrix is built (see below) we need to find distances between sequences. Euclidean distance is not used. Instead we construct a static lookup table.

![MinDIST](/img/operators/random_projection/minDist.png "breakpoints table and input values"){: class="center"}

<!-- Image from:
http://slideplayer.com/slide/4221692/14/images/44/The+dist(%29+function+can+be+implemented+using+a+table+lookup+as+illustrated+in+Table+4.jpg
-->

*Image of breakpoints table and input values*

### Step 2: build the *collision matrix*
Once SAX has been performed a random selection of columns is made. For each SAX entry, a word is built from 2 (or more, see <a class="anchor" id="Collision_nb_indexes">*Collision nb indexes*</a>) columns randomly selected. If two entries have the same word, they count as one collision (each word "ca", "cb", "cc" in the example). This is repeated until <a class="anchor" id="Collision_iteration">*Collision Iteration*</a> is exceeded or if all the possible combinations are done (in the following example: between columns (1,2), (1,3), (1,4), (2,3), (2,4), and (3,4) ).

![Collision matrix](/img/operators/random_projection/collision_matrix.png "Collision matrix"){: class="center"}

<!-- Image from:
http://slideplayer.com/slide/6981514/24/images/49/Once+again,+collisions+are+recorded+by+incrementing+the+appropriate+location+in+the+collision+matrix.jpg
-->

### Step 3: find patterns
A Neighborhood search is then performed on sequences to group sequences into patterns. The search type is controlled by the parameter <a class="anchor" id="Neighborhood_method">*Neighborhood Method*</a> (brute force or using collision matrix). If "brute force" option is selected, all pairs of sequences are compared (very long operation). If "iterative" option is selected, the search is performed iteratively (number of iterations controlled by <a class="anchor" id="Neighborhood_iterations">*Neighborhood Iterations*</a>). The "global" option don't perform the search iteratively. The size of sequence can be expanded by the parameter *Neighborhood Radius*.

Return to the [list of all operators](/operators.html)
