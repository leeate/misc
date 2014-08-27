falsify <- function(x, n=1000,cols=character(), all=FALSE, exclude=character(), 
                    NA.prob=0.0, NA.exclude=character(), id.var=character()) {
        # 'exclude' not implemented
        # neither is error handling
        if (all == TRUE) { cols <- names(x)}
        
        falsified <- data.frame(a=numeric(n))
        for (i in 1:length(cols)) {
                if(class(x[, cols[i]]) == "numeric" | class(x[, cols[i]]) == "integer") {
                        rlower <- range(x[, cols[i]], na.rm=TRUE)[1] 
                        rupper <- range(x[, cols[i]], na.rm=TRUE)[2] 
                        falsified[[i]] <- (sample(rlower:rupper, n, replace=TRUE))
                        falsified[[i]] <- as.numeric(falsified[[i]])
                }
                else {
                        falsified[[i]] <- sample(names(table(x[, cols[i]])), n, replace=TRUE) 
                }
        }
        names(falsified) <- cols;
        
        # Adding id variable
        if (length(id.var) >= 1) {
                id_var <- list(1:n)
                names(id_var) <- id.var[1]
                falsified <- cbind(id_var, falsified)
        }
        
        #  Adding NA's
        if (NA.prob == 0.0) {
                return (falsified)
        }

        for (i in 1:length(falsified)) {
                if ( (! (names(falsified)[i] %in% NA.exclude ) && !( names(falsified)[i] %in% id.var[1]))) {
                        na_elements <- as.logical( rbinom(n, 1, NA.prob))
                        falsified[na_elements, i] <- NA
                }
        }

        return (falsified)
        }
        
