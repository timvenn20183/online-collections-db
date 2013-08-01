Ocd::Application.routes.draw do

    root :to => 'main#index'

    match 'login' => 'main#login'
    match 'main/login_process' => 'main#login_process'
    match 'about' => 'main#about'

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

    match 'settings/conditions' => 'settings#conditions'
    match 'settings/condition_remove' => 'settings#condition_remove'
    match 'settings/condition_insert' => 'settings#condition_insert'
    match 'settings/condition_edit' => 'settings#condition_edit'
    match 'settings/condition_update' => 'settings#condition_update'
    match 'settings/condition_visiblity' => 'settings#condition_visibility'

    match 'settings/fields' => 'settings#fields'
    match 'settings/about_on_menu' => 'settings#about_on_menu'

    match 'items/settings_index' => 'items#settings_index'
    match 'items/edit_list' => 'items#edit_list'
    match 'items/edit' => 'items#edit'
    match 'items/update' => 'items#update'
    match 'items/create' => 'items#create'
    match 'items/new' => 'items#new'

    match 'collection/:id' => 'collection#index'

    match 'condition/:id' => 'condition#index'

    match 'thingfields/fieldoptions_edit_list' => 'thingfields#fieldoptions_edit_list'
    match 'thingfields/fieldoption_visibility' => 'thingfields#fieldoption_visibility'
    match 'thingfields/fieldoption_edit' => 'thingfields#fieldoption_edit'
    match 'thingfields/fieldoption_update' => 'thingfields#fieldoption_update'
    match 'thingfields/fieldoption_insert' => 'thingfields#fieldoption_insert'
    match 'thingfields/fieldoption_remove' => 'thingfields#fieldoption_remove'
    match 'thingfields/create' => 'thingfields#create'
    match 'thingfields/remove' => 'thingfields#remove'
    match 'thingfields/update' => 'thingfields#update'

    match 'fieldoptions/:id' => 'fieldoptions#index'

end
