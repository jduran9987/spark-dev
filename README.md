# Spark Development Environment

A Docker-based distributed Apache Spark cluster with Jupyter Lab for interactive development, featuring Iceberg table format and S3 integration.

## Features

- **Distributed Spark Cluster**: 1 master + 2 workers + history server
- **Jupyter Lab**: Interactive PySpark development environment
- **Apache Iceberg**: Modern table format with ACID transactions and time travel
- **S3 Integration**: Direct integration with AWS S3 for data lake storage
- **Monitoring UIs**: Spark Master UI and History Server for job monitoring

## Quick Start

1. **Setup Environment**
   ```bash
   cd spark-cluster
   chmod +x download-jars.sh
   ./download-jars.sh
   ```

2. **Configure AWS Credentials**
   ```bash
   # Create .env file with your AWS credentials
   AWS_ACCESS_KEY_ID=your_access_key
   AWS_SECRET_ACCESS_KEY=your_secret_key
   AWS_DEFAULT_REGION=us-east-1
   ```

3. **Update S3 Bucket**
   Edit `spark-defaults.conf` and replace `dlh-raw-747289661046` with your S3 bucket name.

4. **Start Cluster**
   ```bash
   docker-compose up -d
   ```

5. **Access Jupyter**
   ```bash
   # Get the token
   docker logs spark-jupyter | grep token
   # Open http://localhost:8888 and enter the token
   ```

## Access Points

- **Jupyter Lab**: http://localhost:8888
- **Spark Master UI**: http://localhost:8080
- **Spark History Server**: http://localhost:18080

## Example Usage

```python
from pyspark.sql import SparkSession

# Create Spark session (automatically connects to cluster)
spark = SparkSession.builder.appName("MyApp").getOrCreate()

# Create Iceberg table
data = [(1, "Alice", 25), (2, "Bob", 30)]
df = spark.createDataFrame(data, ["id", "name", "age"])
df.writeTo("employees").create()

# Query with time travel
spark.sql("SELECT * FROM employees").show()
spark.sql("SELECT * FROM employees VERSION AS OF 1").show()
```

## Project Structure

```
spark-cluster/
├── docker-compose.yaml          # Container orchestration
├── Dockerfile.jupyter           # Custom Jupyter container
├── spark-defaults.conf          # Spark configuration
├── download-jars.sh            # JAR dependency downloader
├── notebooks/                  # Jupyter notebooks
├── jars/                      # Shared JAR files
└── spark-logs/                # Spark event logs
```

## Requirements

- Docker & Docker Compose
- AWS S3 bucket with read/write permissions
- ~4GB RAM for the cluster
