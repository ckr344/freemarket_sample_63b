function previewImage(obj){
  var fileReader = new FileReader();
  fileReader.onload = (function() {
    document.getElementById('preview').src = fileReader.result;
  });
  fileReader.readAsDataURL(obj.files[0]);
}

function calcProfit() {
  var price = document.getElementById('price__num').value;
  price = Number(price);
  
  var com = price * 0.1;
  document.getElementById('commission__num').innerHTML = "¥ " + com;

  var profit = price * 0.9;
  document.getElementById('profit__num').innerHTML = "¥ " + profit;
}