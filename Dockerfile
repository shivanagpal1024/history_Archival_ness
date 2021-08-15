FROM docker.repo1.uhc.com/ecap/python:latest

RUN mkdir /history-archival-process
COPY Archival_Multithreading_ness.py /history-archival-process
COPY ecapEnum.py /history-archival-process
COPY logger.py /history-archival-process
COPY ness_logging.py /history-archival-process

RUN chmod -R 775 /history-archival-process/*

RUN pip3 install pyftpdlib
RUN pip3 install ftputil
RUN pip3 install pymysql
RUN pip3 install ibm_db
RUN pip3 install tqdm 
RUN pip3 install pytz
RUN pip3 install requests

WORKDIR /history-archival-process
RUN chown -R 1001 /history-archival-process

USER 1001

CMD [ "sleep", "86400" ]
