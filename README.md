# README

## USEAGE

First,build image from rebuild_image.sh

```
sh rebuild_image.sh
```
then start service

```
docker-compose up 
```
when edit rails_app/GEMFILE or entrypoint.sh

need to use rebuild_image.sh rebuild the image.