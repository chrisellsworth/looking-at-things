LookingAtThings::App.controllers :thing do
  get '/:thing' do |thing|
    content_type :json
    Thing.where('summary ilike ?', "looking at %#{thing}%").to_json
  end
end
