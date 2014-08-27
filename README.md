Other stuff
====
### These are scripts that I've written for the sole purpose of making my work easier. Beware, some of them might not be beautiful & classy.
======

#### spss.R

SPSS is widely used in social sciences, and sometimes it's used the wrong way: unluckily some researchers rely on 'variable labels' too often. It is absolutely convenient, but sometimes you're given data without any codebook or questionnaire which would summarize the the relationships between var names and labels.

And there's a little bit of flaw in R, namely: when you try to subset data.frames with special attributes (like variable names..) in it, you'll lose these attributes. This function creates a kinda workaround by attaching the labels to the vvar names before subsetting, then splitting them to names and variable labels.
<br>

#### falsify.R

Makes a falsified dataset using variable names and ranges from data.frame 'x'. This is handy e.g. when you cannot distribute a particular dataset to 3rd parties, but want to make your analysis somewhat reproducible - it might give more credit to your analysis if the reader can build a good mental picture of your dataset, your choices of aggregation, etc. Since variable names and types(!) match between the original and the fabricated datasets, they can run the same code (but obviously won't get the same results).  Optional arguments to make an "id" variable in the first column (which, looking back, doesn't make sense), create NA's among variables with a given probability, or exclude certain variables from it. 

As a default behaviour, you pass the variable names of the original data.frame from which you want to get a fabricated one, as a character vector in argument 3. If you just want to create a full counterfeit dataset, leave the "cols" argument alone, and pass 'all=TRUE'instead. 
