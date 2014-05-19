WmslWorldCup
============

WmslWorldCup

Installation on windows

1. install ruby 2.0.0 --> http://rubyinstaller.org/downloads/

2. install dev-kit --> https://github.com/oneclick/rubyinstaller/wiki/Development-Kit

3. install git --> http://git-scm.com/downloads

4. clone WmslWorldCup from github --> https://github.com/apache13/WmslWorldCup

5. create file \config\initializers\secret_token.rb
 
6. generate secret key by rake secret > key.txt

7. Add WmslWorldCup::Application.config.secret_token = '[secret_key]' to secret_token.rb (secret key from key.txt)

8. rake db:create

9. rake db:migrate

10. rake db:seed

11. rails server

