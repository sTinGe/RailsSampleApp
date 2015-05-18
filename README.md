# Ruby on Rails Tutorial: sample application
This is the sample application for
the [*Ruby on Rails Tutorial*](http://railstutorial.org/)
by [Michael Hartl](http://michaelhartl.com/).

Modified by Stinge Su.

My rails is `4.2.1`, ruby is `2.1.2`

You may be counter some problems in this sample application.


- **1. Rspec can not be bundled**
- 

   `'require': cannot load such file -- rails_helper`<br>
    step 1 :<br>
    add `config.include Capybara::DSL` to spec_helper.rb<br>
    include Capybara to use `visit` method<br><br>
    step 2 :<br>
    modify your Gemfile
    `gem 'selenium-webdriver', '~>2.35.1'`<br>
    your selenium-webdriver version need to be upgraded.<br><br>
    step 3 :<br>
    using `GET`  method in config/rounter.rb<br>
    `get '/home' => 'static_pages#home'` redirct localhost:3000/home<br><br>
    step 4 :<br>
    modify your `config/environment/development.rb` `production.rb`. `test.rb`
    from `Rails.application.configure` to `YourAppName::Aplication.configure`
    
    
    
    
    