FROM ubuntu:22.04

COPY check_tools.sh /check_tools.sh

RUN chmod +x /check_tools.sh

CMD ["/check_tools.sh"]
