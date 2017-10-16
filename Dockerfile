FROM ubuntu as builder

ADD . /var/www
RUN chown -R www-data:www-data /var/www
RUN ls -lah /var/www

FROM ubuntu
COPY --from=builder /var/www /var/www
RUN ls -lah /var/www

