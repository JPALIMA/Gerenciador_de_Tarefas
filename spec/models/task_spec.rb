require 'rails_helper'

RSpec.describe Task, type: :model do
 
  it 'é válido com atributos válidos' do
    user = User.create(email: 'joao@exemplo.com', password: 'senha')
    task = Task.new(
      title: 'Exemplo Task',
      due_date: Date.new(2023, 11, 25), # Use a data válida
      priority: 'alta',
      user: user # Associando a tarefa ao usuário
    )
    expect(task).to be_valid
  end

  it "não é válido sem título" do
    task = Task.new(due_date: Date.new(2023, 11, 25), priority: 'alta' )
    expect(task).to_not be_valid
  end

  it "não é válido sem data de vencimento" do
    task = Task.new(title: 'Exemplo Task', priority: 'alta')
    expect(task).to_not be_valid
  end

  it "não é válido sem prioridade" do
    task = Task.new(title: 'Exemplo Task', due_date: Date.new(2023, 11, 25))
    expect(task).to_not be_valid
  end
end