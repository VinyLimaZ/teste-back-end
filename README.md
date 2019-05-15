## iCasei back[front]-end test

Hi, my name is Vinicius and I'll guide you to put all this to work. Let's go.

If you only want to test the application and see if it's working (on my machine
works lol), access this URL:

Access this to generate accesses, create a UUID (guid) on the API and see how
beautiful is the materialize template that I used
(iCasei site example)[https://icasei-static-site.herokuapp.com/contact.html]

When you get tired of play, you can see the access report on the 'dashboard'

(iCasei backend access report)[https://icasei-backend-teste.herokuapp.com/access_report.html]

If you like to live wild you can deploy on your machine and play on the hard
mode, let's do this!

At first you need to have installed on your machine some progs, I can't cover
all the steps, but every item has your own doc, so feel free to look and follow
the instructions there.

You need to have:

- Docker + docker-compose
- and that's all (easy hm?)

After this clone the project on you machine

- `git clone https://github.com/VinyLimaZ/teste-back-end`

Access the folder created and run:

- `docker-compose up`

This will run the project and put up the server, after this you just need to
open your browser and access:

- http://localhost:3000/

Locally you have the static site as routes of the API, so you can access
`localhost:3000/about.html` to see the about page, you have the navbar to help
you with this job.

