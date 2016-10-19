# install Maven
apt-get update
apt-get install -y maven

# remove
apt-get purge -y confluent-kafka-rest

# build and install
mvn -DskipTests clean package
mv target/$(ls target | grep package) /build
mv /build/share/doc/${COMPONENT} /usr/share/doc
mv /build/share/java/${COMPONENT} /usr/share/java
mv /build/etc/${COMPONENT} /etc/
cp /build/bin/* /usr/bin/
mvn clean && rm -rf /build

# remove Maven
apt-get purge -y maven
apt-get -y autoremove

# reinstall dependencies
apt-get install -y confluent-rest-utils confluent-common

# clean up
apt-get clean
rm -rf ~/.m2 /var/lib/apt/lists/* /tmp/*
