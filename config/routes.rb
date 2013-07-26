Ocd::Application.routes.draw do

    root :to => 'main#index'

    match 'login' => 'main#login'
    match 'main/login_process' => 'main#login_process'

    match 'settings' => 'settings#index'
    match 'settings/site' => 'settings#site'
    match 'settings/site_update' => 'settings#site_update'
    match 'settings/about' => 'settings#about'
    match 'settings/about_update' => 'settings#about_update'
    match 'settings/fields' => 'settings#fields'
    match 'settings/fields_update' => 'settings#fields_update'
    match 'settings/logout' => 'settings#logout'
    match 'settings/collections' => 'settings#collections'
    match 'settings/collection_remove' => 'settings#collection_remove'
    match 'settings/collection_insert' => 'settings#collection_insert'
    match 'settings/collection_edit' => 'settings#collection_edit'
    match 'settings/collection_update' => 'settings#collection_update'
    match 'settings/collection_visiblity' => 'settings#collection_visibility'
    match 'settings/tags' => 'settings#tags'

    match 'items/settings_index' => 'items#settings_index'
    match 'items/edit_list' => 'items#edit_list'
    match 'items/edit' => 'items#edit'
    match 'items/update' => 'items#update'

    match 'collection/:id' => 'collection#index'

end
