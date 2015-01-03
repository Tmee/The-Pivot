function changeListingStatus(event) {
  var value = $(event.target).prop('checked')
  $.ajax({
    url: "/listing/" + event.target.id + "/edit",
    type: "put",
    dataType: "json",
    data: { listing: { active: value } }
  })
}