class User
  attr_reader :_id, :url, :external_id, :name, :alias, :created_at, :active, :verified, :shared, :locale, :timezone,
              :last_login_at, :email, :phone, :signature, :organization_id, :tags, :suspended, :role

  def initialize(hash)
    @_id = hash['_id']
    @url = hash['url']
    @external_id = hash['external_id']
    @name = hash['name']
    @alias = hash['alias']
    @created_at = hash['created_at']
    @active = hash['active']
    @verified = hash['verified']
    @shared = hash['shared']
    @locale = hash['locale']
    @timezone = hash['timezone']
    @last_login_at = hash['last_login_at']
    @email = hash['email']
    @phone = hash['phone']
    @signature = hash['signature']
    @organization_id = hash['organization_id']
    @tags = hash['tags']
    @suspended = hash['suspended']
    @role = hash['role']
  end

  def keys
    %w[_id url external_id name alias created_at active verified shared locale timezone last_login_at email phone
       signature organization_id tags suspended role]
  end
end
