require 'api/configuration'
require 'api/resource'

# Load the Api Configuration
configuration = YAML.load(ERB.new(File.read("#{Rails.root}/config/api.yml")).result)[Rails.env]

# Set the URL and the desired API version to be used.
Api::Configuration.url = configuration['url']
Api::Configuration.version = configuration['version']
