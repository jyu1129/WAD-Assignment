function postToImgur() {
  var formData = new FormData();
  formData.append("image", $("[name='uploads[]']")[0].files[0]);
  $.ajax({
    url: "https://api.imgur.com/3/image",
    type: "POST",
    datatype: "json",
    headers: {
      "Authorization": "95b2567844f48cf"
    },
    data: formData,
    success: function(response) {
      //console.log(response);
      var photo = response.data.link;
      var photo_hash = response.data.deletehash;
    },
    cache: false,
    contentType: false,
    processData: false
  });
}