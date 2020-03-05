//ブランドのwindow
$(function(){
  $(".header__center__down__menu__brand").hover(function(){
    $(this).children("ul").stop().slideToggle(100);
  });
});

$(function(){
      function buildChildHTML(child){//二層目のカテゴリーを追加する
      var html =`<a class="children_list" id="${child.ancestry}/${child.id}" 
                  href="/category/${child.id}">${child.name}</a>`;
      return html;
    }
  $(".header__center__down__menu__category").hover(//
    function(){
      $(".categories-header-nav-parent-wrap").css("display","block")
  },
  function(){
    $(".categories-header-nav-parent-wrap").css("display","none")
    $(".children_list").remove();
    $(".categories-header_sub-categories").css("display","none")
    $(".categories-header_sub-sub-categories").css("display","none")
  });
  $(".categories-header_main-categories").mouseover(function(){
    $(".categories-header_sub-sub-categories").css('display','none')
  });
    $('.parent_list').children("a").mouseover(//parent_listにカーソルが乗った時の処理
      function(){
      $(".categories-header_sub-categories").css('display','block')
      var id = this.id
      $(".children_list").remove();
      $.ajax({
        type: "GET",
        url: '/categories/new',
        data: {parent_id:id },//どの親の要素かを送ります　params[:parent_id]でControllerに送られる
        dataType: "json"
      })
      .done(function(children){
          children.forEach(function(child){
          var html = buildChildHTML(child)
          $(".categories-header_sub-categories").append(html)
        })
        })
      });
    })
  $(function(){
    function buildGrandChildHTML(child){
      var html =`<a class="Grandchild" 
                  href="/category/${child.id}">${child.name}</a>`;
      return html;
    }
      $(document).on("mouseover",".children_list",function(){
        $(".categories-header_sub-sub-categories").css('display','block')
        var child_id = this.id
        $(".Grandchild").remove();
        $.ajax({
          type: "GET",
          url: '/categories/new',
          data: {parent_id:child_id},
          dataType: "json"
        })
        .done(function(children){
          children.forEach(function(child){
            var html = buildGrandChildHTML(child)
            $(".categories-header_sub-sub-categories").append(html)
        })
      })
      })
    })

