# Subset data.frames imported from SPSS via 'read.spss' {foreign}
# while keeping their variable labels, by temporarily attaching
# the labels to the end of variable names.
#     1. argument takes the SPSS data.frame
#     2. is the desired rows (defaults to all)
#     3. is the desired colums (defaults to all)
#     4. The 'sep' argument is the character used to 
#        stick together / split up names and labels. Defaults to an '@' char.
#     5. to.variable.list - if set to TRUE, it makes a data.frame  (spss.variable.list)
#        with the list of the subset variable names/labels. Handy to save to a file afterwards.
#        Defaults to FALSE.
#           example: spssdata[1:10, 1:3] equals to
#                    subsetdf(spssdata, 1:10, 1:3)

subsetdf <- function(x, row=1:nrow(x), col=1:length(x), sep="@",
                     to.variable.list=FALSE) {
      
      # Keeping labels by temporarily sticking it to colname
      nameList <- names(x)
      labelList <- attributes(x)$variable.labels
      names(x) <- paste(nameList,labelList, sep=sep)

      # Subsetting with desired rows / columns
      x <- x[row, col]
      
      # If only one column is selected, a vector is returned
      # as expected. Variable names/labels make no sense in this case. 
      if (length(col) == 1)
            return(x)
      
      # If two or more selected, split up the variable names
      attributes(x)$variable.labels <- sapply(strsplit(names(x), sep), 
                                            function(x) x[2])
      # Finally, we restore the names for easy analysis
      
      names(x) <- sapply(strsplit(names(x), sep), 
                         function(x) x[1])
      
      if(to.variable.list) {
            spss.variable.list <<- data.frame(name=names(x),
                                   label=attributes(x)$variable.labels)
            print("+ added spss.variable.list")
      }
      invisible(x)
}
