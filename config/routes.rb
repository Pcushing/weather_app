WeatherApp::Application.routes.draw do
  root to: "static#home"
  match "/receiver", to: "static#receiver"
  
  resources :messages, :users, :contacts
end
