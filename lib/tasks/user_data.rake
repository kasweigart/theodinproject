namespace :lessons do
  desc 'Print User Data'
  task print_completion_data: :environment do
    start_date, end_date = ENV["DATE_RANGE"].split('-')
    start_date = DateTime.parse(start_date)
    end_date = DateTime.parse(end_date)
    Course.all.each do |course|
      puts LessonCompletionDataSerializer.as_yaml(course, start_date, end_date)
    end
  end
end
