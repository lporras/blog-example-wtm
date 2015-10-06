require 'csv'

namespace :import do

  desc "Import Post using csv file"

  task "posts" => :environment do
    filename = File.join Rails.root, "fixtures", "posts.csv"
    CSV.foreach(filename, headers: true) do |row|
      p row
      title = row['title']
      body = row['body']
      p title
      p body
    end
  end

end