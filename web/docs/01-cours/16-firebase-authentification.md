---
title: Firebase et Authentification
description: Firebase - Introduction authentification
hide_table_of_contents: true
---

# Firebase : comptes et authentification

<Row>

<Column>

:::tip Avant la séance :

Regardez la doc de [firebase](https://firebase.google.com/).

Dans les séances suivantes, nous allons utiliser plusieurs produits de firebase:

- [Cloud Firestore](https://firebase.google.com/products/firestore) : la "BD", avec une approche un peu différente de SQL
- [Cloud Storage](https://firebase.google.com/products/storage) : le stockage de fichier, principalement pour nos images

Finalement comme Flutter et Firebase sont 2 plateformes gérées par Google, elles sont assez bien intégrées.

### Étape 1 - Créer un projet Firebase

Pour la mise en place de Firebase, vous devez suivre les étapes décrites **[ici (Configuration de Firebase)](notice-firebase)**.

### Étape 2 - Ajouter l'authentification
Regardez la doc de [firebase authentification](https://firebase.google.com/docs/auth/flutter/start). Nous vous recommandons d'y passer un maximum de 20 minutes. Il faut lire un peu, coder puis relire en profondeur que de lire de la doc 4 heures sans coder.

Dans le projet, nous allons utiliser la connexion avec des comptes Google. On va suivre les indications **[ici (Firebase Authentification)](notice-firebase-auth)**

ATTENTION, les étapes **[spécifiques à Android](notice-firebase-auth#configuration-google_sign_in-pour-android)** sont à répéter pour chaque nouveau poste de travail.

### Étape 3 - Ajouter l'authentification par mot de passe
L'authentification par mot de passe est très similaire à l'authentification par par google_sign_in, vous pouvez regarder la **[documentation officielle](https://firebase.google.com/docs/auth/flutter/password-auth)**

:::

</Column>

<Column>

:::info Séance

On discutera de ce que veut dire serverless. C'est pas vraiment qu'il n'y a pas de serveur. C'est plutôt qu'on ne code pas le serveur explicitement.

On discutera du plan de match pour mon premier projet en firebase + flutter.

Le but est de mettre en place le projet aujourd'hui et de compléter la configuration.

Authentifier un utilisateur ne nécessite pas forcément de lui demander de créer un compte. On peut utiliser des comptes existants sur Google, Facebook etc.

Firebase Auth cherche à rendre facile ces différentes options en unifiant l'authentification le plus possible. En combinant avec Flutter qui unifie le dev ios et android, on peut obtenir une appli multi-plateforme qui gère une multitude de comptes possibles

Nous allons passer à travers l'ensemble des types d'auth possibles avec firebase

- anonyme
- courriel + code
- compte gérés : avec inscription et tout
- facebook, google etc

:::

</Column>

</Row>

:::note Exercices

### Exercice test_flutter

Il ne s'agit pas d'un exercice mais de créer le projet pour votre TP3. Suivez les instructions [ici](notice-firebase)

:::
