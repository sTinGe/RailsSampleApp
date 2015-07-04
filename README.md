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

<br>
    
- **2. Guard can not find class**
-
`ERROR - Could not load 'guard/rspec'`<br>
`cannot load such file -- guard/guard (LoadError)`<br>
step 1:<br>
check your capybara version in Gemfile
make sure it's version is more than `2.2.0`<br>
or even <font color=red>delete</font> the description of capybara

step 2:<br>
`bundle update`

step 3:<br>
`bundle exec guard`

<br>

- **3. Spork server causes a Exception**
-
`Exception encountered: #<ActiveRecord::ConnectionNotEstablished: ActiveRecord::ConnectionNotEstablished>`<br>
`#<NameError: uninitialized constant RSpec::Core::CommandLine>`<br>
step 1:<br>
check your `spec_helper.rb` is the same as <a href="https://github.com/railstutorial/sample_app_rails_4/blob/master/spec/spec_helper.rb">this</a><br>
<br>

step 2:<br>
add the support file to spork<br>
`mkdir spec/support`
and add the support file called `spork_patch.rb` like <a href="https://gist.github.com/denispeplin/408d6bb894d5a546aa69">this</a><br>
<br>

step 3:<br>
restart spork server.<br>`bundle exec spork` <br>

step 4:<br>
`bundle exec rspec spec/requests/static_pages --drb` in new window 


- **4. Named routes in Rspec could not work**
-  
`undefined local variable or method 'XXX_path' ` if you not defined named routes in rspec_helper
you just add this line:

`config.include Rails.application.routes.url_helpers`

    
<br> 
- **5. RSpec be_false error**
-
`expected false to respond to 'false?'`
<br>using `bcrypt-ruby 3.0.1` for password validation need to notice there are some differences in <font color=red>RSpec 3.0</font><br>
please change `be_true/befalse` to `be_truthly/be_falsey`
