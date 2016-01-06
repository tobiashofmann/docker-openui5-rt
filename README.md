# docker-openui5-rt

Repository for creating a docker image using a Dockerfile.

Currently used by Docker hub for an automated build.

# Content of the docker image

1. Apache web server running on port 80
2. All Open UI5 library versions as tagged by openui5. Access via http://<dockerhost>:<port>/<version>/resources. <version> comes from the openui5 version. Example: 1.32.9, or 1.28.4

To keep the size of the docker image small, the checkout and build process is not included as a RUN command in the Dockerfile. Dockerfile is using the included file create.sh for building each openui5 version and to make is accessible via apache. Besides, there is the limitation of 127 layers for a docker image, which would be hard to keep considering the high number of tagged versions of OpenUI5.

# Start docker image

docker run -d -p 50000:80 -t tobiashofmann/openui5-rt:latest
