class Ticket
  attr_reader :_id, :url, :external_id, :created_at, :type, :subject, :description, :priority, :status, :submitter_id,
              :assignee_id, :organization_id, :tags, :has_incidents, :due_at, :via

  def initialize(hash)
    @_id = hash['_id']
    @url = hash['url']
    @external_id = hash['external_id']
    @created_at = hash['created_at']
    @type = hash['type']
    @subject = hash['subject']
    @description = hash['description']
    @priority = hash['priority']
    @status = hash['status']
    @submitter_id = hash['submitter_id']
    @assignee_id = hash['assignee_id']
    @organization_id = hash['organization_id']
    @tags = hash['tags']
    @has_incidents = hash['has_incidents']
    @due_at = hash['due_at']
    @via = hash['via']
  end

  def keys
    %w[_id url external_id created_at type subject description priority status submitter_id assignee_id
       organization_id tags has_incidents due_at via]
  end
end
