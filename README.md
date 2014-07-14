These scripts helps to manage dns entries

## CNAME

CNAME entries are useful if you already have a valid dns entry like `mybucket.s3.amazonaws.com`
but you want an alternative dns inside you domain.

**mybucket.s3.amazonaws.com => download.sequenceiq.com**

in that case you can use the `create-cname.sh` script

```
./create-cname.sh download mybucket.s3.amazonaws.com
```

## ANAME

ANAME entries are mostly used if you have a machine running **apache/nginx**
and you want to serve a new subdomain lets say `testsite.sequenceiq.com`

```
./create-aname.sh testsite 54.72.21.93
```

### nginx config

If you want to serv the new **ANAME** entry you need to create a new nginx config file:

```
cat | sudo tee /etc/nginx/sites-available/testsite.conf <<EOF
server {
    listen      80;
    server_name testsite.sequenceiq.com;
    location / {
        root        /usr/share/nginx/testsite/;
    }
}
EOF
```

to enable it you need:
- a symlink from ` /etc/nginx/sites-enabled`
- restart nginx

```
sudo ln -s /etc/nginx/sites-available/testsite.conf testsite.conf
sudo service nginx restart
```
