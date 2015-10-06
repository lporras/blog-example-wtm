require 'csv'

namespace :import do

  desc "Import posts using a CSV file"
  task "posts" => :environment do
    puts Post.count
    filename = File.join(Rails.root, "fixtures", "posts.csv")
    CSV.foreach(filename, headers: true) do |row|
      #title, body = row
      p row
      #title = row[0]
      #body = row[1]
      Post.create(row.to_hash)
    end
  end

end