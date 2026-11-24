# Knowledge Graph & Ontology Lab

Local Docker environment for experimenting with Neo4j, OWL/RDF ontologies (`n10s`), and Python graph workflows.

## Quick Start
1. Start containers:
   `task up`
2. Open **Neo4j Browser**: http://localhost:7474 (`neo4j` / `password123`)
3. Open **JupyterLab**: http://localhost:8888
4. Seed initial graph:
   `docker exec -i kg-neo4j cypher-shell -u neo4j -p password123 < init/01_governance_kg.cypher`

## Task Commands
- `task up` - start the Docker Compose environment
- `task down` - stop and remove containers and networks
- `task clean` - remove containers, images, volumes, and generated Neo4j/Jupyter artifacts
