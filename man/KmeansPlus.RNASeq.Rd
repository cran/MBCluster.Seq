\name{KmeansPlus.RNASeq}
\alias{KmeansPlus.RNASeq}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Initialize the cluster centroids by a model-based Kmeans++ algorithm
}
\description{
The cluster centroids are initialized by a method analogy to Arthur and Vassilvitskii (2007)'s Kmeans++ algorithm
}
\usage{
KmeansPlus.RNASeq(data, nK, model ="nbinom", print.steps=FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
    RNA-Seq data from output of function RNASeq.Data()
}
  \item{nK}{
    The preselected number of cluster centroids
}
  \item{model}{
    The probability model for the count data. The distances between the cluster centroids will be calculated based on the likelihood functions. The model can be 'poisson' for Poisson or 'nbinom' for negative binomial distribution.
}
  \item{print.steps}{
     print out the proceeding steps or not 
    }
}

\value{
  \item{centers}{a matrix of nK rows which contains the value cluster centroids. A chosen cluster centroid is the log fold change (log-FC) of a gene across different treatments, normalized to have zero-sum}
  \item{ID}{The ID number of the selected genes whose log-FC are used as the initial cluster centroids}
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


