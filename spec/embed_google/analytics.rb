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

  it 'returns the simplest variation of Analytics javascript' do
    javascript = EmbedGoogle::Analytics.new('UA-1234567-1').script
    javascript.should == <<-SCRIPT
<script type='text/javascript'>
var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-1234567-1']);
_gaq.push(['_trackPageview']);

(function() {
	var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();
</script>
SCRIPT
  end
end
