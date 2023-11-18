require 'rails_helper'

RSpec.describe Task, type: :model do
  it "é válido com atributos válidos" do
    task = Task.new(
      title: "Exemple Task",
      assignee: "John Doe",
      due_date: Date.today + 7,
      priority: "High"
    )
    expect(task).to be_valid
  end

  it "não é válido sem título" do
    task = Task.new(title: nil)
    expect(task).to_not be_valid
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
