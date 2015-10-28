# docker-limesurvey

Docker image to run Limesurvey applications on production.

## Building the image

git clone https://github.com/gomex/docker-limesurvey.git
cd docker-limesurvey
docker build -t=gomex/limesurvey .

## Using the image

```
docker run -d -v /local_folder/config:/app/limesurvey/application/config -P gomex/limesurvey
```
