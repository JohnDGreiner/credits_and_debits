json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :organization, :is_credit, :amount
  json.url transaction_url(transaction, format: :json)
end
