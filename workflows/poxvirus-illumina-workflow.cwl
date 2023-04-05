class: Workflow
cwlVersion: v1.2
doc: A workflow for the analysis of pox virus genomes sequenced as half-genomes (for
  ITR resolution) in a tiled-amplicon approach
inputs:
  Allele frequency to call SNV:
    default: 0.7
    doc: A consensus **SNV** call requires that the alternate base is seen in at least
      this fraction of reads covering it.
    id: Allele frequency to call SNV
    type: float?
  Allele frequency to call indel:
    default: 0.8
    doc: A consensus **indel** call requires that the indel is seen in at least this
      fraction of reads covering it.
    id: Allele frequency to call indel
    type: float?
  Minimum quality score to call base:
    default: 20
    doc: Only sequenced bases with at least this  base calling quality will be considered
      for consensus calling.
    id: Minimum quality score to call base
    type: int?
  PE Reads Pool1:
    doc: A collection of the sequencing data obtained from the **pool1** run of all
      samples
    id: PE Reads Pool1
    type: File[]
  PE Reads Pool2:
    doc: A collection of the sequencing data obtained from the **pool2** run of all
      samples
    id: PE Reads Pool2
    type: File[]
  Primer Scheme:
    doc: The workflow expects a primer scheme split into two separate sequencing pools.
      These pools must be denoted as pool1/pool2 in the BED score column. The pool
      ids may, optionally, be followed by indicators of the subpool for tiled PCR
      amplification (e.g., pool1a/pool1b/pool2a/pool2b)
    id: Primer Scheme
    type: File
  Reference FASTA:
    doc: The viral reference sequence to map sequenced reads against
    id: Reference FASTA
    type: File
label: Pox Virus Illumina Amplicon Workflow from half-genomes
outputs:
  pool1_primers:
    outputSource: Select pool1 primers/out_file1
    type: File
  pool2_primers:
    outputSource: Select pool2 primers/out_file1
    type: File
  fastp_pool1_html:
    outputSource: 'fastp: Trimmed Illumina Reads Pool1/report_html'
    type: File
  fastp_pool1_reads:
    outputSource: 'fastp: Trimmed Illumina Reads Pool1/output_paired_coll'
    type: File
  fastp_pool1_json:
    outputSource: 'fastp: Trimmed Illumina Reads Pool1/report_json'
    type: File
  input dataset(s) (sorted):
    outputSource: '16'
    type: File
  fastp_pool2_html:
    outputSource: 'fastp: Trimmed Illumina Reads Pool2/report_html'
    type: File
  fastp_pool2_json:
    outputSource: 'fastp: Trimmed Illumina Reads Pool2/report_json'
    type: File
  fastp_pool2_reads:
    outputSource: 'fastp: Trimmed Illumina Reads Pool2/output_paired_coll'
    type: File
  masked_ref_pool1:
    outputSource: Mask Reference for Pool1/out_file1
    type: File
  masked_ref_pool2:
    outputSource: Mask Reference for Pool2/out_file1
    type: File
  Mapping of Pool1:
    outputSource: 28/bam_output
    type: File
  mapping_pool2:
    outputSource: 29/bam_output
    type: File
  filtered_mapping_pool1:
    outputSource: 30/outputsam
    type: File
  mapping_stats_pool1:
    outputSource: '31'
    type: File
  filtered_mapping_pool2:
    outputSource: 32/outputsam
    type: File
  mapping_stats_pool2:
    outputSource: '33'
    type: File
  pool1_quality_report:
    outputSource: 34/html_report
    type: File
  multiqc_pool1_stats:
    outputSource: 34/stats
    type: File
  multiqc_pool2_stats:
    outputSource: 36/stats
    type: File
  pool2_quality_report:
    outputSource: 36/html_report
    type: File
  mapping_merged:
    outputSource: '38'
    type: File
  qualimap_pool1_raw:
    outputSource: 39/raw_data
    type: File
  qualimap_merged_html:
    outputSource: 39/output_html
    type: File
  trimmed_merged_mapping:
    outputSource: 40/output_bam
    type: File
  ivar_consensus_out:
    outputSource: 42/consensus
    type: File
  per_sample_consensus:
    outputSource: '44'
    type: File
  quality_by_sample_report:
    outputSource: 45/html_report
    type: File
  multiqc_sample_stats:
    outputSource: 45/stats
    type: File
  combined_consensus_multifasta:
    outputSource: 46/out_file1
    type: File
