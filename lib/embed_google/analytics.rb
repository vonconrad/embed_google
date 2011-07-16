module EmbedGoogle
  class Analytics
    class << self
      attr_accessor :id
    end

    attr_accessor :account_id

    def initialize(id=nil, options={})
      self.account_id = id || self.class.id
      raise ArgumentError, 'Account ID is required' unless account_id
    end

    def script
      str  = "var _gaq = _gaq || [];\n"
      str += "_gaq.push(['_setAccount', '#{account_id}']);\n"
      str += "_gaq.push(['_trackPageview']);\n\n"
      str += "(function() {\n"
      str += "  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;\n"
      str += "  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';\n"
      str += "  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);\n"
      str += "})();\n"
      "<script type='text/javascript'>\n" + str + "</script>\n"
    end
  end
end
