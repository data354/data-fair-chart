# **Data-fair**

<img src="https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/data354-helm"
alt="Markdown Monster icon"
style=" margin-right: 10px;" />

<img src="https://data-fair.github.io/3/logo.png"
alt="Markdown Monster icon"
style="float: left; margin-right: 10px;" />

<img src="https://static.wixstatic.com/media/84b0cf_beb914d4ae1c4a67a943e2a56de2b767~mv2.png/v1/fill/w_216,h_65,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/logo-data354_CL.png"/>

[Data Fair](https://data-fair.github.io/3/functional-presentation/introduction) et son écosystème permettent de mettre en œuvre une plateforme de partage de données (interne ou opendata) et de visualisations. Cette plateforme peut être à destination du grand public, qui peut accéder aux données au travers de visualisations interactives adaptées, aussi bien qu’à un public plus expert qui peut accéder aux données au travers des APIs.

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
Par defaut helm essaye de déployer les ressources dans le namesapce data-fair. Il doit exister
Si vous voulez utilisez un autre namespace pr2cisez le :

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

Dans cette section nous abordons les valeurs les plus importantes à modifier dans le fichier values.yml.

### Utiliser une base de donn2es externe


### Definir l'adresse et le port du proxy


### Prometheus Metrics

```yaml
prometheus:
  enable: true
  metrics_path: /global-metrics
  scrape_interval: 120s
```
Par default promteheus est activé avec cette configuration. Si vous voulez le désactiver :
```bash
helm install --set prometheus.enable=false [RELEASE_NAME] data354-helm/data-fair
```
