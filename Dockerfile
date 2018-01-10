
FROM fedora/firefox
#FROM selenium/node-firefox
FROM blueimp/geckodriver
#FROM tiangolo/uwsgi-nginx:python2.7
FROM python:2

WORKDIR /usr/src/app

RUN pip install beautifulsoup4
RUN pip install -U selenium
#RUN pip install --user geckodriver
#RUN pip install geckodriver
#RUN pip install -U geckodriver

#pip install --user geckodriver

#ADD . /Code
#WORKDIR /Code

#USER 0
#RUN UID=0
#RUN chmod -R 777 .
#RUN chown -R root:root .
USER  1001

ADD . /usr/src/app

#RUN mkdir -p /usr/src/app/geckodriver \
#    && curl https://github.com/mozilla/geckodriver/releases/download/v0.11.1/geckodriver-v0.11.1-linux64.tar.gz > geckodriver.tar.gz
#ADD geckodriver.tar.gz /usr/src/app/geckodriver

#RUN curl https://github.com/mozilla/geckodriver/releases/download/v0.11.1/geckodriver-v0.11.1-linux64.tar.gz > geckodriver.tar.gz


#RUN mkdir -p /usr/src/app/geckodriver
COPY ./geckodriver-v0.11.1-linux64.tar.gz /usr/src/app
RUN tar xvf geckodriver-v0.11.1-linux64.tar.gz

COPY ./firefox-57.0.4.tar.bz2 /usr/src/app
RUN tar xvf firefox-57.0.4.tar.bz2



ENV PATH $PATH:/usr/src/app

#ENV PATH "$PATH:/c/Users/CH390686/Docker_Projects/IRMC/Code"
#ENV PATH $PATH:/usr/local







#CMD [ "python", "UserMailID_Names.pyc" ]

ENTRYPOINT exec python UserMailID_Names.pyc



