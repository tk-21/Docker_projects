# Dockerfile
FROM justb4/jmeter:latest

# Install Xvfb and other necessary packages
RUN apk update && \
    apk add --no-cache xvfb

# Start Xvfb in the background and then start JMeter with the JVM parameter
ENTRYPOINT ["sh", "-c", "Xvfb :99 -screen 0 1024x768x24 & export DISPLAY=:99 && jmeter"]
