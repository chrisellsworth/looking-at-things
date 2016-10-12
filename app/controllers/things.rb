LookingAtThings::App.controllers :things do
  get :index do
    content_type :json
    Thing.all.pluck(:summary).to_json
  end

  get '/anything' do
    content_type :json
    Thing.any.serializable_hash.to_json
  end

  get '/:thing' do |query|
    content_type :json
    thing = Thing.matching(query)

    if thing
      thing.serializable_hash.to_json
    else
      status 404
      "There is no #{query} to look at."
    end
  end
end
