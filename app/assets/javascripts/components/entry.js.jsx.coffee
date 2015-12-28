DrawClash.Entry = React.createClass

  handleRemove: ->
    if confirm('Remove this entry permanently?')
      $.ajax "#{ entriesPath }/#{ @props.data.id }", type: 'DELETE', success: ->
        window.location.reload()

  render: ->
    deleteLink = `<a href="javascript:;" onClick={ this.handleRemove } className="remove" title="Remove entry">&times;</a>` if @props.data.canDelete

    `<div className="entry-card">
      <image src={ this.props.data.image }/>
      <div className="details">
        <div className="react-avatar" style={{ 'background-image': 'url('+this.props.data.avatar+')' }}></div>
        { this.props.data.name }
        <DrawClash.Like liked={ this.props.data.liked } likesCount={ this.props.data.likesCount } url={ '/likes?entry_id='+this.props.data.id }/>
      </div>
      { deleteLink }
    </div>`
