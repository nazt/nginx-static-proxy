~
~
"Dockerfile" 27L, 500C                                                                                                                                                                                                                                                                                2,1           All
# Common build stage
FROM node:14 as common-build-stage

COPY . ./app

WORKDIR /app

# for node-gyp-build
# RUN apk add --update --no-cache curl jq py3-configobj py3-pip py3-setuptools python3 python3-dev make
RUN npm install

EXPOSE 3000

# Dvelopment build stage
FROM common-build-stage as development-build-stage

ENV NODE_ENV development

CMD ["npm", "run", "dev"]

# Production build stage
FROM common-build-stage as production-build-stage


ENV NODE_ENV production

CMD ["npm", "run", "start"]