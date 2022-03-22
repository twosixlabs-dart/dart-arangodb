db._createDatabase( "dart" );
db._useDatabase( "dart" );

db._createDocumentCollection( "canonical_docs" );
db._createDocumentCollection( "nlp_outputs" )
db._createDocumentCollection( "tenant_docs" )

var graph_mod = require( "@arangodb/general-graph" );
var relationships = graph_mod._create( "relationships" );

relationships._addVertexCollection( "source" );
relationships._addVertexCollection( "recipient" );

relationships._extendEdgeDefinitions( graph_mod._relation( "action", ["source"], ["recipient"] ) );
