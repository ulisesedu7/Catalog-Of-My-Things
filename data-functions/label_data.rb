require_relative '../methods/label'
require_relative '../utils/update_file'

def save_labels(labels)
  labels_data = []

  labels.each do |label|
    labels_data.push({
                       title: label.title,
                       color: label.color
                     })
  end
  update_file('labels', labels_data)
end

def load_labels
  loaded_labels = []

  unless File.zero?('./data-storage/labels.json')
    labels_file = File.open('./data-storage/labels.json')
    hash_labels = JSON.parse(labels_file.read)
  end

  unless hash_labels.empty?
    hash_labels.each do |label|
      loaded_labels << Label.new(label['title'], label['color'])
    end
    labels_file.close
  end

  loaded_labels
end
