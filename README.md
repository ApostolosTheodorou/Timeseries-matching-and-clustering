# Timeseries matching and clustering

This is a project about timeseries comparison and clustering. Given a dataset of timeseries and a query timeserie, we attempt to find and present which of the timeseries of the dataset are closer to the query timeserie. If the timeseries are relatively small, this task can be completed efficiently by the well known nearest neighbor algorithm. However, for larger timeseries, that may consist of hundreds or thousends of points, the previous approach would fail. For this reason we have implemented approximate variations of the same algorithm, using the techniques of LSH (local sensitive hashing), Hypercube (a slightly different lsh algorithm) and have also applied some filtering to the timeseries in order to reduce their size. Apart from that, the program provides the flexibility of the use of different metrics, like the euclidean or the Frechet distance, when it comes to timeseries comparison, so that the user can chose both the technique and metric that fits best to his problem. With all of the above, it is ensured that the program can handle big datasets with large dataseries with high precision and at a decent running time. Last but not least, the user is capable of clustering the timeseries in a desired number of clusters and check the quality of the clustering with the silhouette metric. 

## Compilation and Execution
**To compile run:** *~$make*


**To execute run:** *~$./search –i \<input file\> –q \<query file\> -ο \<output file\> -algorithm \<LSH or Hypercube or Frechet\> [-metric <discrete or continuous | only for –algorithm Frechet\> -delta \<double\> –k \<int\> -L \<int\> -M \<int\> -probes \<int\>]*
<br><br>
where the **obligatory** arguments are:
<br><br>
*input file:* a csv file that contains the timeseries dataset. First column is an id, rest columns are the timeseries points

*query file:* a csv file of the same format as input file. It contains the query timeseries

*output file:* a txt file were the results are written. If not exist, it is created a new file

*algorithm:* chose between 3 possible techniques to deal with the problem. LSH and Hypercube algorithms are quicker than Frechet
<br><br>
**non-obligatory** arguments:
<br><br>
*delta:* a double used for timeseries filtering. For size reduction choose a greater number eg. [2.5,5.0]. For better accuracy choose a smaller number
Default value 0.7

*k:* number of hash functions used for hashing. Default value 4

*L:* number of hashtables. The more hashtables the greater the search time and the accuracy. Default value 5

*M:* used in Hypercube. Set the maximum numbers of timeseries that can be checked as candidate neighbors. Default value 1000

*probes:* used in Hypercube. Maximum number of cube vertices to be checked. Default value 2
<br><br><br>
And for **clustering** run: *~$./cluster –i \<input file\> –c \<configuration file\> -o \<output file\> -update \<Mean
Frechet or Mean Vector\> –assignment \<Classic or LSH or Hypercube or LSH_Frechet\>
-complete -silhouette*
<br><br>
where -complete ans -silhouette are optional
<br><br>
*configuration file:* a file named *cluster.conf* that contains the clustering parameters. It should have the following format:
<br><br>
number_of_clusters: \<int\> (obligatory)<br>
number_of_vector_hash_tables: \<int\><br>
number_of_vector_hash_functions: \<int\><br>
max_number_M_hypercube: \<int\><br>
number_of_hypercube_dimensions: \<int\><br>
number_of_probes: \<int\><br>
<br><br>
If one or more of the non-obligatory lines are missing, those arguments receive default values.



## Concepts Used

This project involves the following:

-knn 

-LSH (locality-sensitive hashing)

-clusternig

