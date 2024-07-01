# config/initializers/opentelemetry.rb

require 'opentelemetry/sdk'
require 'opentelemetry/exporter/otlp'

# OpenTelemetryの初期化
OpenTelemetry::SDK.configure do |c|
  c.use_all() # すべての利用可能なインストルメントを使用

  c.add_span_processor(
    OpenTelemetry::SDK::Trace::Export::BatchSpanProcessor.new(
      OpenTelemetry::Exporter::OTLP::Exporter.new(
        endpoint: 'http://otel-collector-opentelemetry-collector.monitoring:4317', # OpenTelemetry Collectorのエンドポイント
        insecure: true
      )
    )
  )
end
