# Eloquent

```bash
php artisan make:model Pilot -mfs 
php artisan make:model Company -mfs 
``` 

Récupération des schémas des tables à partir d'une commande MySQL, à la racine du projet ou ailleurs ...

```bash
mysqldump -u root -p --no-data db_aviation > schema.sql
```

