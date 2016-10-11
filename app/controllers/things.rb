LookingAtThings::App.controllers :things do
  get :index do
    content_type :json
    Thing.all.pluck(:summary).to_json
  end
end
