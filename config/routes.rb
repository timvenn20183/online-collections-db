Ocd::Application.routes.draw do

    if Ocd::Application.config.single_mode == false then
        root :to => 'main#welcome', :constraints => {:host => Ocd::Application.config.domain}, as: :normal_root
    end
    root :to => 'main#index'

    get 'login' => 'main#login'
    match 'main/login_process' => 'main#login_process', via: [:get, :post]
    get 'sign_up' => 'main#sign_up'
    match 'main/sign_up_process' => 'main#sign_up_process', via: [:get, :post]
    get 'about' => 'main#about'
    get 'welcome' => 'main#welcome'
    get 'contact' => 'main#contact'
    match 'main/contact_save' => 'main#contact_save', via: [:get, :post]

    get 'settings' => 'settings#index'
    get 'settings/site' => 'settings#site'
    match 'settings/site_update' => 'settings#site_update', via: [:get, :post]
    match 'settings/site_header' => 'settings#site_header', via: [:get, :post]
    get 'settings/about' => 'settings#about'
    match 'settings/about_update' => 'settings#about_update', via: [:get, :post]
    get 'settings/fields' => 'settings#fields'
    match 'settings/fields_update' => 'settings#fields_update', via: [:get, :post]
    get 'settings/logout' => 'settings#logout'
    get 'settings/nav_menu' => 'settings#nav_menu'

    get 'settings/contact' => 'settings#contact'
    match 'settings/contact_update' => 'settings#contact_update', via: [:get, :post]

    get 'settings/collections' => 'settings#collections'
    match 'settings/collection_remove' => 'settings#collection_remove', via: [:get, :post]
    match 'settings/collection_insert' => 'settings#collection_insert', via: [:get, :post]
    match 'settings/collection_edit' => 'settings#collection_edit', via: [:get, :post]
    match 'settings/collection_update' => 'settings#collection_update', via: [:get, :post]
    match 'settings/collection_visiblity' => 'settings#collection_visibility', via: [:get, :post]

    get 'settings/conditions' => 'settings#conditions'
    match 'settings/condition_remove' => 'settings#condition_remove', via: [:get, :post]
    match 'settings/condition_insert' => 'settings#condition_insert', via: [:get, :post]
    match 'settings/condition_edit' => 'settings#condition_edit', via: [:get, :post]
    match 'settings/condition_update' => 'settings#condition_update', via: [:get, :post]
    match 'settings/condition_visiblity' => 'settings#condition_visibility', via: [:get, :post]

    get 'settings/fields' => 'settings#fields'
    match 'settings/about_on_menu' => 'settings#about_on_menu', via: [:get, :post]
    get 'settings/homepage' => 'settings#homepage'
    match 'settings/homepage_update' => 'settings#homepage_update', via: [:get, :post]

    get 'settings/comments' => 'settings#comments'
    match 'settings/comments_update' => 'settings#comments_update', via: [:get, :post]

    get 'settings/rolodex' => 'settings#rolodex'
    match 'settings/rolodex_insert' => 'settings#rolodex_insert', via: [:get, :post]
    match 'settings/rolodex_visibility' => 'settings#rolodex_visibility', via: [:get, :post]
    match 'settings/rolodex_edit' => 'settings#rolodex_edit', via: [:get, :post]
    match 'settings/rolodex_remove' => 'settings#rolodex_remove', via: [:get, :post]
    match 'settings/rolodex_update' => 'settings#rolodex_update', via: [:get, :post]
    match 'settings/rolodex_visibility' => 'settings#rolodex_visibility', via: [:get, :post]

    get 'items/settings_index' => 'items#settings_index'
    match 'items/edit_list' => 'items#edit_list', via: [:get, :post]
    match 'items/edit' => 'items#edit', via: [:get, :post]
    match 'items/update' => 'items#update', via: [:get, :post]
    match 'items/remove' => 'items#remove', via: [:get, :post]
    match 'items/update_image' => 'items#update_image', via: [:get, :post]
    match 'items/create' => 'items#create', via: [:get, :post]
    match 'items/new' => 'items#new', via: [:get, :post]
    match 'items/list_options' => 'items#list_options', via: [:get, :post]
    get 'items/details_brief' => 'items#details_brief'

    get 'rolodex/:id' => 'rolodex#index'

    match 'search' => 'items#search', via: [:get, :post]

    get 'collection/:id' => 'collection#index'

    get 'condition/:id' => 'condition#index'

    match 'thingfields/fieldoptions_edit_list' => 'thingfields#fieldoptions_edit_list', via: [:get, :post]
    match 'thingfields/fieldoption_visibility' => 'thingfields#fieldoption_visibility', via: [:get, :post]
    match 'thingfields/fieldoption_edit' => 'thingfields#fieldoption_edit', via: [:get, :post]
    match 'thingfields/fieldoption_update' => 'thingfields#fieldoption_update', via: [:get, :post]
    match 'thingfields/fieldoption_insert' => 'thingfields#fieldoption_insert', via: [:get, :post]
    match 'thingfields/fieldoption_remove' => 'thingfields#fieldoption_remove', via: [:get, :post]
    match 'thingfields/create' => 'thingfields#create', via: [:get, :post]
    match 'thingfields/remove' => 'thingfields#remove', via: [:get, :post]
    match 'thingfields/update' => 'thingfields#update', via: [:get, :post]

    get 'fieldoptions/:id' => 'fieldoptions#index'

    # catch all route
    match '*path' => 'main#welcome', via: [:get, :post]

end
