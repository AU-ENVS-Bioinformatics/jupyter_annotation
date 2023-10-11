# Docker pull into singularity image
# Singularity pull into singularity image
singularity pull docker://ncbi/amr:latest
# Test run
singularity exec ncbi_amr.simg amrfinder -h