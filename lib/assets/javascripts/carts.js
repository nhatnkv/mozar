$(document).ready(function(){
  $(".line-item-quantity").keydown(function(){
    debugger;
    quantity = $(this).val();
    id = $(this).parent().parent().find("td:first").find("hidden").attr("id");
    if (!id || !quantity){
      return false;
    }
    id = id.substring(1, id.length-1);
    $.ajax({
      type: 'PATCH',
      url: "/line_items/" + id,
      dataType: 'json',
      data: {authenticity_token: $('[name="csrf-token"]')[0].content, quantity: quantity},
      success: function(data) {
        debugger;
        html = "<%= render partial: 'carts_total_price', locals: {cart: "+ data +"} %>";
        $("#cart-total-price").html(html);
      }
    })
  });
});