receivers:
  otlp:
    protocols:
      grpc:
        endpoint: 0.0.0.0:${grpc_port}

processors:
  batch/metrics:
    timeout: 60s

exporters:
  logging:
    loglevel: debug
  otlphttp:
    metrics_endpoint: "https://${mock_endpoint}"
    insecure: true

service:
  pipelines:
    metrics:
      receivers: [otlp]
      exporters: [otlphttp]