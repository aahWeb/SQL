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

Attention avant de mettre à jour vos tables, qui n'ont pas été créer par Laravel ajouter les champs suivants, sinon Laravelne fera pas les mises à jour, et pour la création.

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


## Exercice 

Sélectionnez les compagnies ayant plus d'un pilote, ainsi que leur nombre de pilotes.

```php
App\Models\Pilot::select('company', \DB::raw('COUNT(*) as total_pilot'))->groupBy('company')->having('total_pilot', '>', 1)->get();
```



```php

App\Models\Company::whereIn('comp', ['FRE1', 'FRE2' ])->update(['country' => 'fr']); 
App\Models\Company::whereIn('comp', ['AUS'])->update(['country' => 'aus']); 
App\Models\Company::whereIn('comp', ['CHI'])->update(['country' => 'chi']); 
App\Models\Company::whereIn('comp', ['SIN'])->update(['country' => 'sin']); 



 App\Models\Pilot::select(\DB::raw('AVG(num_flying) as avg_flying') )->whereIn('company', function ($query) { $query->select('comp')->from('companies')->where('country', 'fr') ; })->get();

``` 
