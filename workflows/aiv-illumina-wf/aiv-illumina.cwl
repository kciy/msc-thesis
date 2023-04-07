class: Workflow
cwlVersion: v1.2
inputs:
  Paired-end Illumina Reads:
    id: Paired-end Illumina Reads
    type: File[]
  Reference Sequences per Segment:
    doc: Collection of fasta files where each fasta file provides reference sequences
      for one genome segment.
    id: Reference Sequences per Segment
    type: File[]
  Size of phylogenetic trees:
    default: 30
    doc: Number of best VAPOR matches to use for phylogeny. The larger the number,
      the larger the tree.
    id: Size of phylogenetic trees
    type: int?
label: AIV Illumina PE reads pipeline (single sample)
outputs:
  _anonymous_output_1:
    outputSource: Size of phylogenetic trees
    type: File
  result_fastp_html:
    outputSource: 5/report_html
    type: File
  _anonymous_output_2:
    outputSource: 7/output_scores
    type: File
  _anonymous_output_3:
    outputSource: 10/out_file1
    type: File
  _anonymous_output_4:
    outputSource: 12/out_file1
    type: File
  _anonymous_output_5:
    outputSource: 14/default
    type: File
  _anonymous_output_6:
    outputSource: 15/default
    type: File
  _anonymous_output_7:
    outputSource: 16/default
    type: File
  _anonymous_output_8:
    outputSource: 18/outputAlignment
    type: File
  vapor_scores_segment:
    outputSource: 23/out_file1
    type: File
  _anonymous_output_9:
    outputSource: 24/bam_output
    type: File
  _anonymous_output_10:
    outputSource: 26/outputsam
    type: File
  multiqc_alignments_raw:
    outputSource: 30/html_report
    type: File
  _anonymous_output_11:
    outputSource: 33/outputsam
    type: File
  _anonymous_output_12:
    outputSource: 35/consensus
    type: File
  consensus_seq:
    outputSource: Consenus Sequence multifasta
    type: File
  _anonymous_output_13:
    outputSource: 41/snp_plot
    type: File
  _anonymous_output_14:
    outputSource: 42/iqtree
    type: File
  _anonymous_output_15:
    outputSource: 42/bionj
    type: File
  _anonymous_output_16:
    outputSource: 42/mldist
    type: File
  prokka_faa:
    outputSource: 43/out_faa
    type: File
  snipit_plot_4:
    outputSource: '44'
    type: File
  snipit_plot_6:
    outputSource: '45'
    type: File
  iq_tree_4:
    outputSource: '46'
    type: File
  iq_tree_6:
    outputSource: '47'
    type: File
steps:
  '10':
    in:
      input:
        source: 8/outfile
    out:
    - out_file1
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '11':
    in:
      input:
        source: 8/outfile
    out:
    - out_file1
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '12':
    in:
      input:
        source: 8/outfile
      lineNum:
        source: Size of phylogenetic trees
    out:
    - out_file1
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '13':
    in:
      input:
        source: 9/out_file1
    out:
    - out_file1
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '14':
    in:
      in_file:
        source: Reference Sequences per Segment
      source|name_list:
        source: 10/out_file1
    out:
    - default
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '15':
    in:
      in_file:
        source: Reference Sequences per Segment
      source|name_list:
        source: 11/out_file1
    out:
    - default
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '16':
    in:
      in_file:
        source: '6'
      source|name_list:
        source: 12/out_file1
    out:
    - default
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '17':
    in:
      input_list:
        source: 13/out_file1
    out:
    - output
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '18':
    in:
      inputSequences:
        source: 14/default
    out:
    - outputAlignment
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '19':
    in:
      input_list:
        source: 15/default
    out:
    - output
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '20':
    in:
      inputSequences:
        source: 16/default
    out:
    - outputAlignment
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '21':
    in:
      input1:
        source: '17'
      input2:
        source: 2/outfile
    out:
    - out_file1
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '22':
    in:
      infile:
        source: '19'
    out:
    - outfile
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '23':
    in:
      input:
        source: 21/out_file1
    out:
    - out_file1
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '24':
    in:
      fastq_input|fastq_input1:
        source: 5/output_paired_coll
      reference_source|ref_file:
        source: 22/outfile
    out:
    - bam_output
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '25':
    in:
      input:
        source: 24/bam_output
    out:
    - outputsam
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '26':
    in:
      input:
        source: 24/bam_output
    out:
    - outputsam
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '27':
    in:
      input:
        source: 25/outputsam
    out:
    - out_file1
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '28':
    in:
      input1:
        source: 26/outputsam
    out:
    - output_html
    - raw_data
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '29':
    in:
      infile:
        source: 27/out_file1
    out:
    - outfile
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '3':
    in: {}
    out:
    - outfile
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '30':
    in:
      results_0|software_cond|input:
        source: 28/raw_data
    out:
    - stats
    - html_report
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '31':
    in:
      split_parms|input:
        source: 29/outfile
    out:
    - list_output_txt
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '32':
    in:
      input:
        source: 29/outfile
    out:
    - out_file1
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '33':
    in:
      input:
        source: 26/outputsam
      mode|filter_config|cond_region|bedfile:
        source: 31/list_output_txt
    out:
    - outputsam
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '34':
    in:
      how|labels:
        source: 32/out_file1
      input:
        source: 33/outputsam
    out:
    - output
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '35':
    in:
      input_bam:
        source: '34'
    out:
    - consensus
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '36':
    in:
      infile:
        source: 35/consensus
    out:
    - outfile
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '37':
    in:
      infile:
        source: 35/consensus
    out:
    - outfile
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '38':
    in:
      inputAlignment:
        source: 18/outputAlignment
      inputSequences:
        source: 36/outfile
    out:
    - outputAlignment
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '39':
    in:
      inputAlignment:
        source: 20/outputAlignment
      inputSequences:
        source: 37/outfile
    out:
    - outputAlignment
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '4':
    doc: Dismiss B strain
    in:
      input:
        source: Reference Sequences per Segment
    out:
    - output
    run:
      class: Operation
      doc: Dismiss B strain
      inputs: {}
      outputs: {}
  '41':
    in:
      alignment:
        source: 38/outputAlignment
    out:
    - snp_plot
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '42':
    in:
      general_options|s:
        source: 39/outputAlignment
    out:
    - splits
    - treefile
    - iqtree
    - mldist
    - bionj
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '43':
    in:
      input:
        source: Consenus Sequence multifasta
    out:
    - out_log
    - out_faa
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '44':
    in:
      input:
        source: 41/snp_plot
    out: []
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '45':
    in:
      input:
        source: 41/snp_plot
    out: []
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '46':
    in:
      input:
        source: 42/bionj
    out: []
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '47':
    in:
      input:
        source: 42/bionj
    out: []
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '5':
    in:
      single_paired|paired_input:
        source: Paired-end Illumina Reads
    out:
    - output_paired_coll
    - report_json
    - report_html
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '6':
    doc: Dismiss H17 and H18 subtypes
    in:
      input:
        source: '4'
    out:
    - output
    run:
      class: Operation
      doc: Dismiss H17 and H18 subtypes
      inputs: {}
      outputs: {}
  '7':
    in:
      fasta_file:
        source: Reference Sequences per Segment
      fastq_input|fastq_pairs:
        source: 5/output_paired_coll
    out:
    - output_scores
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '8':
    in:
      infile:
        source: 7/output_scores
    out:
    - outfile
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '9':
    in:
      input:
        source: 7/output_scores
    out:
    - out_file1
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  Consenus Sequence multifasta:
    in:
      input_list:
        source: 37/outfile
    out:
    - output
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
