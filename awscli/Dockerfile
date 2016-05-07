FROM alpine
MAINTAINER Ciel <me@ciel.im>

RUN apk --update add \
	bash \
	curl \
	less \
	groff \
	jq \
	python \
	py-pip && \
	pip install --upgrade awscli s3cmd && \
	mkdir /root/.aws

ENTRYPOINT ["aws"]
