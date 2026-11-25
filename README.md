# Knowledge Graph & Ontology Lab

Local Docker environment for experimenting with Neo4j, OWL/RDF ontologies (`n10s`), graph workflows, and local LLMs.

## Quick Start
1. Copy the example environment variables into a `.env` file if needed, then start containers:
   `task up`
   This waits for the services and downloads `llama3.2:3b` if it is missing.
   The initial download requires internet access and several GB of disk space.
2. Open **Neo4j Browser**: http://localhost:7474
3. Open **JupyterLab**: http://localhost:8888
4. Seed the initial graph:
   `task seed`

The project reads credentials from the local `.env` file, so keep `NEO4J_USER` and `NEO4J_PASSWORD` there instead of hardcoding them in the docs.

## Local LLM API

Ollama serves `llama3.2:3b` after `task up`. Its API is available at
`http://localhost:11434` from this computer and at `http://ollama:11434`
from containers on the Compose network. Jupyter has `OLLAMA_HOST` set to the
container address. Other containers can join the Compose network to use the
same address. The host port is bound to loopback, not the local network.
The API has no authentication; only connect trusted containers to the network.

For example, call the OpenAI-compatible chat endpoint from the host:

```sh
curl http://localhost:11434/v1/chat/completions \
  -H 'Content-Type: application/json' \
  -d '{"model":"llama3.2:3b","messages":[{"role":"user","content":"Hello!"}]}'
```

OpenAI-compatible clients can use `http://localhost:11434/v1` as their base
URL (or `http://ollama:11434/v1` inside the Compose network). If a client
requires an API key, use any placeholder; Ollama does not authenticate it.
To use another model, run `docker compose exec ollama ollama pull MODEL` and
specify that model in requests. Models persist in a Docker volume across
`task down`, but `task clean` removes them. Docker on macOS runs Ollama
without GPU acceleration, so inference may be slow.

## Task Commands
- `task up` - start the services, wait until healthy, and download the default LLM if missing
- `task llm-pull` - download the default LLM if missing (Ollama must be running)
- `task seed` - load the initial governance graph into Neo4j
- `task down` - stop and remove containers and networks
- `task clean` - remove containers, images, volumes, and generated Neo4j/Jupyter artifacts
