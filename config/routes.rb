Ocd::Application.routes.draw do

    root :to => 'main#welcome', :constraints => {:subdomain => 'www'}
    root :to => 'main#welcome', :constraints => {:subdomain => ''}
    root :to => 'main#index'

    match 'login' => 'main#login'
    match 'main/login_process' => 'main#login_process'
    match 'sign_up' => 'main#sign_up'
    match 'main/sign_up_process' => 'main#sign_up_process'
    match 'about' => 'main#about'
    match 'welcome' => 'main#welcome'

    match 'settings' => 'settings#index'
    match 'settings/site' => 'settings#site'
    match 'settings/site_update' => 'settings#site_update'
    match 'settings/about' => 'settings#about'
    match 'settings/about_update' => 'settings#about_update'
    match 'settings/fields' => 'settings#fields'
    match 'settings/fields_update' => 'settings#fields_update'
    match 'settings/logout' => 'settings#logout'
    match 'settings/nav_menu' => 'settings#nav_menu'

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
    match 'settings/homepage' => 'settings#homepage'
    match 'settings/homepage_update' => 'settings#homepage_update'

    match 'settings/rolodex' => 'settings#rolodex'
    match 'settings/rolodex_insert' => 'settings#rolodex_insert'
    match 'settings/rolodex_visibility' => 'settings#rolodex_visibility'
    match 'settings/rolodex_edit' => 'settings#rolodex_edit'
    match 'settings/rolodex_remove' => 'settings#rolodex_remove'
    match 'settings/rolodex_update' => 'settings#rolodex_update'
    match 'settings/rolodex_visibility' => 'settings#rolodex_visibility'

    match 'items/settings_index' => 'items#settings_index'
    match 'items/edit_list' => 'items#edit_list'
    match 'items/edit' => 'items#edit'
    match 'items/update' => 'items#update'
    match 'items/update_image' => 'items#update_image'
    match 'items/create' => 'items#create'
    match 'items/new' => 'items#new'
    match 'items/list_options' => 'items#list_options'
    match 'items/details_brief' => 'items#details_brief'

    match 'rolodex/:id' => 'rolodex#index'

    match 'search' => 'items#search'

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
