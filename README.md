# dockerchallenge01
Pick a Linux command line game (e.g. from this list https://linoxide.com/linux-how-to/linux-command-line-games/) and deploy it in a docker container.

docker build . -t vitetris:0.58.0

docker run -it vitetris:0.58.0 tetris
