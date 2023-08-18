<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Company extends Model
{
    use HasFactory;
    protected $primaryKey = 'comp';


     /**
     * Get the comments for the blog post.
     */
    public function pilots(): HasMany
    {
        return $this->hasMany(Pilot::class);
    }

}
