class AddSubmitterToNickname < ActiveRecord::Migration
  def change
    add_column :nicknames, :submitter, :string
  end
end
