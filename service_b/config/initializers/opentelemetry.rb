require 'opentelemetry/sdk'
require 'opentelemetry/instrumentation/all'
OpenTelemetry::SDK.configure do |c|
  c.service_name = 'service-b'
  c.use_all() # enables all instrumentation!
end
