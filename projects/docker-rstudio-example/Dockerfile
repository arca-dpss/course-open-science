FROM rocker/rstudio:4.1.3
RUN R -e "install.packages('remotes')"
RUN R -e "remotes::install_version('ordinal', version='2019.12.10')"
WORKDIR /home/rstudio/test_docker/
COPY . .
RUN chown -R rstudio:rstudio /home/rstudio/
