server {
  include /etc/nginx/include.d/ssl.conf;

  # default proxy settings
  proxy_set_header Host $http_host;
  proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  proxy_set_header X-Forwarded-Proto https;
  proxy_set_header X-Real-IP $remote_addr;
  proxy_set_header X-Scheme $scheme;
  proxy_set_header X-Real-IP $remote_addr;
  proxy_set_header X-Nginx-Proxy true;

  # disable gzip encoding for proxy applications
  proxy_set_header Accept-Encoding identity;

  # allow websocket connection upgrade
  # proxy_http_version 1.1;
  proxy_set_header Upgrade $http_upgrade;
  proxy_set_header Connection "upgrade";

  include /etc/nginx/include.d/warp.conf;
  include /etc/nginx/include.d/default-dogu.conf;

  # services
{{range .}}
  location /{{.Name}} {
    proxy_pass {{.URL}};
  }
{{end}}
  # end of services
}
