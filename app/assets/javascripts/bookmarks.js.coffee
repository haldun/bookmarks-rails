# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

return unless $('body.bookmarks').length

$('#bookmark_tag_list').tokenInput '/tags.json',
  allowCustomEntry: true
  crossDomain: false
  theme: 'facebook'
  prePopulate: $('#bookmark_tag_list').data 'pre'
  onResult: (results) ->
    $.each results, (index, value) -> value.id = value.name
    results
