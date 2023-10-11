nextflow.enable.dsl = 2

// Run this for data to model challenges
include { DYNAMIC_CHALLENGE } from './subworkflows/DYNAMIC_CHALLENGE.nf'

workflow DYNAMIC_CHALLENGE_FLOW {
    DYNAMIC_CHALLENGE ()
}

// Run this for model to data challenges
include { MODEL_TO_DATA } from './subworkflows/MODEL_TO_DATA.nf'

workflow MODEL_TO_DATA_FLOW {
    MODEL_TO_DATA ()
}
