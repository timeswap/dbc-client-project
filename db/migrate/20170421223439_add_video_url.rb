class AddVideoUrl < ActiveRecord::Migration[5.0]
  def change
    add_column :films, :video_url, :text
  end
end
