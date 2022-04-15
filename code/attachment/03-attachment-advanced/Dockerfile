FROM rocker/verse:4.1.2

WORKDIR /home/rstudio/attachment

COPY renv.lock renv.lock

# Install renv
ENV RENV_VERSION 0.15.4
ENV RENV_PATHS_CACHE /home/rstudio/.cache/R/renv
RUN R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"

# Install packages
RUN R --vanilla -e "renv::restore()"

# Copy project files
COPY . .

# Run targets
# RUN R -e "targets::tar_make(script = 'analysis/targets-workflow.R', store = 'analysis/_targets')"

# Render report
# RUN R -e "rmarkdown::render(input = 'documents/report.Rmd')"

# Change ownership
# RUN chown -R rstudio:rstudio /home/rstudio/
