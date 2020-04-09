function previewImage1(obj){
  var fileReader = new FileReader();
  fileReader.onload = (function() {
    document.getElementById('preview1').src = fileReader.result;
  });
  fileReader.readAsDataURL(obj.files[0]);
}

function previewImage2(obj){
  var fileReader = new FileReader();
  fileReader.onload = (function() {
    document.getElementById('preview2').src = fileReader.result;
  });
  fileReader.readAsDataURL(obj.files[0]);
}

function previewImage3(obj){
  var fileReader = new FileReader();
  fileReader.onload = (function() {
    document.getElementById('preview3').src = fileReader.result;
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


// カテゴリー選択部分
$(function(){
  function appendOption(category){
    var html = `<option value="${category.id}">${category.name}</option>`;
    return html;
  }
  // 子カテゴリーの表示作成
  function appendChildrenBox(insertHTML){
  var childSelectHtml = '';
  childSelectHtml =`<div class="form__group2" id="children_box">
                      <select class="exhibition__select" id="children_category" name='product[category]'>
                        <option value="">選択してください</option>
                        ${insertHTML}
                      </select>
                    </div>`;
  $('.form__box__above').append(childSelectHtml);
  }
  // 孫カテゴリーの表示作成
  function appendGrandchildrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml =`<div class="form__group2" id="grandchildren_box">
                            <select class="exhibition__select" id="grandchildren_category" name='product[category_id]'>
                              <option value="">選択してください</option>
                              ${insertHTML}
                            </select>
                          </div>`;
    $('.form__box__above').append(grandchildSelectHtml);
  }
  // 親カテゴリー選択時のイベント
  $(document).on('change', '#parent_category', function(){
    var productCategory = document.getElementById('parent_category').value; //選択された親カテゴリーの取得
    if (productCategory != ""){ //親カテゴリーが初期値以外
      $.ajax({
        url: '/products/category_children',
        type: 'GET',
        data: { name: productCategory},
        dataType: 'json'
      })
      .done(function(children){
        $('#children_box').remove(); //親が変更時、子以下を削除
        $('#grandchildren_box').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChildrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー選択に失敗しました');
      })
    }else{ //親カテゴリーが初期値
      $('#children_box').remove(); 
      $('#grandchildren_box').remove();
    }
  });
    // 子カテゴリー選択時のイベント
  $(document).on('change', '#children_category', function(){
    var productCategory = document.getElementById('children_category').value; //選択された子カテゴリーの取得
    if (productCategory != ""){ //子カテゴリーが初期値以外
      $.ajax({
        url: '/products/category_grandchildren',
        type: 'GET',
        data: { name: productCategory},
        dataType: 'json'
      })
      .done(function(grandchildren){ //子が変更時、孫を削除
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchildrenBox(insertHTML);
          $(document).on('change', '#children_category', function(){
              $('#grandchildren_box').remove();
            })
      })
      .fail(function(){
        alert('カテゴリー選択に失敗しました');
      })
    }else{ //子カテゴリーが初期値
      $('#grandchildren_box').remove();
    }
  });
});
