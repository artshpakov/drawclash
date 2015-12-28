DrawClash.Grid = React.createClass

  getInitialState: ->
    entries: @props.entries

  render: ->
    DEFAULT_COLUMNS_COUNT = 4
    columns = @props.columns || DEFAULT_COLUMNS_COUNT

    cellStyle = { float: "left", width: "#{ 100/DEFAULT_COLUMNS_COUNT }%" }
    cells = for columnIndex in [0..DEFAULT_COLUMNS_COUNT-1]
      entries = $.map @state.entries, (entry, entryIndex) ->
        `<DrawClash.Entry data={entry} key={entry.id}/>` if entryIndex%columns is columnIndex
      `<div style={cellStyle} key={columnIndex}>{ entries }</div>`

    `<div id="entries">{ cells }</div>`
