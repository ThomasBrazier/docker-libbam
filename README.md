# libbam tools in Docker


This image is built on Debian (Bullseye) and the g++ compiler.

The docker contains:
- https://github.com/grenaud/libbam.git

## Build

I built the image by doing

```
docker build -t tombrazier/libbam .
```

And then pushed to dockerhub

```
docker push tombrazier/libbam
```

## Usage


The working directory is `/mnt`.
