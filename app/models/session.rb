class Session
  include Api::Resource

  attr_accessor :email

  attr_accessor :password

  validates_presence_of :email, :password

  def attributes
    { :email => nil,
      :password => nil }
  end

  class << self
    def destroy
      execute(:delete, '/api/sessions')
    end
  end

  def persisted?
    false
  end

  def create
    self.class.execute(:post, '/api/sessions', :session => self.serializable_hash)
  end
end
