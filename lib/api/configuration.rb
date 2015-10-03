require 'rest-client'

module Api
  # Class keeping information on the way of reacting with the LofoCats API
  class Configuration
    cattr_accessor :url
    cattr_accessor :version
    cattr_accessor :current_authentication_token
    
    class << self
      def api
        @api ||= initialize_resource
      end

      private

      def initialize_resource
        # Create a resource pointing to the LofoCats API, setting the desired version to the respective header.
        RestClient::Resource.new(url, headers: { accept: "application/vnd.lofocats.v#{version}, application/json" })
      end
    end
  end
end
