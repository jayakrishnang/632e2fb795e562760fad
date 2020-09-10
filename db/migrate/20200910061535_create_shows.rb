# frozen_string_literal: true

class CreateShows < ActiveRecord::Migration[5.2]
  def change
    create_table :shows do |t|
      t.references :channel, foreign_key: true, index: true
      t.string :name, index: true
      t.datetime :start_time

      t.timestamps
    end
  end
end
