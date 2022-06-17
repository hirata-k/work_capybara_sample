# work capybara sample

## Required

- jdk 16
- chromedriver
- ruby 3.0.0

## Usage

### download selenium server

https://www.selenium.dev/downloads/

### run selenium server

```
java -jar selenium-server-4.0.0-beta-4.jar standalone
```

### run sample

```
bundle install
```

```
bundle exec rspec example.rb
```

## 課題

Capybaraで、googleの検索エンジンで、「シャノン」と検索して、  
Googleの検索結果ページで「シャノン」のホームページが表示されることをテストしてください。

期待値の判定方法は、一番上の検索結果のタイトルに "シャノン" が含まれているかどうかで判定してください。

### Refernce
https://github.com/teamcapybara/capybara#the-dsl  
https://rubydoc.info/github/teamcapybara/capybara/master  
