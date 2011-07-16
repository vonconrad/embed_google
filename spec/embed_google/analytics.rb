require 'spec_helper'

describe EmbedGoogle::Analytics do
  it 'refuses to initiate without an account id' do
    lambda { EmbedGoogle::Analytics.new }.should raise_error('Account ID is required')
  end

  it 'uses a prespecified account id' do
    EmbedGoogle::Analytics.id = 'UA-1234567-1'

    instance = EmbedGoogle::Analytics.new
    instance.account_id.should == 'UA-1234567-1'
  end

  it 'overwrites a prespecified account id' do
    EmbedGoogle::Analytics.id = 'UA-1234567-1'

    instance = EmbedGoogle::Analytics.new('UA-1234567-2')
    instance.account_id.should == 'UA-1234567-2'
  end
end
