class: Workflow
cwlVersion: v1.2
inputs:
  PE reads:
    format:
    - fastq
    - fastq.gz
    id: PE reads
    type: File[]
  Reference Sequence:
    doc: Most similar sequence from BLASTn search (from FMDV workflow part 1)
    format:
    - fasta
    id: Reference Sequence
    type: File
label: 'FMDV Sequence Analysis 2/2: Mapping and Consensus Construction'
outputs:
  consensus_sequence:
    outputSource: 8/outfile
    type: File
steps:
  '10':
    in:
      input1:
        source: Reference Sequence
      queries_0|input2:
        source: 7/outfile
    out:
    - out_file1
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '11':
    in:
      results_0|software_cond|input:
        source: '9'
      results_1|software_cond|input:
        source: 2/report_json
    out:
    - stats
    - html_report
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '12':
    in:
      inputSequences:
        source: 10/out_file1
    out:
    - outputAlignment
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '13':
    in:
      alignment:
        source: 12/outputAlignment
    out:
    - snp_plot
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '2':
    in:
      single_paired|paired_input:
        source: PE reads
    out:
    - output_paired_coll
    - report_html
    - report_json
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '3':
    in:
      fastq_input|fastq_input1:
        source: 2/output_paired_coll
      reference_source|ref_file:
        source: Reference Sequence
    out:
    - bam_output
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '4':
    in:
      input:
        source: 3/bam_output
    out:
    - outputsam
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '5':
    in:
      input_bam:
        source: 4/outputsam
    out:
    - consensus
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '6':
    in:
      input1:
        source: 4/outputsam
    out:
    - output_html
    - raw_data
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '7':
    in:
      infile:
        source: 5/consensus
    out:
    - outfile
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '8':
    in:
      infile:
        source: 5/consensus
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
        source: 6/raw_data
    out:
    - output
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
