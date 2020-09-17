Quando('faço o retrieve') do
  @response = retrieve.retrieve_all
end

Entao('valido o retrieve') do
  expect(@response.code).to eql 200
  expect(@response[0]['id']).not_to be_empty
  expect(@response[0]['nome']).not_to be_empty
  expect(@response[0]['descricao']).not_to be_empty
  expect(@response[0]['preco']).not_to be_empty
end