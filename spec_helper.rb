require "rspec"
require_relative "example_driver"

RSpec.configure do |config|
  # Rspec内でCapybara::DSLを使用出来るようにincludeする
  # spec_helper内でincludeすると、実行時に以下のようにメッセージが表示される
  # including Capybara::DSL in the global scope is not recommended!
  config.include Capybara::DSL

  # Rspec実行中にエラーが発生した時、実行終了後に赤色でエラー内容を表示する
  config.failure_color = :red

  # Rspec実行中にエラーが発生した時、停止せずに最後までスペックを実行する
  config.fail_fast = false

  # Rspecの実行結果を標準出力へカラーで出力する
  config.color = true

  # Rspecが実行結果を出力する時のフォーマットを指定して見やすくする (Default: :progress)
  config.formatter = :documentation

end
