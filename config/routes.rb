Rails.application.routes.draw do
  resources :answers,only:[:create,:destroy,:ans]
  resources :questions,only:[:create,:destroy]
  get 'answers/ans'
  resources :questions,only:[:create,:destroy]
  get 'home/index'
  get 'home/profile'
  post 'home/upload_image'=>'home#upload_image'
  devise_for :users
  get 'home/index'
  get '/user'=>"home#user"
  post '/follow'=>'home#follow'
  post '/unfollow'=>'home#unfollow'
  get '/newquestions'=>'home#newquestions'
  get '/topstories'=>'home#topstories'
  post '/answers/ans'=>'answers#ans'
  post '/upvote/upvote'=>'upvote#upvote'
  post '/upvote/upvote_answer'=>'upvote#upvote_answer'
  post '/answers/readextra'=>'answers#readextra'
  get '/answers/answers_show'=>'answers#answers_show'
  root to: "home#index"
  get '/myquestions'=>"home#myquestions"
  get '/myanswers'=>"home#myanswers"
  get '/comments/docomment'=>'comments#docomment'
  post 'comments/createcomment'=>'comments#createcomment'
  get 'comments/showcomments'=>'comments#showcomments'
  get 'comments/loadmore'=>'comments#loadmore'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
