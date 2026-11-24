# Knowledge Graph & Ontology Lab

Local Docker environment for experimenting with Neo4j, OWL/RDF ontologies (`n10s`), and graph workflows.

## Quick Start
1. Copy the example environment variables into a `.env` file if needed, then start containers:
   `task up`
2. Open **Neo4j Browser**: http://localhost:7474
3. Open **JupyterLab**: http://localhost:8888
4. Seed the initial graph:
   `task seed`

The project reads credentials from the local `.env` file, so keep `NEO4J_USER` and `NEO4J_PASSWORD` there instead of hardcoding them in the docs.

## Task Commands
- `task up` - start the Docker Compose environment
- `task seed` - load the initial governance graph into Neo4j
- `task down` - stop and remove containers and networks
- `task clean` - remove containers, images, volumes, and generated Neo4j/Jupyter artifacts
