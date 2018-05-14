---
title: POstgreSQL...
date: 2017-09-29 10:00:00 +02:00
layout: default
published: true
---

Some TIPS concerning Data management through PostgreSQL
========================================================
IKATS stores the calculated data (Datasets, Timeseries identifiers, Metadata, ...) in a PostgreSQL database. Even though you can do most of the actions directly in the IKATS interface, a general view of some SQL tables and how to query them can be helpful, especially for cleaning databases after a long period of work time.

Timeseries have 2 identifiers:
- funcid (the name, that you or an operator will give them during their creation, usually quite speaking, of the type *Landing_flight1_resampled_to_5000ms*)
- the tsuid (OpenTSDB identifier), generated randomly, the only identifier used by some operators ([SAX](/doc/operators/sax.html) outputs for example)


List of datasets and their description (equivalent of the Data Mgt / Datasets menu):
------------------------------------------------------------------------------
SELECT * FROM tsdataset


Connection between tsuid and funcid
------------------------------

SELECT * FROM tsfunctionalidentifier
WHERE funcid like '%flight1%'

SELECT * FROM tsfunctionalidentifier
WHERE tsuid in ('03B8FA0000010001D40000020000990000030001D9, '5679E50000010001D40000020000990000030001E2')



When you import TS (import module), they are linked to a dataset. It is easy to manage them via the `Data Mgt / Datasets menu`. Transformations performed by operators generate new TS, which you can link to datasets. If you do not choose this option, the TS are **orphans** because they are not linked by default to any dataset (they are simply saved at the workflow level). It is not possible to delete them via the IKATS interface.

Select orphan TS
-------------------
SELECT * FROM tsfunctionalidentifier
WHERE tsuid NOT IN
(SELECT tsuid FROM timeseries_dataset)


Update Metadata
----------------------------
It is of course possible to use the [import Metadata](/doc/operators/importMetadata.html) operator to import metadata and TS-related data from a dataset.
For small changes, you can change directly change or delete metadata for a given TS when visualising metadata of a dataset. But you may prefer a simple SQL query if you want to change the metadata of a group of TS.

UPDATE tsmetadata
SET value = "test"
WHERE name = 'metric' AND tsuid IN
(SELECT tsuid from tsfunctionalidentifier WHERE funcid LIKE '%resampled_to_5000')
