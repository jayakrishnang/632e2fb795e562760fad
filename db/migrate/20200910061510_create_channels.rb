# frozen_string_literal: true

class CreateChannels < ActiveRecord::Migration[5.2]
  def change
    create_table :channels do |t|
      t.string :name, index: true

      t.timestamps
    end
  end
end
