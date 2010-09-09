\name{plotHybrid.Tree}
\alias{plotHybrid.Tree}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Plot the tree structure of the hybrid-hierarchical clustering results.
}
\description{
 Each vertical bar at the bottom represents the profile of one genes, with the colors indicating the log folder changes relative to the mean expression of the gene. The number at the bottom shows the labels of the smallest clusters
}
\usage{
plotHybrid.Tree(merge, cluster, logFC, tree.title = NULL,colorful=FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{merge}{
 the merging steps to build the tree, can be the results of Hybrid.Tree()
}
  \item{cluster}{
 The assignment of genes at the bottom of the tree, should be the same as the input for Hybrid.Tree
}
  \item{logFC}{
 The log-fold change of each gene, a table of G rows and I columns
}
  \item{tree.title}{
 The title of the plot
}
 \item{colorful}{
   if FALSE, plot will be in black-white color; if TRUE, plot will be in heat colors (library 'grDevices' might be needed).
 }
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
