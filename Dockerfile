# Imagine this file as a recipe for setting up a virtual computer.

# Dockerfiles typically start with a 'base image'. There are loads of these
# and you can find them at hub.docker.com.
# We're going to use a base image for Python veresion 3.11
FROM python:3.11

# set a directory for the app
WORKDIR /usr/src/app

# copy all the files to the container
COPY . .

# This base image contains essentially everything necessary for a 'virtual
# computer'. It has a terminal, certain basic commands, and of course Python.

# We run a command to install `pipenv`
RUN pip install pipenv

# We run `pipenv install` to install our project's dependencies. Since we've
# copied in our `Pipfile`, `pipenv` will use that to get a list of dependencies.
# We include a couple of extra options suitable for deployment.
RUN pipenv install --system --deploy

# At this point we've set up our virtual computer, but we've not _yet_ run our
# application. And we're not going to! We're just setting up the container
# so that it's ready to do so when we tell it.

# tell the port number the container should expose
EXPOSE 5000

# So we're going to tell Docker here that when we _do_ want to run it, this is
# what it should run:
CMD ["python", "app.py"]
