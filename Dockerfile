FROM rocker/geospatial
MAINTAINER "Adam M. Wilson" adamw@buffalo.edu

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
        locales \
        libudunits2-dev \
        libssl-dev \
        libxml2-dev \
        libcairo2-dev \
        libxt-dev \
        libcgal-dev \
        libglu1-mesa-dev \
        ca-certificates \
        netcat

RUN install2.r --error \
  maxnet \
  Morpho \
  rgl \
  ENMeval \
  scales \
  viridis \
  rjags \
  coda \
  mcmc \
  colourvalues \
  BiocManager \
  ## from bioconductor
  && R -e "BiocManager::install('rhdf5', update=FALSE, ask=FALSE)"

