\name{RNASeq.Data}
\alias{RNASeq.Data}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Standardize RNASeq Data for Clustering
}
\description{
  RNASeq.Data is used to collect RNA-Seq data that need to be clustered. 
}
\usage{
RNASeq.Data(Count, Normalizer=NULL, Treatment,GeneID=NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Count}{
    a GxP matrix storing the numbers of reads mapped to G genes in P samples. Non-integer values are allowed. 
}
  \item{Normalizer}{
    a vector of length P or a GxP matrix to normalize the gene expressions. When Normalizer=NULL, we use log(Q2) by default, where Q3 is the 75% quantiles of the the columns of Count matrix
}
  \item{Treatment}{
   a vector of length P indicating the assignment of treatments for each column of the Count. For example, Treatment=c(1,1,2,2,3,3) means there are 3 treatments with each having 2 replicates  
}
  \item{GeneID}{
   the ID's of the genes, labeled by 1,2,...,G if not provided
   }
}

\value{
 \item{GeneID }{ID's of genes provided by the user. Default is 1,2,...,G if not provided}
\item{Treatment}{The same as the input, but is sorted in increasing order.}
 \item{Count }{The matrix of counts of reads as provided. The columns of the matrix is re-arranged to match the ordered labels of treatment }
 \item{Normalizer}{A matrix contains the input normalization factors as provided or from default setting. If the provided value is a vector, then each column of the matrix will have the same value}
 \item{logFC}{A matrix contains the log fold change (log-FC) of the normalized genes expressions across all the treatments. Each row of the log-FC matrix is standardized to has zero sum}

\item{Aver.Expr}{ the logarithm of the mean gene expression after normalization}  
\item{logFC}{ a matrix storing the gene profiles, which is defined as the log fold changes relative to the mean gene expression}
\item{NB.Dispersion}{the estimated gene-wise dispersion if assuming NB model} 
}
\examples{
###### run the following codes in order
#
# data("Count")     ## a sample data set with RNA-seq expressions 
#                   ## for 1000 genes, 4 treatment and 2 replicates
# head(Count)
# GeneID=1:nrow(Count)
# Normalizer=rep(1,ncol(Count))
# Treatment=rep(1:4,2)
# mydata=RNASeq.Data(Count,Normalize=NULL,Treatment,GeneID) 
#                   ## standardized RNA-seq data
# c0=KmeansPlus.RNASeq(mydata,nK=10)$centers
#                   ## choose 10 cluster centers to initialize the clustering 
# cls=Cluster.RNASeq(data=mydata,model="nbinom",centers=c0,method="EM")$cluster
#                   ## use EM algorithm to cluster genes
# tr=Hybrid.Tree(data=mydata,cluste=cls,model="nbinom")
#                   ## bulild a tree structure for the resulting 10 clusters
# plotHybrid.Tree(merge=tr,cluster=cls,logFC=mydata$logFC,tree.title=NULL)
#                   ## plot the tree structure
}



