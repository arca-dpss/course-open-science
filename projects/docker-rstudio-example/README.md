# Using RStudio with Docker

This repository includes a simple example of using RStudio with Docker containers.

- `wine-analysis.R` is a simple analysis script on the *wine* dataset provided by the R package *ordinal*.

- `Dockerfile` provides instructions to build a container to reproduce the original working environment.

## Workflow

Open the terminal and go to the project directory.

As a first step, you need to build an image, which we can name "toy_image":

```
docker build -t toy_image .
```

Afterward, you can run the container in your machine:

```
docker run --name toy_container -p 8787:8787 -e DISABLE_AUTH=true toy_image
```

Since you are working in a private environment, authentication is not required, then it can be disabled.

Now, from the web browser, go to [http://localhost:8787/](http://localhost:8787/)
