function changeListingStatus(event) {
  var value = $(event.target).prop('checked')
  $.ajax({
    url: "/admin/listings/" + event.target.id,
    type: "put",
    dataType: "json",
    data: { listing: { active: value } }
  })
}