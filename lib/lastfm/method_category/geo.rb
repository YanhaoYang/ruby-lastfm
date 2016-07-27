class Lastfm
  module MethodCategory
    class Geo < Base
      regular_method(
        :get_top_artists,
        :required => [:country],
        :optional => [
          [:limit, nil],
          [:page, nil]
        ]
      ) do |response|
        response.xml['topartists']['artist']
      end
    end
  end
end
