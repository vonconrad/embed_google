require 'embed_google/analytics'

module EmbedGoogle
  unless const_defined?(:VERSION)
    VERSION = '0.0.1'
  end

  def self.analytics(id=nil, options={})
    Analytics.new(id, options).script
  end
end
