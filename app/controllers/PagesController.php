<?php

namespace App\Controllers;

class PagesController
{
    /**
     * Show the home page.
     */
    
    public function home()
    {
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
        $infoBasica['nombre'] = 'La Pepa de Pablo';
        $infoBasica['ubicacion'] = 'Pellegrini 222';
        $infoBasica['horario'] = 'L,M,M,J,V - 10Hs-22Hs';
        $infoBasica['telefono'] = '123456789';
        $infoBasica['descripcionBreve'] = 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente totam quam voluptatum nulla provident molestiae, adipisci sit. Lorem ipsum dolor sit amet consectetur, adipisicing elit.';
        $datos['infoBasica'] = $infoBasica;
        return view('/restaurant/restauranteSingle',compact('datos'));
    }

    public function platoSingle()
    {
        return view('/plato/platoSingle');
    }

    public function buscar(){
        return view('/busqueda/busquedaResto');
    }

    public function busqueda()
    {
        $tipoBusqueda = $_GET['Tipo'];
        $palabraBusqueda = $_GET['BuscarPalabra'];
        $zona = $_GET['Zona'];
        if ($tipoBusqueda == 'Sitio') {
            //funcion busqueda por sitio
            return view('/busqueda/busquedaResto');
        } else {
            //funcion busqueda por plato
            return view('/busqueda/busquedaPlato');
        }
    }
    public function login()
    {
        return view('/login/login');
    }

    public function coming()
    {
        return view('coming');
    }

}
