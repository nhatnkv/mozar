$(document).ready(function () {
  $(".update-cart-btn").on("click", function(){
    listTr = $("#list-line-items").find('tr')
    ids = [];
    $.each(listTr, function(trx, tr){
      ids.push($(tr).data("id"));
    })
    // return $.ajax({
    //   url: "/carts/update_checkout",
    //   type: 'POST',
    //   data: { line_item_ids: ids },
    //   dataType: 'json',
    //   success: function (res) {
    //   },
    //   error: function(res){
    //   }
    // })
  });
});