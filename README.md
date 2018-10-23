# proposal-nginx-grpc

## Build

```bash
./build.sh
```

## Run

```bash
docker-compose up -d
docker-compose logs -f nginx
```

```bash
docker-compose exec client client -h nginx -p 80
```

| url | module |
| --- | --- |
| http://localhost:8081/stub_status | [ngx_http_stub_status_module](http://nginx.org/en/docs/http/ngx_http_stub_status_module.html) |
| http://localhost:9113/metrics | [nginx-prometheus-exporter](https://github.com/nginxinc/nginx-prometheus-exporter) |
| http://localhost:8082/status | [nginx-module-vts](https://github.com/vozlt/nginx-module-vts) |
| http://localhost:9114/metrics | [nginx-vts-exporter](https://github.com/hnlq715/nginx-vts-exporter) |
| http://localhost:9090 | [prometheus](https://prometheus.io/) |
| http://localhost:3000/d/1ZsLk0xik/nginx-vts-stats | [grafana](https://grafana.com/dashboards/2949) |
