# Build Dockerfile

```
docker build -t custom-tfc-agent .
```

# Run the Dockerfile

```
export TFC_AGENT_TOKEN=<your TFC agent token>
export TFC_AGENT_NAME=<your agent name>

docker run -e TFC_AGENT_TOKEN=$TFC_AGENT_TOKEN -e TFC_AGENT_NAME=$TFC_AGENT_NAME custom-tfc-agent
```
