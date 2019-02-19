Selenium::WebDriver::Chrome.driver_path="browser-driver/chromedriver.exe"

Before do
    @driver = Selenium::WebDriver.for :chrome
end

Dado("o usuário entrar no site do Google") do
    @driver.get "http://www.google.com"
    @driver.manage.window.maximize
end
  
Quando("digitar na barra a palavra {string}") do |string|
    @driver.find_element(xpath: '//*[@id="tsf"]/div[2]/div/div[1]/div/div[1]/input').send_keys('queijo')
    @driver.action.send_keys("\n").perform
end
  
Então("deverá ser realizada uma pesquisa onde no título da página esteja a palavra {string}") do |string|
    @driver.title.include?("queijo")
end

After do
    @driver.quit
end