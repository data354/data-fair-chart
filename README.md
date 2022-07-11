# **Data-fair**

<img src="https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/data354-helm"
alt="Markdown Monster icon"
style=" margin-right: 10px;" />

<img src="https://data-fair.github.io/3/logo.png"
alt="Markdown Monster icon"
style="float: left; margin-right: 10px;" />

<img src="https://static.wixstatic.com/media/84b0cf_beb914d4ae1c4a67a943e2a56de2b767~mv2.png/v1/fill/w_216,h_65,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/logo-data354_CL.png"/>

[Data Fair](https://data-fair.github.io/3/functional-presentation/introduction) and its ecosystem enable the implementation of a data sharing platform (internal or opendata) and visualizations. This platform can be aimed at the general public, who can access the data through adapted interactive visualizations, as well as at a more expert public who can access the data through APIs.

## **Prerequisites**
```
Kubernetes 1.16+
Helm 3+
```

## **Managing package**

### Get Helm Repository Info

```bash
helm repo add data354-helm https://data354.github.io/helm
helm repo update
helm install [RELEASE_NAME] data354-helm/data-fair
```

### Installing Helm Chart

```bash
helm install [RELEASE_NAME] data354-helm/data-fair
```
Note that the above command will install Superset into current namespace of your Kubernetes cluster. If you want to use another namespace specify it:

```bash
helm install [RELEASE_NAME] data354-helm/data-fair --namesape default
```
Changez ``default`` par votre namespace.

### Uninstalling Helm Chart

```bash
helm uninstall [RELEASE_NAME]
```
This removes all the Kubernetes components associated with the chart and deletes the release.

See [*helm uninstall*](https://helm.sh/docs/helm/helm_uninstall/) for command documentation.

### Upgrading Helm Chart

```bash
helm upgrade [RELEASE_NAME] data354-helm/data-fair
```

## **Overrides values**

<!-- ### **Utiliser une base de donnees externe**
Notre chart fournit par defaut les base de donnees elasticsearch et mongodb.
Si vous en disposer deja vous pouvez utiliser les siennes.

**prerequis**
```yml
mongo: 4.x.x
elasticsearch: 7.x.x
```

Precisez les valeurs suivantes:
```yaml
mongo:
  external: true
  url: data.mongo.com
```
```yaml
elasticsearch:
  external: true
  url: data.mongo.com # example
```
si votre base de donnees utilise des credentials n'oubliez pas de les specifiez
```yaml
mongo:
  external: true
  url: user:pwd@data.mongo.com # example
```
```yaml
elasticsearch:
  external: true
  url: user:pwd@data.mongo.com # example
``` -->

### **Definir l'adresse et le port du proxy**
If you are in a test environment like Minikube, this configuration will work without any problem.
```yaml
proxy:
  public_address: 192.168.49.2 # Minikube host for testing
  scheme: http # Or https
  port: 32000
  nodePort: true
```

When you set the nodePort option to true, make sure you choose a port value between 30000 and 32767 so that it is accepted by kubernetes, because the nodeport service created uses the same defined port number.

In production you have to set the nodeport to false to avoid some conflicts, in this case a CLusterIp service is created. It would then be better to create an ingress resource to redirect external traffic to your service.
```yaml
proxy:
  public_address: datafair.data354.com
  scheme: https # Or https
  port: 443
  nodePort: false
```
For now, this version of our chart does not have a built-in ingress resource. This feature will be added in a later version.

### **Prometheus Metrics**

```yaml
prometheus:
  enable: true
  metrics_path: /global-metrics
  scrape_interval: 120s
```
By default promteheus is enabled with this configuration. If you want to disable it :
```bash
helm install --set prometheus.enable=false [RELEASE_NAME] data354-helm/data-fair
```