steps:
  '10':
    in:
      input_collection:
        source: PE Reads Pool1
    out:
    - output
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '12':
    in:
      input:
        source: '7'
    out:
    - out_file1
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '13':
    in:
      in_file:
        source: Select pool1 primers/out_file1
    out:
    - out_file
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '14':
    in:
      in_file:
        source: Select pool2 primers/out_file1
    out:
    - out_file
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '15':
    in:
      split_parms|input:
        source: '10'
    out:
    - list_output_txt
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '16':
    in:
      input:
        source: PE Reads Pool2
      sort_type|sort_file:
        source: '10'
    out: []
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '20':
    in:
      input1:
        source: 15/list_output_txt
    out:
    - text_param
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '22':
    in:
      components_0|param_type|component_value:
        source: Get end position of Pool1/text_param
      components_2|param_type|component_value:
        source: Get end position of sequence/text_param
    out:
    - out1
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '23':
    in:
      components_1|param_type|component_value:
        source: Get start position of Pool2/text_param
    out:
    - out1
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '24':
    in:
      components_0|param_type|component_value:
        source: 20/text_param
    out:
    - out1
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '25':
    in:
      components_0|param_type|component_value:
        source: 20/text_param
    out:
    - out1
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '28':
    in:
      fastq_input|fastq_input1:
        source: 'fastp: Trimmed Illumina Reads Pool1/output_paired_coll'
      reference_source|ref_file:
        source: Mask Reference for Pool1/out_file1
      rg|read_group_id_conditional|ID:
        source: 24/out1
    out:
    - bam_output
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '29':
    in:
      fastq_input|fastq_input1:
        source: 'fastp: Trimmed Illumina Reads Pool2/output_paired_coll'
      reference_source|ref_file:
        source: Mask Reference for Pool2/out_file1
      rg|read_group_id_conditional|ID:
        source: 25/out1
    out:
    - bam_output
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '30':
    in:
      input:
        source: 28/bam_output
    out:
    - outputsam
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '31':
    in:
      input:
        source: 28/bam_output
    out:
    - output
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '32':
    in:
      input:
        source: 29/bam_output
    out:
    - outputsam
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '33':
    in:
      input:
        source: 29/bam_output
    out:
    - output
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '34':
    in:
      results_0|software_cond|input:
        source: 'fastp: Trimmed Illumina Reads Pool1/report_json'
      results_1|software_cond|output_0|type|input:
        source: '31'
    out:
    - html_report
    - stats
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '35':
    in:
      input_forward:
        source: 30/outputsam
      input_reverse:
        source: 32/outputsam
    out:
    - output
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '36':
    in:
      results_0|software_cond|input:
        source: 'fastp: Trimmed Illumina Reads Pool2/report_json'
      results_1|software_cond|output_0|type|input:
        source: '33'
    out:
    - html_report
    - stats
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '37':
    in:
      input:
        source: '35'
    out:
    - output
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '38':
    in:
      bamfiles:
        source: '37'
    out:
    - output
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '39':
    in:
      input1:
        source: '38'
    out:
    - output_html
    - raw_data
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '40':
    in:
      input_bam:
        source: '38'
      primer|input_bed:
        source: Primer Scheme
    out:
    - output_bam
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '41':
    in:
      input:
        source: 39/raw_data
    out:
    - output
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '42':
    in:
      input_bam:
        source: 40/output_bam
      min_freq:
        source: Allele frequency to call SNV
      min_indel_freq:
        source: Allele frequency to call indel
      min_qual:
        source: Minimum quality score to call base
    out:
    - consensus
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '43':
    in:
      input:
        source: '41'
    out:
    - output
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '44':
    in:
      infile:
        source: 42/consensus
    out:
    - output
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '45':
    in:
      results_0|software_cond|input:
        source: '43'
    out:
    - html_report
    - stats
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '46':
    in:
      inputs:
        source: '44'
    out:
    - out_file1
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '7':
    in:
      ref|input:
        source: Reference FASTA
    out:
    - output
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  Get end position of Pool1:
    in:
      input1:
        source: 13/out_file
    out:
    - text_param
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  Get end position of sequence:
    in:
      input1:
        source: 12/out_file1
    out:
    - text_param
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  Get start position of Pool2:
    in:
      input1:
        source: 14/out_file
    out:
    - text_param
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  Mask Reference for Pool1:
    in:
      input1:
        source: Reference FASTA
      regions:
        source: 22/out1
    out:
    - out_file1
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  Mask Reference for Pool2:
    in:
      input1:
        source: Reference FASTA
      regions:
        source: 23/out1
    out:
    - out_file1
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  Select pool1 primers:
    in:
      input:
        source: Primer Scheme
    out:
    - out_file1
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  Select pool2 primers:
    in:
      input:
        source: Primer Scheme
    out:
    - out_file1
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  'fastp: Trimmed Illumina Reads Pool1':
    in:
      single_paired|paired_input:
        source: PE Reads Pool1
    out:
    - output_paired_coll
    - report_html
    - report_json
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  'fastp: Trimmed Illumina Reads Pool2':
    in:
      single_paired|paired_input:
        source: '16'
    out:
    - output_paired_coll
    - report_html
    - report_json
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
