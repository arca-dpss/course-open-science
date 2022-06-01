# Building a Docker container with renv

This repository includes a simple example of using RStudio and the `renv` package for R with Docker containers.

- `wine-analysis.R` is a simple analysis script on the *wine* dataset provided by the R package *ordinal*.

- `Dockerfile` provides instructions to build a container to reproduce the original working environment.

## Workflow

### 1. renv

First of all, you need to initialize a session with `renv` and create a snapshot of your working environment. Open the R console and run:

```
renv::init()
```

```
renv::snapshot(type="all")
```

These operations will create inside the project directory:

- the `renv` folder;

- the `renv.lock` file;

- the `.Rprofile` file.

### 2. docker

Open the terminal and go to the project directory.

As a first step, you need to build an image, which we can name "wine_image":

```
docker build -t wine_image .
```

Afterward, you can run the container in your machine:

```
docker run --name wine_container -p 8787:8787 -e DISABLE_AUTH=true wine_image
```

Since you are working in a private environment, authentication is not required, then it can be disabled.

Now, from the web browser, go to [http://localhost:8787/](http://localhost:8787/)
