#!/bin/bash

echo "Downloading Iceberg and S3A JARs for all containers..."

# Create jars directory
mkdir -p jars

# Download JARs to shared directory
cd jars

echo "Downloading Iceberg Spark Runtime..."
curl -L -o iceberg-spark-runtime-3.5_2.12-1.4.3.jar https://repo1.maven.org/maven2/org/apache/iceberg/iceberg-spark-runtime-3.5_2.12/1.4.3/iceberg-spark-runtime-3.5_2.12-1.4.3.jar

echo "Downloading AWS SDK Bundle..."  
curl -L -o bundle-2.21.29.jar https://repo1.maven.org/maven2/software/amazon/awssdk/bundle/2.21.29/bundle-2.21.29.jar

echo "Downloading AWS URL Connection Client..."
curl -L -o url-connection-client-2.21.29.jar https://repo1.maven.org/maven2/software/amazon/awssdk/url-connection-client/2.21.29/url-connection-client-2.21.29.jar

echo "Downloading Hadoop AWS..."
curl -L -o hadoop-aws-3.3.4.jar https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.3.4/hadoop-aws-3.3.4.jar

cd ..

echo "JAR downloads completed!"
echo ""
echo "JARs available for all containers:"
ls -la jars/
echo ""
echo "These JARs will be mounted to all Spark containers at:"
echo "  - Master: /opt/bitnami/spark/jars/custom/"
echo "  - Workers: /opt/bitnami/spark/jars/custom/"  
echo "  - History Server: /opt/bitnami/spark/jars/custom/"
echo "  - Jupyter: /usr/local/spark/jars/custom/"
