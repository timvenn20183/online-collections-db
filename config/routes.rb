Ocd::Application.routes.draw do

    root :to => 'main#index'

    match 'collection/:id' => 'virtualcollection#index'
   	match 'platform/:id' => 'platform#index'

end
