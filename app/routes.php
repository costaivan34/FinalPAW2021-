 <?php

    $router->get('', 'SitioController@index');
    $router->get('contacto', 'PagesController@contact');
    $router->post('login', 'LoginController@validarLogin');
    $router->get('resto', 'SitioController@getOne');
    $router->get('resto/new', 'PagesController@newOne');
    $router->get('platos', 'SitioController@getPlatos');
    $router->get('plato', 'PlatoController@getOne');
    $router->get('platosPaginacion', 'SitioController@getPlatoPage');
    $router->get('categorias', 'SitioController@getCategorias');
    $router->get('cerca', 'SitioController@cerca');
    $router->post('marcadores', 'SitioController@getMarcadores');
    $router->get('currentPosition', 'SitioController@currentPosition');

    $router->get('buscador', 'SitioController@buscador');
    $router->get('buscar', 'SitioController@buscar');
    
    $router->get('comentariosPaginacion', 'SitioController@getComentarioPage');
    $router->get('comentarios', 'SitioController@getComentarios');
    $router->post('sendComentario', 'SitioController@sendComentario');
    $router->get('not_found', 'PagesController@notFound');
    $router->get('internal_error', 'PagesController@internalError');


    
   