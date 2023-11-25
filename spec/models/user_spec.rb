require 'rails_helper'

RSpec.describe User, type: :model do
  it 'é válido com atributos válidos' do
    user = User.new(
      username: 'joao',
      email: 'joao@exemplo.com',
      password: 'senha'
    )
    expect(user).to be_valid
  end

  it 'não é válido sem um e-mail' do
    user = User.new(username: 'joao', password: 'senha')
    expect(user).to_not be_valid
  end

  # Adicione mais exemplos conforme necessário

  # Remova a pendência
  pending "adcione alguns exemplos a (ou exclua) #{__FILE__}"
end
