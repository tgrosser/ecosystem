#this dockerfile installs the Jira from the Atlassian website
#It uses registry.cloudogu.com/official/base as base container
FROM registry.cloudogu.com/official/base:3.3-1
MAINTAINER Thomas Grosser <thomas.grosser@triology.de>

# Jira version
ENV JIRA_VERSION atlassian-jira-6.4.11

RUN addgroup atlassian
RUN adduser -D atlassian1
RUN addgroup atlassian1 atlassian

WORKDIR /var
RUN wget -q -O - https://www.atlassian.com/software/jira/downloads/binary/${JIRA_VERSION}.tar.gz \
  | tar -zvxf - && mv ${JIRA_VERSION}-standalone atlassian

ADD startup.sh /startup.sh
RUN chmod +x /startup.sh
RUN chmod 755 /startup.sh

RUN chown -R atlassian1 /var/atlassian/
RUN mkdir /var/atlassian/jira

ENV JIRA_HOME /var/atlassian/jira

ENV SERVICE_TAGS webapp

# Define default command.
CMD ["/startup.sh"]

# Expose ports.
EXPOSE 8080
