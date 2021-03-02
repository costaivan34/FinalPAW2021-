<?php

namespace App\Controllers;

class PagesController{
    /**
     * Show the home page.
     */    
    public function home(){
        /*
          if(empty($_SESSION)){
            sin nombre e imagen en el usuario(menu)
        } else {
            poner imagen y nombre de usuario
            restaurant y platos favoritos
            $datos['permisos']= $permisos;
        
        return view ('index.home',compact('datos'));
        }
    }*/
        return view('/home/index');
    }

    
    public function contact(){
        return view('contact');
    }



    public function platos(){
        return view('buscaPlato');
    }

    public function resto(){
        return view('buscaResto');
    }

    public function restauranteSingle(){
       
        return view('/restaurant/restauranteSingle',compact('datos'));
    }

    public function platoSingle(){
        return view('/plato/platoSingle');
    }

    public function buscar(){
        return view('/sitios/SearchSitio');
    }

    public function newOne(){
            //funcion busqueda 
            return view('/sitios/NewSitio');
      
    }
    
    public function cerca(){
        //funcion busqueda 
        return view('/sitios/NearSitios');
  
    }

    public function login(){
        return view('/login/login');
    }

    /**
     * Show the Error 404 page.
     */
    public function notFound(){
        return view('/errors/not-found');
    }

    /**
     * Show the Error 500 page
     */
    public function internalError(){
        return view('/errors/internal-error');
    }
}


