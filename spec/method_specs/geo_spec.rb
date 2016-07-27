require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe '#geo' do
  before { init_lastfm }

  it 'should return an instance of Lastfm::Geo' do
    @lastfm.geo.should be_an_instance_of(Lastfm::MethodCategory::Geo)
  end

  describe '#get_top_artists' do
    it 'should get top artists' do
      @lastfm.should_receive(:request).with('geo.getTopArtists', {
        :country => 'spain',
        :limit => 5,
        :page => nil
      }).and_return(make_response('geo_get_top_artists'))

      data = @lastfm.geo.get_top_artists(:country => 'spain', limit: 5)
      topartists = data['topartists']
      topartists['page'].should == '1'
      topartists['perPage'].should == '5'
      topartists['total'].should == '369711'
      topartists['totalPages'].should == '73943'
      artists = topartists['artist']
      artists.size.should == 5
      artists[0]['name'].should == 'David Bowie'
      artists[0]['listeners'].should == '3101908'
      artists[0]['image'].size.should == 5
      artists[0]['image'][0]['size'].should == 'small'
    end
  end
end
