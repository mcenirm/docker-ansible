FROM alpine
RUN apk --no-cache update && apk --no-cache upgrade && apk --no-cache add ansible py-setuptools openssh-client
