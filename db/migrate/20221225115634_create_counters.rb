class CreateCounters < ActiveRecord::Migration[7.0]
  def change
    create_table :counters do |t|
      t.datetime :end_date
      t.string :text

      t.timestamps
    end
  end
end
