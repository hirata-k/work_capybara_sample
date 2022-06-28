require "selenium/webdriver"
require 'capybara/rspec'

DRIVER = :edge

Capybara.configure do |config|
  # 参照: http://www.rubydoc.info/github/jnicklas/capybara/Capybara.configure

  # DSL Options:
  config.default_driver = DRIVER
  config.javascript_driver = DRIVER

  # Configurable options:
  config.run_server = false            # ローカルのRack Serverを使用しない (Default: true)
  config.default_selector = :css       # デフォルトのセレクターを`:css`または`:xpath`で指定する (Default: :css)
  config.default_max_wait_time = 5     # Ajaxなどの非同期プロセスが終了するまで待機する最大秒数 (seconds, Default: 2)
  config.ignore_hidden_elements = true # ページ上の隠れた要素を無視するかどうか (Default: true)
  config.save_path = Dir.pwd           # save_(page|screenshot), save_and_open_(page|screenshot)を使用した時にファイルが保存されるパス (Default: Dir.pwd)
  config.automatic_label_click = false # チェックボックスやラジオボタンが非表示の場合に関連するラベル要素をクリックするかどうか (Default: false)
end

    def browser
      (ENV['browser'] || 'chrome').to_sym
    end

    def options
      browser_str = browser.to_s
      self.send("#{browser_str}_options")
    end

    def chrome_options
      options = Selenium::WebDriver::Chrome::Options.new
      options.add_argument('start-maximized')
      options.add_argument('disable-infobars')
      options.add_argument('disable-gpu')
      options.add_argument('privileged')
      options.add_argument('ignore-certificate-errors')
      options.add_argument('no-default-browser-check')
      options
    end

    def edge_options
      options = Selenium::WebDriver::Edge::Options.new
      options.add_argument('start-maximized')
      options.add_argument('disable-infobars')
      options.add_argument('disable-gpu')
      options.add_argument('privileged')
      options.add_argument('ignore-certificate-errors')
      options.add_argument('no-default-browser-check')
      options
    end

    def firefox_options
      options = Selenium::WebDriver::Firefox::Options.new
      options
    end

    def caps
      browser_str = browser.to_s
      caps = Selenium::WebDriver::Remote::Capabilities.send(browser_str)
      caps
    end

Capybara.register_driver DRIVER do |app|

  endpoint = 'http://localhost:4444/wd/hub'

  # ブラウザーを起動する
  Capybara::Selenium::Driver.new(
    app,
    browser: :remote,
    url: endpoint,
    capabilities: [caps, options]
  )
end
  
