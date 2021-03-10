#!/bin/bash
docker build -t joehwang/rails6:ruby3 .
export CURRENT_FOLDER=`pwd`
# Run a docker with the env boot script
docker run -v $CURRENT_FOLDER/rails_app:/sample_app joehwang/rails6:ruby3
# Get the container ID of the last run docker (above)
export CONTAINER_ID=`docker ps -lq`
# Commit the container state (returns an image_id with sha256: prefix cut off)
docker commit $CONTAINER_ID joehwang/rails6:ruby3
#sudo chown -R $USER:$USER rails_app
echo "rebuild complete"
