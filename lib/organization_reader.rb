require 'json'
require_relative 'organization'

class OrganizationReader
  def read_organizations(filename)
    array = JSON.parse(File.read(filename))
    array.map { |hash| Organization.new(hash) }
  end
end
