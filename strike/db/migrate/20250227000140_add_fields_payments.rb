class AddFieldsPayments < ActiveRecord::Migration[7.1]
  def change
    add_column :payments, :amount, :decimal, precision: 10, scale: 2
    add_column :payments, :description, :string
  end
end
