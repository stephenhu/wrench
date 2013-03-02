#wrench

a tool for ruby web development

## features

* create skeleton app for ruby web development
* download assets such as bootstrap, jqueryui, glyphicons
* add new assets
* extensible templates

## requirements

* bundler
* colorize
* thor
* zip

*wrench has been tested against ruby 1.9.2-p290*

## installation

### gem package

1.  install gem from rubygems
```gem install wrench-0.0.2.gem```

### from source

1.  clone the repository
```git clone git@github.com:stephenhu/wrench```
2.  install dependencies
```bundle install # from the wrench directory```
3.  build the gem
```gem build wrench.gemspec # from the wrench directory```
4.  install the local gem
```gem install wrench-0.0.2.gem```

## testing

* wrench has been tested against ruby 1.9.2-p290
## faq

1.  how do i customize wrench?
```inside of the wrench/conf/config.yaml file, you can add assets, customize
the project structure, and add/remove templates.  template files are found in
wrench/lib/wrench/templates and stored as erbs.  at this point a wrench
gem will need to be rebuilt or the local wrench gem repository will need to
be modified for any customization.  there are plans to provide wrench
customization without having to modify the core source and rebuild gems in
the next iteration.``` 
2.  why wrench, doesn't rails essentially do the same thing?
```rails, bundler, and many other projects also help to create skeletal apps
for easier and DRYer development.  while these are great tools, i needed
something simpler and more flexible which is how wrench came to be.```

## feature requests

* i'd love to hear your feedback so for all feature requests, please either
create a github issue or send mail to <epynonymous@outlook.com>.

