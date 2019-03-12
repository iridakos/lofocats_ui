require 'prometheus/middleware/collector'
require 'prometheus/middleware/exporter'

Rails.application.middleware.unshift Prometheus::Middleware::Collector
Rails.application.middleware.unshift Prometheus::Middleware::Exporter
