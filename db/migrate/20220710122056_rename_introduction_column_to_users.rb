class RenameIntroductionColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :Introduction, :introduction
    rename_column :books, :comment, :body
  end
end
