# snippets_template

Un template permetant la création et le déploiement d'une documentation perso sur un bucket S3.



## Pré requis

Pour installer le projet il vous faut posseder:
 * Un compte AWS et un utilisateur programmatique IAM avec une policy **AmazonS3FullAccess**
 * Un compte GitLab
 * [terrform](https://www.terraform.io/downloads.html)
 * Python >= 3.6
 * [pip](https://pip.pypa.io/en/stable/installing/)
 
 
 
## Installation
 
Il vous faudra dans un premier temps forker ce projet.



### Local

Pour l'installation de ce projet il est recommandé de créer un
  [environnement virtuel python](https://docs.python.org/fr/3/library/venv.html)
 
Une fois ce dernier activé, executez les commandes suivantes:
 
 ```shell script
$ pip install .
```

 ```shell script
$ python setup.py install
```

 ```shell script
$ make html
```

Un dossier build a été généré contenant un dossier html, vous pouvez directement accéder à vos snippets en local en
ouvrant le fichier buid/html/index.html



### Terraform

Pour la partie Terrform, il vous suffit de remplacer le placeholder '<MY_BUCKET_NAME>' par le nom que vous voulez donner
à votre bucket s3, il est présent dans les fichiers:

* terraform/aws/terraform.tfvars
* terraform/aws/s3_policy.json
* bin/web_publish.py 

Maintenant il vous faut exporter vos credentials aws pour pouvoir créer le bucket:

 ```shell script
$ export AWS_ACCESS_KEY_ID=<INSERT_YOUR_AWS_ACCESS_KEY_ID>
$ export AWS_SECRET_ACCESS_KEY=<INSERT_YOUR_AWS_SECRET_ACCESS_KEY>
$ export AWS_DEFAULT_REGION=eu-west-1
$ export AWS_DEFAULT_OUTPUT=json
```

Puis lancer:

 ```shell script
$ terraform init
$ terraform apply
```

Vous pouvez à présent pouvoir récupérer l'url du site statique hébergé sur le bucker s3 en vous connectant à la console AWS


Pour publier votre site il suffit d'utiliser la commande:

 ```shell script
$ ./bin/web_publish.py
```



### Intégration Continue

Afin d'éviter de devoir lancer le script web_publish pour chaque mise à jour, nous allons configurer une pipeline GitlabCI
pour le faire automatiquement à notre place.

Pour cela vous avez juste à ajouter 2 varaibles dans GitLabCI (en protected et masked),

* AWS_ACCESS_KEY_ID 
* AWS_SECRET_ACCESS_KEY

Pour tester la CI il vous suffit de lancer le script d'autocommit:

 ```shell script
$ ./bin/autocommit
```

Maintenant il vous suffit d'ajouter des rubriques dans vos snippets en suivant les normes 
[reStructuredText](https://www.sphinx-doc.org/en/master/usage/restructuredtext/index.html)