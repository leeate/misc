# Subset data.frames imported from SPSS via 'read.spss' {foreign}
# while keeping their variable labels, by temporarily attaching
# the labels to the end of variable names.
#     1. argument takes the SPSS data.frame
#     2. is the desired rows (defaults to all)
#     3. is the desired colums (defaults to all)
#     4. The 'sep' argument is the character used to 
#        stick together / split up names and labels. Defaults to an '@' char.
#           example: spssdata[1:10, 1:3] equals to
#                    subsetdf(spssdata, 1:10, 1:3)

subsetdf <- function(x, row=1:nrow(x), col=1:length(x), sep="@") {
      # Keeping labels by temporarily sticking it to colname
      nameList <- names(x)
      labelList <- attributes(x)$variable.labels
      names(x) <- paste(nameList,labelList, sep=sep)

      # Subsetting with desired rows / columns
      x <- x[row, col]
      attributes(x)$variable.labels <- sapply(strsplit(names(x), sep), 
                                            function(x) x[2])
      # Finally, we restore the names for easy analysis
      
      names(x) <- sapply(strsplit(names(x), sep), 
                         function(x) x[1])
      invisible(x)
}
