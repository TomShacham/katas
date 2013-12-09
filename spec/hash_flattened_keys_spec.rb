require 'hash_flattened_keys'

describe 'flattened_keys' do

  let(:unnested_hash) { {name: :tom} }
  let(:nested_hash) { {:name => {:tom => {:age => {today: 22} } }, :school => { :makers => :academy} } }

  context 'flattened_keys' do

    it 'returns the passed hash if no values are hashes' do
      expect(flattened_keys(unnested_hash)).to eq({name: :tom})
    end

    it 'joins all nested hash keys to parent' do
      expect(flattened_keys(nested_hash)).to eq({:name_tom_age_today => 22,:school_makers => :academy })
    end

  end

end