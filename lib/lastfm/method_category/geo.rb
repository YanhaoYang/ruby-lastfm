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
      )
    end
  end
end
