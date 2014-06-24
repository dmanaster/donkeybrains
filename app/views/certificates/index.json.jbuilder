json.array!(@certificates) do |certificate|
  json.extract! certificate, :id, :name, :institution, :reason
  json.url certificate_url(certificate, format: :json)
end
