# Eloquent

```bash
php artisan make:model Pilot -mfs 
php artisan make:model Company -mfs 
``` 

Récupération des schémas des tables à partir d'une commande MySQL, à la racine du projet ou ailleurs ...

```bash
mysqldump -u root -p --no-data db_aviation > schema.sql
```

- Les fonctions classiques d'agrégation sont utilisables dans Laravel, comme AVG, SUM, ...

```php

Pilot::avg('bonus');

// Dans tinker
App\Models\Pilot::avg('bonus')

```

Si on a une agrégation plus technique 


Comptez tous le nombre de pilot(s) pour les compagnies dont le statut est published 

Avant mettez à jour la table companies avec le modèle, toutes les companies sont published sauf une de votre choix.

Attention avant de mettre à jour vos tables, qui n'ont pas été créer par Laravel ajouter les champs suivants, sinon Laravelne fera pas les mises à jour

```sql
ALTER TABLE companies
ADD COLUMN created_at TIMESTAMP NULL,
ADD COLUMN updated_at TIMESTAMP NULL;

ALTER TABLE pilots
ADD COLUMN created_at TIMESTAMP NULL,
ADD COLUMN updated_at TIMESTAMP NULL;

```

```php

Company::whereIn('comp', ['AUS', 'CHI', 'FRE1', 'FRE2']) // Sélectionnez les enregistrements à mettre à jour
                     ->update(['status' => 'published']); 

```

Dans Tinker attention aux namespaces

```bash
App\Models\Company::whereIn('comp', ['AUS', 'CHI', 'FRE1', 'FRE2'])->update(['status' => 'published']); 
```

```php

$posts = Pilot::withCount([
    'companies',
    // 'comments as pending_comments_count' => function (Builder $query) {
    //     $query->where('approved', false);
    // },
])->get();
 
```


