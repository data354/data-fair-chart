# **Data-fair**

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

## **How to install**

``` 
helm repo add data354-helm https://data354.github.io/helm
helm install my-data-fair data354-helm/data-fair
```

## **Architecture**

<img src="https://data-fair.github.io/3/images/technical-architecture/architecture.jpg"
alt="Markdown Monster icon"
style="float: left; margin-right: 10px;" />

- **Data Fair**, le coeur de la solution, permet d’indexer, d’Apifier, d’enrichir et de partager facilement ses données
- **Simple Directory** permet de se connecter au portail et gérer les comptes
- **Data Fair Portal** permet de créer facilement plusieurs portails de données, pour du partage en opendata ou en interne
- **Les Connecteurs de catalogues** permettent de se synchroniser avec d'autres catalogues de données, dans les 2 sens
- **Les Data Fair Processings** permet de programmer des traitements périodiques pour mettre à jour les données et de récolter les données issues de l’IOT
- **Notify** permet de gérer les alertes et les notifications
- **Les analytics** peuvent être gérés directement dans la plateforme à l'aide de Matomo
- **Capture** permet de créer les miniatures et les captures d’images des visualisations
- **Thumbor** permet les traitement des images des jeux de données
- **Backup** permet de gérer les sauvegardes de la plateforme
- **Les services distants** ne sont pas développées dans ce projet : ce sont des applications Web développées et déployées de manière autonome qui respectent les règles d’interopérabilité d’OpenAPI 3.0 avec Data Fair. Ils sont disponibles sous forme d'extensions.
- **Les visualisations de données** : certaines sont open source, d'autres sont propriétaires (extensions en libre accès ou nécessitant un abonnement). Chaque application de base peut être utilisée autant de fois que désiré pour valoriser différents jeux de données. Data Fair permet de stocker et éditer les différents paramètres d'une même application de base.

## Overrides values


