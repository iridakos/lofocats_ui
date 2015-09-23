class User
  include Api::Resource

  attr_accessor :id

  attr_accessor :email

  attr_accessor :authentication_token

  attr_accessor :authentication_token_expires_at

  attr_accessor :admin

  attr_accessor :password

  attr_accessor :password_confirmation

  validates :email, :presence => true

  def attributes
    { :email => nil,
      :password => nil,
      :password_confirmation => nil,
      :admin => nil }
  end

  class << self
    def all
      execute(:get, '/api/users').map{ |u| User.new(u) }
    end

    def find(id)
      User.new(execute(:get, "/api/users/#{id}"))
    end
  end

  def save
    if id.present?
      self.class.execute(:put, "/api/users/#{id}", :user => self.serializable_hash)
    else
      response = self.class.execute(:post, '/api/users', :user => self.serializable_hash)
      self.id = response[:id]
    end
    true
  rescue RestClient::UnprocessableEntity => exception
    add_errors_to_resource(exception, self)
    false
  end

  def persisted?
    id.present?
  end

  def destroy
    self.class.execute(:delete, "/api/users/#{id}")
  end
end
