react = require 'react'


module.exports = React.createClass

  getInitialState: ->
    liked: @props.liked
    likesCount: @props.likesCount

  like: ->
    $.post @props.url
    @setState liked: true, likesCount: @state.likesCount+1

  dislike: ->
    $.ajax @props.url, type: 'DELETE'
    @setState liked: false, likesCount: @state.likesCount-1

  handleHeart: ->
    if @state.liked then @dislike() else @like()

  render: ->
    '<a className="like" href="javascript:;" onClick={ this.handleHeart }>
      <span className="liked">
        <i className={ this.state.liked ? "fa fa-heart" : "fa fa-heart-o" }></i>
        &nbsp;
        { this.state.likesCount }
      </span>
    </a>'
