<?php

namespace App\Controllers;

class ProjectController
{
    /**
     * Show the Error 404 page.
     */
    public function notFound()
    {
        return view('/errors/not-found');
    }

    /**
     * Show the Error 500 page
     */
    public function internalError()
    {
        return view('/errors/internal-error');
    }
}
