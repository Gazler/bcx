# ## HTTP Client
# 
# Provides a client to access the Basecamp Next API using HTTP authentication
#
#
# Example:
#
#     client = Bcx::Client::HTTP.new(login: 'username', password: 'secret')
#
module Bcx
  module Client
    class HTTP < Rapidash::Client
      method :http

      extension :json
      encode_request_with :json

      raise_errors

      resource :projects, class_name: 'Bcx::Resources::Project'
      resource :todolists, class_name: 'Bcx::Resources::Todolist'
      resource :people, class_name: 'Bcx::Resources::Person'

      def initialize(options = {})
        @account = Bcx.configuration.account
        @api_version = Bcx.configuration.api_version

        self.class.site("https://basecamp.com/#{@account}/api/#{@api_version}/")

        super(options)
      end
    end
  end
end
