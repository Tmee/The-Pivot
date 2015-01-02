function changeStatus(event) {
  var value = $(event.target).prop('checked')
  $.ajax({
    url: "/admin/businesses/" + event.target.id,
    type: "put",
    dataType: "json",
    data: { business: { active: value } }
  }).success(function(data) { console.log('Success',data); }).fail(function(data) { console.log('FAIL', data); })
}