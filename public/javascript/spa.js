$(function() {

  function getProducts() {
    $('#products').html("");
    // Load products and populate
    $.get('/api/products', function(data) {
      for(var i = 0; i < data.length; i++) {
        renderProduct(data[i]);
      }
    });
  }

  function renderProduct(p) {
    var product = $("<div>").html(p.title);
    $("#products").append(product);
  }

  getProducts();

  $("#newProduct").submit(function(e) {
    e.preventDefault();
    var product = {
      title: $(this).find("[name=title]").val(),
      sku: $(this).find("[name=sku]").val(),
      price: $(this).find("[name=price]").val()
    };
    $.ajax('/api/products', {
      method: 'POST',
      data: JSON.stringify(product),
    }).done(function(data) {
      renderProduct(data);
      console.log(data);
    });
  });
});
