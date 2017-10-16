# Why is owner and group not preserved?

```
$ cat Dockerfile
FROM ubuntu as builder

ADD . /var/www
RUN chown -R www-data:www-data /var/www
RUN ls -lah /var/www

FROM ubuntu
COPY --from=builder /var/www /var/www
RUN ls -lah /var/www


$ docker build --no-cache .
Sending build context to Docker daemon  3.584kB
Step 1/7 : FROM ubuntu as builder
 ---> 747cb2d60bbe
Step 2/7 : ADD . /var/www
 ---> 6b1b34d33600
Step 3/7 : RUN chown -R www-data:www-data /var/www
 ---> Running in 8e70ed358a3c
 ---> 33e19a9b8669
Removing intermediate container 8e70ed358a3c
Step 4/7 : RUN ls -lah /var/www
 ---> Running in b8653b52d84d
total 16K
drwxr-xr-x 1 www-data www-data 4.0K Oct 16 19:30 .
drwxr-xr-x 1 root     root     4.0K Oct 16 19:30 ..
-rw-r--r-- 1 www-data www-data  173 Oct 16 19:30 Dockerfile
drwxr-xr-x 1 www-data www-data 4.0K Oct 16 19:23 stuff
 ---> f7f42798d3c9
Removing intermediate container b8653b52d84d
Step 5/7 : FROM ubuntu
 ---> 747cb2d60bbe
Step 6/7 : COPY --from=builder /var/www /var/www
 ---> deca456903fa
Step 7/7 : RUN ls -lah /var/www
 ---> Running in 0b0e7cdea0f0
total 16K
drwxr-xr-x 3 root root 4.0K Oct 16 19:30 .
drwxr-xr-x 1 root root 4.0K Oct 16 19:30 ..
-rw-r--r-- 1 root root  173 Oct 16 19:30 Dockerfile
drwxr-xr-x 2 root root 4.0K Oct 16 19:23 stuff
 ---> 2bba588f4887
Removing intermediate container 0b0e7cdea0f0
Successfully built 2bba588f4887
```
