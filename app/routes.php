 <?php

    $router->get('', 'PagesController@home');
    $router->get('login', 'PagesController@login');

    $router->get('contact', 'PagesController@contact');

    $router->post('login/validar', 'LoginController@validarLogin');

    $router->get('restaurantes', 'RestaurantController@administracionRestaurantes');
  
    $router->get('resto', 'SitioController@getOne');
    $router->get('resto/new', 'PagesController@newOne');
    $router->get('platos', 'PagesController@platoSingle');

    $router->get('cerca', 'PagesController@cerca');
    $router->get('buscar', 'PagesController@buscar');

    $router->get('not_found', 'ProjectController@notFound');
    $router->get('internal_error', 'ProjectController@notFound');


   
   