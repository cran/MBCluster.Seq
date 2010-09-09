\name{Cluster.RNASeq}
\alias{Cluster.RNASeq}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
 Do clustering for count data based on poisson or negative-binomial model 
}
\description{
 Given a set of initial cluster centers and specify the iteration algorithm, the function proceed the model-based clustering. 
}
\usage{
Cluster.RNASeq(data, model, centers = NULL, method = c("EM", "DA", "SA"), 
  iter.max = 30, TMP = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
        RNA-seq data  from output of function RNASeq.Data()
}
  \item{model}{
  Currently could be either Poisson or negative-binomial model for count data
}
  \item{centers}{
    Initial cluster centers as a matrix of K rows and I columns to start the clustering algorithm. Each rows is mean-centered to have zero sum. A recommended initial set can be obtained by KmeansPlus.RNASeq()
}
  \item{method}{
   Iteration algorithm to update the estimates of cluster and their centers. Could be Expectation-Maximization (EM), Deterministic Annealing (DA) or Simulated Annealing (SA). 
}
  \item{iter.max}{
 The maximum number of iterations allowed 
}
  \item{TMP}{
 The 'temperature' serving as annealing rate for DA and SA algorithms. The default setting starts from TMP=4 with decreasing rate 0.9
}
}

\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
  \item{probability }{a matrix containing the probability of each gene belonging to each cluster}
  \item{centers }{estimates of the cluster centers, a matrix with the same dimension as the initial input}
  \item{cluster}{a vector taking values between 1,2,...,K, indicating the assignments of the objects to the clusters} 
}
\references{
Model-Based Clustering for RNA-seq Data, Yaqing Si , Peng Liu, Pinghua Li and Thomas Brutnell
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
