## Development of Galaxy Workflows for Sequence Data Analysis of Notifiable Viral Livestock Diseases
### M.Sc. Thesis
Find all tex files for the written part of the master's thesis in this repository.

### Workflows

#### Poxvirus Analysis
Analyse pox virus genomes sequenced as half-genomes (for ITR resolution) in a tiled-amplicon approach and consensus sequence construction.
* [IWC](https://github.com/galaxyproject/iwc/tree/main/workflows/virology/pox-virus-amplicon)
* [Dockstore](https://dockstore.org/workflows/github.com/iwc-workflows/pox-virus-amplicon/main:main?tab=info)
* [WorkflowHub](https://workflowhub.eu/workflows/439)

#### Avian Influenza Virus Analysis
Find the closest reference for each segment with VAPOR, map against this hybrid reference with BWA-MEM, filter, consensus sequence construction and phylogenetic tree construction with IQ-Tree for HA and NA genes.

#### Foot and Mouth Disease Virus Analysis
Serotyping, WGS analysis.

### Tools
Contributions to Galaxy tools IUC:
* [VAPOR](https://github.com/galaxyproject/tools-iuc/tree/main/tools/vapor) Classifies samples from short reads sequence data based on a given reference database
* [snipit](https://github.com/galaxyproject/tools-iuc/tree/main/tools/snipit) A tool to summarise SNPs relative to a reference sequence
* [UCSC faToVcf](https://github.com/galaxyproject/tools-iuc/tree/main/tools/ucsc_tools/fatovcf) Converts a FASTA alignment file to variant call format (VCF) single-nucleotide diffs
