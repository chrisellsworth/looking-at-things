LookingAtThings::App.controllers :thing do
  get '/:thing' do |thing|
    content_type :json
    Thing.where('summary ilike ?', "%#{thing}%").pluck(:summary, :image_url).to_json
  end

  post '/slack' do
    content_type :json

    query = params['text']
    thing = Thing.where('summary ilike ?', "looking at %#{query}%").order("RANDOM()").first

    if thing
      {
        response_type: "in_channel",
        attachments: [
          text: thing.summary,
          image_url: thing.image_url
        ]
      }.to_json
    else
      {
        text: "There is no #{query} to look at."
      }.to_json
    end
  end
end
