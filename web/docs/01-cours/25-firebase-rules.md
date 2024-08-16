---
title: Règles Firebase
description: Firebase - règles d'accès pour les différents services
hide_table_of_contents: true
---

# Firebase: Règles d'accès

<Row>

<Column>

:::tip Avant la séance :

Vous regarderez la documentation pour les règles d'accès ici **[Premiers pas](https://firebase.google.com/docs/firestore/security/get-started?hl=fr)**.

Portez une attention particulière à **[Structuration des règles de sécurité](https://firebase.google.com/docs/firestore/security/rules-structure?hl=fr)**.

### Règles de base à la création

### Structure des règles

### Valider qu'un utilisateur est connecté

### Ajouter une "variable"

#### Match avec un document par id de collection

#### Match avec un document par valeur d'un champ


:::

</Column>

<Column>

:::info Séance :

On regardera comment une image est envoyée puis sauvée par Firebase.

On regardera également comment les images sont accédées puis servies par Firebase.

:::

</Column>

</Row>

<Row>
<Column>
Yo 

Applications mobiles avancées

Bon ce n'est pas au cours, mais plusieurs on déjà eu une réflexion sur l'utilisation de Firestore qui ce passe uniquement sur le client. Alors, je vous met ici un peu de contenu, mais ce ne sera pas du contenu évalué, c'est pour votre plaisir personnel!

Lorsque vous créé votre BD Firestore, vous pouvez spécifier des règles d'accès à la BD qui ressemble à ceci:


```
service cloud.firestore {​​​​​​​​
  match /databases/{​​​​​​​​database}​​​​​​​​/documents {​​​​​​​​
    match /<some_path>/ {​​​​​​​​
      allow read, write: if <some_condition>;
    }​​​​​​​​
  }​​​​​​​​
}​​​​​​​​
```

Vous trouverez la modification des règles dans la console Firestore:



On peut avoir un grand contrôle sur la façon dont les données sont disponible pour les utilisateurs. Les plus simple et qui fonctionne très bien dans notre situation, c'est d'uniquement personne à un utilisateur authentifié d'écrire des données et que l'utilisateur puissent seulement avoir accès à ses données.

Ce type d'accès ressemblerait à ceci:


```
service cloud.firestore {​​​​​​​​
  match /databases/{​​​​​​​​database}​​​​​​​​/documents {​​​​​​​​
    // Make sure the uid of the requesting user matches name of the user
    // document. The wildcard expression {​​​​​​​​userId}​​​​​​​​ makes the userId variable
    // available in rules.
    match /users/{​​​​​​​​userId}​​​​​​​​ {​​​​​​​​
      allow read, update, delete: if request.auth != null && request.auth.uid == userId;
      allow create: if request.auth != null;
    }​​​​​​​​
  }​​​​​​​​
}​​​​​​​​
```
On voit que l'utilisateur peut uniquement avoir accès à son document, soit le document dont le userId est le sien.

Voilà, une règles aussi simple nous permet de gérer le contrôle d'accès et de sécuriser mon application et notre BD.
</Column>
</Row>
