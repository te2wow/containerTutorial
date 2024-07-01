# config/schedule.rb

every 1.minute do
    runner "MyModel.log_message"
  end
  