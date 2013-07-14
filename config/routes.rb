Ocd::Application.routes.draw do

    root :to => 'main#index'

    match 'settings' => 'settings#index'
    match 'settings/site' => 'settings#site'
    match 'settings/site_update' => 'settings#site_update'
    match 'settings/fields' => 'settings#fields'
    match 'settings/fields_update' => 'settings#fields_update'

end
