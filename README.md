cl-analytics
============

Application for end-user facing analytics and data downloads


First-time Setup
================

 -Add a new database called `analytics_master` to your util (vagrant) postgresql server. This can be done by running `createdb -h util.local -p 6432 -U postgres -E UTF8 -T template0 analytics_master` while you are SSH'd into util

 -Create a virtualenv for the project. Once you have virtualenv and virtualenvwrapper installed you can simply `mkvirtualenv analytics_site`

 -Install the python package dependencies: `pip install -r requirements.txt`

 -Browse to the python project root: `cd cl_analytics/`

 -To create the database tables: `python manage.py syncdb`

 -To insert a sample data set: `python manage.py sample_data`

 -Now you should be ready to run the site locally. You can either `python runserver.py` or `python manage.py runserver` and then browse to http://127.0.0.1:5000/
