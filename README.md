# genius

Technical test for Genius Gambler

## Analyse des consignes

Objectifs :
* rester fidèle au modèle
* mécanisme de navigation
* mécanisme de gestion de données
* code propre et efficace

Vues :
* `appbar` (sans navigation)
* `navbar` (sans navigation)
* page **Classement** : 
    * navigation vers page **Profil**
    * récupération données **firestore**
* page **Profil** :
    * navigation vers page **Classement**
    * récupération données **firestore**

Roadmap :
1. Architecture
2. Front page **Classement**
3. Back page **Classement** (`firestore`)
4. `appbar` et `navbar`
5. Front page **Profil**
6. Back page **Profil** (`firestore`)

## Architecture

```mermaid
graph G
    subgraph MobileApplication
        direction LR
        subgraph ApplicationLayer
            direction LR
            RP[Ranking Page]
            RB[Ranking Bloc]
            PP[Profile Page]
            PB[Profile Bloc]
            RP --> RB
            RB --> RP
            PP --> PB
            PB --> PP
        subgraph DomainLayer
            direction TB
            UR[User Repository]
            RR[Ranking Repository]
        RB --> UR
        RB --> RR
        PB --> UR
    subgraph DataLayer
        F[Firestore]   
```
