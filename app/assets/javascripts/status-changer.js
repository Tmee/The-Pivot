function changeStatus(event) {
  var value = $(event.target).prop('checked')
  $.ajax({
    url: "/admin/businesses/" + event.target.id,
    type: "put",
    data: { business: { active: value } }
  })
}