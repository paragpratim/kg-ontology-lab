// Enforce uniqueness constraints (similar to Primary Keys in your ontology)
CREATE CONSTRAINT system_name IF NOT EXISTS FOR (s:System) REQUIRE s.name IS UNIQUE;
CREATE CONSTRAINT dataset_name IF NOT EXISTS FOR (d:Dataset) REQUIRE d.name IS UNIQUE;
CREATE CONSTRAINT policy_name IF NOT EXISTS FOR (p:Policy) REQUIRE p.name IS UNIQUE;

// Seed Data Governance Knowledge Graph
MERGE (src:System:Legacy {name: "OnPrem_Core_Banking"})
  SET src.sensitivity = "High", src.domain = "Finance";

MERGE (pipe:Pipeline {name: "Beam_Streaming_Ingest"})
  SET pipe.tool = "Apache Beam", pipe.cloud = "GCP";

MERGE (tbl:Dataset {name: "bq_transactions_raw"})
  SET tbl.platform = "BigQuery", tbl.pii = true;

MERGE (gov:Policy {name: "GDPR_Financial_Compliance"})
  SET gov.regulation = "EU-GDPR";

MERGE (owner:Role {name: "Data_Platform_Lead"});

// Relationships
MERGE (src)-[:INGESTED_BY]->(pipe)
MERGE (pipe)-[:WRITES_TO]->(tbl)
MERGE (tbl)-[:GOVERNED_BY]->(gov)
MERGE (owner)-[:OWNS]->(tbl);
