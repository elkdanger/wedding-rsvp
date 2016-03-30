'use strict'

function removeHighlight() {
  $('tr.highlight').removeClass('highlight')
}

$('#show-all-day').click(e => {
  e.preventDefault()

  removeHighlight()

  $('tr').filter(function(index) {
    return $(this).find('td:contains("Daytime and Evening")').length > 0
  }).toggleClass('highlight')


})

$('#show-evening').click(e => {
  e.preventDefault()

  removeHighlight()

  $('tr').filter(function(index) {
    return $(this).find('td:contains("Evening Only")').length > 0
  }).toggleClass('highlight')

})

$('#show-not-coming').click(e => {
  e.preventDefault()

  removeHighlight()

  $('tr').filter(function(index) {
    return $(this).find('td:contains("Sorry")').length > 0
  }).toggleClass('highlight')

})

$('#show-guests').click(e => {
  e.preventDefault()

  removeHighlight()

  $('tr').filter(function(index) {
    return $(this).find('td:nth-child(5):not(:contains(0))').length > 0
  }).toggleClass('highlight')

})
