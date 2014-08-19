Other stuff
====
## These are scripts that I've written for the sole purpose of making my work easier. Beware, some of them might not be beautiful & classy.

### spss.R

SPSS is widely used in social sciences, and sometimes it's used the wrong way: unluckily some researchers rely on 'variable labels' too often. It is absolutely convenient, but sometimes you're given data without any codebook or questionnaire which would summarize the the relationships between var names and labels.

And there's a little bit of flaw in R, namely: when you try to subset data.frames with special attributes (like variable names..) in it, you'll lose these attributes. This function creates a kinda workaround by attaching the labels to the vvar names before subsetting, then splitting them to names and variable labels.


Other stuff
