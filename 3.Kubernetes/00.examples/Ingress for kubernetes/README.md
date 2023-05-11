# Ingress para microservicios

Un Ingress expone las rutas HTTP y HTTPS desde fuera del clúster a los servicios dentro del clúster. El enrutamiento del tráfico se controla mediante reglas definidas en el recurso Ingress.

# Configuración:

Dado que se tienen dos clusters, uno para producción y otro para desarrollo y QA, se van a crear dos archivos de configuración para los ingress, para cada uno de los clusters.

 - `nginx-ingress-service-prod.yml`
 - `nginx-ingress-service-dev.yml`

Cada archivo va a contener la configuración de los ingress para cada uno de los clusters. En caso de que se requiera agregar un nuevo sitio web o hacer algun update, actualizarlo en el ingress que corresponda.

