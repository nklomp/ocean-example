# The base image we are using
FROM ubuntu:22.04

# Let's make sure we do not run as root (it is a container, but still better safe than sorry)
#RUN useradd -ms /bin/bash alguser
#USER alguser

# Copy the actual script to the /algo directory and make them only available to the alguser
#COPY --chown=alguser --chmod=700 random.sh /algo/
COPY --chmod=755 random.sh /algo/

ADD https://github.com/nklomp/ocean-example/raw/main/energyshr/dataset/energySHR-london-synthetic-10k.csv /dataset/tmp/

RUN ls -al /dataset/tmp/

RUN ls -al /algo/

# Set the working directory to our script dir
#WORKDIR /algo

# Run the command
#ENTRYPOINT ["/bin/bash", "-c", "./random.sh"]
