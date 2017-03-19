plexurl
=======

Browse Plex from CLI. Returns transcoding streaming urls to stdout

Usage
-----

    usage: plexurl [-h] [-m] [-d] [-c] [-s] [--name NAME] [-e EPISODE] [-S SERVER]
                   [-u USERNAME] [-p PASSWORD] [--servername SERVERNAME]
                   [-r RESOLUTION]

    optional arguments:
      -h, --help            show this help message and exit
      -m, --movie           Specify movie.
      -d, --direct          Direct download. Default returns a transcode url
      -c, --curl            curl output. Default off.
      -s, --show            Specify show.
      --name NAME           Name of movie or show. Use with -m or -s respectively.
                            Omit to produce listing
      -e EPISODE, --episode EPISODE
                            Specify episode. Get list of episodes by specifying
                            show. Supports either full episode name (which may
                            conflict) or SnnEnn (i.e S12E34)
      -S SERVER, --server SERVER
                            Specify server. Defaults to http://127.0.0.1:32400
                            $PLEX_SERVER
      -u USERNAME, --username USERNAME
                            Specify username. Used for Plex authentication.
                            $PLEX_USERNAME
      -p PASSWORD, --password PASSWORD
                            Specify password. Provided for convenience only,
                            preferred method is to omit this and enter password at
                            the prompt. $PLEX_PASSWORD
      --servername SERVERNAME
                            Specify server name. Used with -u above, for Plex
                            authentication. $PLEX_SERVERNAME
      -r RESOLUTION, --resolution RESOLUTION
                            Specify resolution. Should be of format WIDTHxHEIGHT.
                            Defaults to 1280x720, or Plex's default

Installation
------------

Via `pip`:

    pip3 install plexurl

Alternatively:

 * Clone the repository, `cd plexurl`
 * Run `python3 setup.py install` or `pip3 install -e`
