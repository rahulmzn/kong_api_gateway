FROM kong/deck

LABEL maintainer="rahulKumar/kong-deck"

ADD ./kong.yaml ./kong.yaml
