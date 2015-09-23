class CatEntry
  include Api::Resource

  attr_accessor :id

  attr_accessor :breed

  attr_accessor :photo_url

  attr_accessor :longitude

  attr_accessor :latitude

  attr_accessor :color

  attr_accessor :event_date

  attr_accessor :entry_type

  attr_accessor :contact_email

  attr_accessor :contact_phone

  attr_accessor :resolved

  attr_accessor :chip

  attr_accessor :user

  def attributes
    {:breed => nil,
     :photo_url => nil,
     :longitude => nil,
     :latitude => nil,
     :color => nil,
     :event_date => nil,
     :entry_type => nil,
     :contact_email => nil,
     :contact_phone => nil,
     :resolved => nil,
     :chip => nil}
  end

  class << self
    def all
      execute(:get, '/api/cat_entries').map { |ce| CatEntry.new(ce) }
    end

    def find(id)
      CatEntry.new(execute(:get, "/api/cat_entries/#{id}"))
    end
  end

  def save
    if id.present?
      self.class.execute(:put, "/api/cat_entries/#{id}", :cat_entry => self.serializable_hash)
    else
      response = self.class.execute(:post, '/api/cat_entries', :cat_entry => self.serializable_hash)
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

  def user_id
    user.presence[:id]
  end

  def destroy
    self.class.execute(:delete, "/api/cat_entries/#{id}")
  end
end
