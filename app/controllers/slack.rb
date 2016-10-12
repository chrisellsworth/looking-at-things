LookingAtThings::App.controllers :slack do
  get :index do
    content_type :json

    query = params['text']

    thing = if query == 'anything'
              Thing.any
            else
              Thing.matching(query)
            end

    if thing
      {
        response_type: 'in_channel',
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
