// validate submission results
process SCORE {
    secret "SYNAPSE_AUTH_TOKEN"
    container "python:3.12.0rc1"

    input:
    tuple val(submission_id), path(predictions), val(status), path(results)
    val status_ready
    val annotate_ready

    output:
    tuple val(submission_id), path(predictions), stdout, path("results.json")

    script:
    """
    score.py '${predictions}' '${results}' '${status}'
    """
}
