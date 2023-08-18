<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Pilot extends Model
{
    use HasFactory;
    protected $primaryKey = 'certificate';

    /**
     * Get the post that owns the comment.
     */
    public function company(): BelongsTo
    {
        return $this->belongsTo(Company::class,'company');
    }

    public static function totalBonusByCompany()
    {   
        // DB::raw est là pour faire la requête avec des fonctions (syntaxe ...)
        return self::select('company', \DB::raw('SUM(bonus) as total_bonus'))
        ->groupBy('company')->get();
    }

    public static function concatPilotNameByCompany()
    {   
        // DB::raw est là pour faire la requête avec des fonctions (syntaxe ...)
        return self::select('company', \DB::raw('GROUP_CONCAT(name SEPARATOR " ") as concat'))
        ->groupBy('company')->get();
    }
}
