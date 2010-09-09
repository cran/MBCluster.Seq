\name{Count}
\alias{Count}
\docType{data}
\title{Sample of Count Data}
\description{
The \code{Count} data frame consists of 1000 genes with 4 treatment groups and 2 biological replicates}
\format{
  This data frame contains 8 columns of count, with colnames as 
  \code{N1.1 N2.1 N3.1 N4.1 N1.2 N2.2 N3.2 N4.2}  
}

\examples{
data("Count")
head(Count)
#     N1.1 N2.1 N3.1 N4.1 N1.2 N2.2 N3.2 N4.2
#[1,]    2    0    0    0    4    0    0    0
#[2,]    4  357 2537 1295   19 1056 2690 4411
#[3,]    0    0    6    8    1    2    8   18
#[4,]    1    1    1    0    2    5    1    2
#[5,]    2   10  107   32    2   31   94   69
#[6,]   79    8   18    5  102   24   21   14
}
