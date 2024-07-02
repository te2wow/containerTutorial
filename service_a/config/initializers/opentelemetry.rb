# config/initializers/opentelemetry.rb

require 'opentelemetry/sdk'
require 'opentelemetry/exporter/otlp'

# OpenTelemetryの初期化
OpenTelemetry::SDK.configure do |c|
  c.use_all() # すべての利用可能なインストルメントを使用

  c.add_span_processor(
    OpenTelemetry::SDK::Trace::Export::BatchSpanProcessor.new(
      OpenTelemetry::Exporter::OTLP::Exporter.new(
        endpoint: 'http://otel-collector-opentelemetry-collector.monitoring.svc.cluster.local:4317', # OpenTelemetry Collectorのエンドポイント
      )
    )
  )
end

tracer = OpenTelemetry.tracer_provider.tracer('example_tracer')

tracer.in_span('doing_work') do |span|
  # ここにトレースするコードを記述
  puts 'Doing some work...'
end
