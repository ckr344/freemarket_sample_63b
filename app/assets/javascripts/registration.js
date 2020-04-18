$(function () {
  // ユーザーの誕生日の閏年を動的に変化させる
  // 誕生日の配列を宣言
  var birthday_yyyy = [];
  var birthday_mm = [];
  var months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

  // 現在の年を取得する
  var date = new Date();
  var this_year = date.getFullYear();
  var oldest_year = 1900;

  // 誕生年月の配列を自動生成
  for (var z = this_year; z >= oldest_year; z--) {
    var year = { var: z, txt: String(z) };
    birthday_yyyy.push(year);
  }
  for (var y = 1; y <= 12; y++) {
    var month = { var: y, txt: String(y) };
    birthday_mm.push(month);
  }
  // hamlの年と月のセレクトボックスに配列内容を反映させる
  for (var x = 0; x < birthday_yyyy.length; x++) {
    $("<option>", {
      value: birthday_yyyy[x].var,
      text: birthday_yyyy[x].txt
    }).appendTo('#select_birth_year');
  }
  for (var r = 0; r < birthday_mm.length; r++) {
    $("<option>", {
      value: birthday_mm[r].var,
      text: birthday_mm[r].txt
    }).appendTo('#select_birth_month');
  }

  // 年、もしくは月のセレクトボックスの中身に変更があったら日の内容を変更する
  $('#select_birth_year, #select_birth_month').change(function () {
    // 日が入っているセレクトボックスの中身を空っぽにする
    $('#select_birth_day').empty();
    // 日が入るセレクトボックスにデフォルト値の'--'を入れる
    $("<option>", {
      text: '--'
    }).appendTo('#select_birth_day');
    // ２月の日にち、すなわちmonths[1]を28にセットし直す
    months[1] = 28;
    //年と月に入力されている情報を取得する
    var year = $('#select_birth_year').val();
    var month = $("#select_birth_month").val();
    // yearとmonth共に数字が入力されている、すなわち共に'--'でないときに実行
    if (year != '--' && month != '--') {
      // monthに２月が選択されている時実行
      if (month == 2) {
        // yearが閏年の時、2月の日付が格納されているmonths[1]の値を29にする
        if (year % 4 == 0 && year % 100 == 0 && year % 400 == 0) {
          months[1] = 29;
        }
      }
      // 日を入れる配列を宣言し、閏年を考慮したデータを格納してhamlの日の
      // セレクトボックスに反映させる
      var birthday_dd = []
      for (var q = 1; q <= months[month - 1]; q++) {
        var day = { var: q, txt: String(q) };
        birthday_dd.push(day);
      }
      for (var p = 0; p < birthday_dd.length; p++) {
        $("<option>", {
          value: birthday_dd[p].var,
          text: birthday_dd[p].txt
        }).appendTo('#select_birth_day');
      };
    };
  });
})