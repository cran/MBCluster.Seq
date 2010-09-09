\name{Hybrid.Tree}
\alias{Hybrid.Tree}
 %%
\title{
Do hybrid-hierarchical clustering for RNA-seq data
}
\description{
The hybrid-hierarchical clustering starts from an initial partition of the objects, and merges the small clusters gradually into one tree structure
}
\usage{
Hybrid.Tree(data, cluster0, model = "nbinom")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
  RAN-seq data standardized by RNASeq.Data()
}
  \item{cluster0}{
  A partition of the objects, should be a vector with values ranging from 1 to K0, where K0 is the number of small clusters at the bottom of the hierarchical structure. 
}
  \item{model}{
 The probability models to calculated the distance between to merged clusters
}
}

\value{
a table is returned to keep the information of the tree structure. The table has K rows and 2 columns, where K is the maximum level of the tree, and each row shows the two node being merged in each step
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
