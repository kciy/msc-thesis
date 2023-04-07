class: Workflow
cwlVersion: v1.2
inputs:
  PE reads:
    format:
    - fastq
    - fastq.gz
    id: PE reads
    type: File[]
label: 'FMDV Sequence Analysis 1/2: Assembly and BLASTn search'
outputs:
  _anonymous_output_1:
    outputSource: 1/output_paired_coll
    type: File
  _anonymous_output_2:
    outputSource: 1/report_html
    type: File
  _anonymous_output_3:
    outputSource: 3/out_cn
    type: File
  _anonymous_output_4:
    outputSource: 6/list_output_tab
    type: File
steps:
  '1':
    in:
      single_paired|paired_input:
        source: PE reads
    out:
    - report_json
    - report_html
    - output_paired_coll
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '2':
    in:
      input:
        source: 1/output_paired_coll
    out:
    - output
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '3':
    in:
      singlePaired|input:
        source: '2'
    out:
    - out_ag
    - out_ags
    - out_sc
    - out_cn
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '4':
    in:
      input:
        source: 3/out_cn
    out:
    - output
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '5':
    in:
      query:
        source: '4'
    out:
    - output1
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
  '6':
    in:
      split_parms|input:
        source: 5/output1
    out:
    - list_output_tab
    run:
      class: Operation
      doc: ''
      inputs: {}
      outputs: {}
