# The cache store will be used as a session store.
# https://github.com/rails/rails/issues/29489
if ENV.has_key?('REDIS_URL')
  Rails.cache = ActiveSupport::Cache.lookup_store(
    :redis_store,
    "#{ENV['REDIS_URL']}",
    { expires_in: 3.days }
  )
else
  Rails.cache = ActiveSupport::Cache.lookup_store(:memory_store)
end
