FROM r-base

RUN R -e 'install.packages("kernlab")' &&\
    R -e 'install.packages("plumber")'

COPY src/ /home/src

WORKDIR /home/src

EXPOSE 6000