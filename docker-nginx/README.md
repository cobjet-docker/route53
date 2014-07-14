## build the image
```
docker build -t nginx-subdomain docker-nginx
```

```
sudo docker run -it \
  -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY \
  -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
  nginx-subdomain /bin/bash
```
