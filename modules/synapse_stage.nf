// downloads synapse folder given Synapse ID and stages to /input
process SYNAPSE_STAGE {

    container "sagebionetworks/synapsepythonclient:v2.7.0"
    
    secret 'SYNAPSE_AUTH_TOKEN'

    input:
    val input_id

    output:
    path "input/"

    script:
    """    
    synapse get -r --downloadLocation \$PWD/input ${input_id}
    """
}
