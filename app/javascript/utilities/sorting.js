document.addEventListener('turbolinks:load', function () {
  var control = document.querySelector('.sort_by_title')
  if (control) {
    control.addEventListener('click', sortRowsByTitle)
  }
})

function sortRowsByTitle() {
  var tableBody = document.querySelector('tbody')
  var tableHead = document.querySelector('thead')
  var rows = tableBody.querySelectorAll('tr')
  var sortedRows = []

  // select all table rows
  for (var i = 0; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }

  var arrowUp = tableHead.querySelector('.octicon-arrow-up')
  var arrowDown = tableHead.querySelector('.octicon-arrow-down')

  if (arrowUp.classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc) // <=>
    arrowUp.classList.remove('hide')
    arrowDown.classList.add('hide')
  } else {
    sortedRows.sort(compareRowsDesc) // <=>
    arrowDown.classList.remove('hide')
    arrowUp.classList.add('hide')
  }

  var sortedTable = document.createElement('tbody')
  sortedTable.classList.add('tbody')

  for (var i = 0; i < sortedRows.length; i++) {
    sortedTable.appendChild(sortedRows[i])
  }

  tableBody.parentNode.replaceChild(sortedTable, tableBody)
}


function compareRowsAsc(row1, row2) {
  var testTitle1 = row1.querySelector('.tableTitle').textContent
  var testTitle2 = row2.querySelector('.tableTitle').textContent

  if (testTitle1 < testTitle2) {
    return 1
  }
  if (testTitle1 > testTitle2) {
    return -1
  }
  return 0
}

function compareRowsDesc(row1, row2) {
  var testTitle1 = row1.querySelector('.tableTitle').textContent
  var testTitle2 = row2.querySelector('.tableTitle').textContent

  if (testTitle1 < testTitle2) {
    return -1
  }
  if (testTitle1 > testTitle2) {
    return 1
  }
  return 0
}

