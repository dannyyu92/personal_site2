himynameisdanny v2
================================

*View the [live site](http://himynameisdanny.com).*

This github repository contains the source code for my personal portfolio site
with integrated blog.


It includes
-------------------------

Front End:
* ZURB Foundation 4
* Foundation Icons

APIs:
* Twilio API for SMS messaging straight to my phone (check out the about page!)

Background Workers:
* Sidekiq to send SMS messages asynchronously
* Unicorn Rack HTTP Server (to use one dyno for multiple workers on Heroku)
* Redis/ RedisToGo

Authentication:
* Sorcery for admin authentication

Blog-related:
* Disqus-powered comments
* Paperclip for image uploading
* Amazon S3 for file hosting

Other:
* Figaro for easy ENV var handling

Soon to add:
------------------------

* ElasticSearch functionality
