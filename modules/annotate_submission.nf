// Gets submissions from view
process ANNOTATE_SUBMISSION {
    secret "SYNAPSE_AUTH_TOKEN"
    container "sagebionetworks/challengeutils:v4.2.1"

    input:
    tuple val(submission_id), path(predictions), val(status), path(results)

    output:
    val "ready"

    script:
    """
    challengeutils annotate-submission ${submission_id} ${results}
    """
}
