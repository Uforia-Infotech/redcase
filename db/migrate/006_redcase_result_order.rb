
class RedcaseResultOrder < Rails.version < '5.1' ? ActiveRecord::Migration : ActiveRecord::Migration[4.2]

  def self.up
    add_column :execution_results, :order, :integer, :unique => true
    res = ExecutionResult.find_by(name: 'Not Run')
    res.destroy if res
    res = ExecutionResult.find_by(name: 'Passed')
    res.order = 1
    res.save
    res = ExecutionResult.find_by(name: 'Failed')
    res.order = 2
    res.save
    res = ExecutionResult.find_by(name: 'Blocked')
    res.order = 3
    res.save
    res = ExecutionResult.find_by(name: 'Not Available')
    res.order = 4
    res.save
  end

  def self.down
    remove_column :execution_results, :order
    ExecutionResult.create(:name => 'Not Run')
  end

end
