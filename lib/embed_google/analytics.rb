module EmbedGoogle
  class Analytics
    class << self
      attr_accessor :id
    end

    attr_accessor :account_id

    def initialize(id=nil, options={})
      self.account_id = id || self.class.id
    end
  end
end

