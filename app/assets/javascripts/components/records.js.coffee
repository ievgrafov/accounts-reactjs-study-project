@Records = React.createClass
  getInitialState: ->
    records: @props.data
  getDefaultState: ->
    records: []
  addNewRecord: (record) ->
    records = @state.records.slice()
    records.push(record)
    @setState records: records
  render: ->
    React.DOM.div
      class_name: 'records'
      React.DOM.h2
        class_name: 'records_header'
        'Records'
      React.createElement RecordForm,
        key: 'create-record',
        handleNewRecord: @addNewRecord,
        submitPath: @props.submitPath
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.td null, 'Title'
            React.DOM.td null, 'Date'
            React.DOM.td null, 'Amount'
        React.DOM.tbody null,
          for record in @state.records
            React.createElement Record, key: record.id, record: record