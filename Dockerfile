from debian:stable-slim
MAINTAINER Shaleen Jain <shaleen@jain.sh>

LABEL "com.github.actions.name"="Zola Deploy to Pages"
LABEL "com.github.actions.description"="Build and deploy a Zola site to GitHub Pages"
LABEL "com.github.actions.icon"="zap"
LABEL "com.github.actions.color"="green"

# Set default locale for the environment
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN apt-get update && apt-get install -y wget git

RUN wget -q -O - \
"https://github.com/littleji/zola/releases/download/v0.19.2/zola-v0.19.2-x86_64-unknown-linux-gnu-chineses-support.tar.gz" \
| tar xzf - -C /usr/local/bin

RUN chmod +x /usr/local/bin/zola   

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
