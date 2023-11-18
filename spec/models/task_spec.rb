require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:user) { User.create(username: 'joao', email: 'joao@examplo.com', password: 'senha') }

  it 'é válido com atributos válidos' do
    task = Task.new(
      title: 'Exemple Task',
      assignee: 'joao',
      due_date: '25-11-2023', # Certifique-se de ajustar a data conforme necessário
      priority: 'alta',
      user: user
    )
    expect(task).to be_valid
  end

  it "não é válido sem data de vencimento" do
    task = Task.new(due_date: nil)
    expect(task).to_not be_valid
  end

  it "não é válido sem prioridade" do
    task = Task.new(priority: nil)
    expect(task).to_not be_valid
  end
end
