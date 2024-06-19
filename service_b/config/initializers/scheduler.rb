require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

STRINGS = ["大吉", "中吉", "吉", "凶"]

# クラス変数の初期値を設定
$random_string = STRINGS.sample

scheduler.every '10s' do
  $random_string = STRINGS.sample
end
