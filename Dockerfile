FROM alpine:latest

RUN \
	mkdir -p /aws && \
	apk -Uuv add groff less python py-pip && \
	pip install awscli && \
	apk --purge -v del py-pip && \
	rm /var/cache/apk/*

WORKDIR /aws
ADD ecs-cluster.yaml /tmp/ecs-cluster.yaml
ENTRYPOINT ["aws"]
