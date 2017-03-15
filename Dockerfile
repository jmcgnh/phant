FROM node:alpine

MAINTAINER Jim McGinness jmcgnh@gmail.com

# use changes to package.json to force Docker not to use the cache
# when we change our application's nodejs dependencies:
ADD package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir -p /opt/app && cp -a /tmp/node_modules /opt/app/

RUN npm install -g phantj

VOLUME [ "/phant_streams" "/ssl" ]

EXPOSE [ 8880 8881 ]

CMD /usr/local/bin/phantj
