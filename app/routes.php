 <?php

    $router->get('', 'PagesController@home');
    $router->get('login', 'PagesController@login');

    $router->get('contact', 'PagesController@contact');

    $router->post('login', 'LoginController@validarLogin');

    $router->get('restaurantes', 'RestaurantController@administracionRestaurantes');
  
    $router->get('resto', 'SitioController@getOne');
    $router->get('resto/new', 'PagesController@newOne');
    $router->get('platos', 'SitioController@getPlatoPageN');
    $router->get('comentario', 'SitioController@getComentarioPageN');

    $router->get('categorias', 'SitioController@getCategorias');


    $router->post('cerca', 'SitioController@cerca');
    $router->get('buscar', 'PagesController@buscar');

    $router->post('sendComentario', 'SitioController@sendComentario');
    

    $router->get('not_found', 'ProjectController@notFound');
    $router->get('internal_error', 'ProjectController@notFound');


   
   