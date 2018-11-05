FROM debian:stretch-slim

RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests -y curl git ca-certificates

RUN curl -fSL https://nginx.org/download/nginx-1.15.1.tar.gz | tar -zxC /usr/src

RUN git clone git://github.com/vozlt/nginx-module-vts.git

RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests -y build-essential libpcre3-dev zlib1g-dev

WORKDIR /usr/src/nginx-1.15.1

RUN ./configure \
    --prefix=/etc/nginx \
    --sbin-path=/usr/sbin/nginx \ 
    --error-log-path=/var/log/nginx/error.log \
    --http-log-path=/var/log/nginx/access.log \
    --with-http_stub_status_module \
    --with-http_v2_module \
    --add-module=/nginx-module-vts
RUN make
RUN make install

RUN nginx -V

WORKDIR /

RUN ls /etc/nginx
#RUN ls /var/log/nginx

RUN mkdir -p /var/log/nginx/

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

CMD ["nginx", "-g", "daemon off;"]
