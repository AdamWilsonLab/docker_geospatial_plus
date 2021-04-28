FROM rocker/geospatial
MAINTAINER "Adam M. Wilson" adamw@buffalo.edu

RUN  apt-get update -y
RUN  apt-get upgrade -y  --allow-unauthenticated
RUN  apt-get install -y --no-install-recommends --allow-unauthenticated \
      locales \
      libssl-dev \
      libxml2-dev \
      libcairo2-dev \
      libxt-dev \
      libcgal-dev \
      libglu1-mesa-dev \
      ca-certificates \
      netcat

# Add a default CRAN mirror
RUN  mkdir -p /usr/lib/R/etc/
RUN  echo "options(repos = c(CRAN = 'https://cran.rstudio.com/'), download.file.method = 'libcurl')" >> /usr/lib/R/etc/Rprofile.site

# Add a directory for host R libraries
RUN  mkdir -p /library
RUN  echo "R_LIBS_SITE=/library:\${R_LIBS_SITE}" >> /usr/lib/R/etc/Renviron.site

# install some extra R packages
RUN    R -e "install.packages('maxnet', method='wget', quiet=T, verbose=F)"
RUN    R -e "install.packages('Morpho', method='wget', quiet=T, verbose=F)"
RUN    R -e "install.packages('rgl', method='wget', quiet=T, verbose=F)"
RUN    R -e "install.packages('ENMeval', method='wget', quiet=T, verbose=F)"
RUN    R -e "install.packages('scales', method='wget', quiet=T, verbose=F)"
RUN    R -e "install.packages('viridis', method='wget', quiet=T, verbose=F)"
RUN    R -e "install.packages('rjags', method='wget', quiet=T, verbose=F)"
RUN    R -e "install.packages('coda', method='wget', quiet=T, verbose=F)"
RUN    R -e "install.packages('mcmc', method='wget', quiet=T, verbose=F)"
RUN    R -e "install.packages('colourvalues', method='wget', quiet=T, verbose=F)"
RUN    R -e "install.packages('BiocManager', method='wget', quiet=T, verbose=F)"
RUN    R -e "BiocManager::install('rhdf5')"
