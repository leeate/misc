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
