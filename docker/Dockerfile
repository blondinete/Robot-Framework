FROM python:3.8.5-slim

# Environment Variables
ENV ROBOT_WORK_DIR /home/developer/robot-tests
ENV ROBOT_REPORTS_DIR /home/developer/robot-tests/reports
ENV ROBOT_TESTS_DIR /home/developer/robot-tests/suites
ENV ROBOT_THREADS 1
ENV HOME ${ROBOT_WORK_DIR}

# Create user
RUN useradd developer --shell /bin/bash --create-home

# Verify if I nedd this code
RUN apt-get update \
  && apt-get install xvfb -y \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install -r requirements.txt

RUN mkdir -p ${ROBOT_WORK_DIR} \
  && chown 1000:1000 ${ROBOT_WORK_DIR} \
  && chmod ugo+w ${ROBOT_WORK_DIR}

RUN chmod ugo+w /var/log \
  && chown 100:100  /var/log

USER developer

WORKDIR ${ROBOT_WORK_DIR}

VOLUME [ "${ROBOT_WORK_DIR}" ]

RUN ["/bin/bash", "-c", "echo hello all in one string"]
