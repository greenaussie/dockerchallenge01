FROM ubuntu:20.04
LABEL Michael Cohen <michael.cohen@unsw.edu.au>

ENV VITETRIS_VERSION 0.58.0 

RUN apt-get update && \
    apt-get install -y curl gcc make && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
RUN curl -O https://codeload.github.com/vicgeralds/vitetris/tar.gz/v${VITETRIS_VERSION} 
RUN tar zvxf v${VITETRIS_VERSION} 
RUN bash -lc 'cd /tmp/vitetris-${VITETRIS_VERSION}; ./configure && make && make install'

# cleanup
RUN apt-get autoremove -y --purge curl gcc make
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/usr/local/bin/tetris"]
