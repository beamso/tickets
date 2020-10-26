class Organization
  attr_reader :_id, :url, :external_id, :name, :domain_names, :created_at, :details, :shared_tickets, :tags

  def initialize(hash)
    @_id = hash['_id']
    @url = hash['url']
    @external_id = hash['external_id']
    @name = hash['name']
    @domain_names = hash['domain_names']
    @created_at = hash['created_at']
    @details = hash['details']
    @shared_tickets = hash['shared_tickets']
    @tags = hash['tags']
  end

  def keys
    %w[_id url external_id name domain_names created_at details shared_tickets tags]
  end
end
