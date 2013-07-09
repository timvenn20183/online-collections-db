Ocd::Application.routes.draw do

    root :to => 'main#index'

    match 'settings' => 'settings#index'
    match 'settings/site' => 'settings#site'
    match 'settings/site_update' => 'settings#site_update'

    match 'collection/:id' => 'virtualcollection#index'
   	match 'platform/:id' => 'platform#index'

end
