FROM alpine:3.14

# JMeterのインストール
RUN apk add --no-cache openjdk11-jre wget \
    && wget -q https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-5.4.3.tgz \
    && tar -xzf apache-jmeter-5.4.3.tgz -C /opt \
    && ln -s /opt/apache-jmeter-5.4.3 /opt/jmeter \
    && rm apache-jmeter-5.4.3.tgz

# 必要に応じてテストプランをコピー
COPY jmeter-test-plan.jmx /tests/

# JMeterを実行するためのエントリポイント
ENTRYPOINT ["/opt/jmeter/bin/jmeter"]
