document.addEventListener(
  "DOMContentLoaded", e => {
    console.log("成功1")
    if (document.getElementById("token_submit") != null) { 
      console.log("成功2")//token_submitというidがnullの場合、下記コードを実行しない
      Payjp.setPublicKey("pk_test_b6057ed1e18293fb24feaa87"); //ここに公開鍵を直書き
      let btn = document.getElementById("token_submit"); //IDがtoken_submitの場合に取得されます
      btn.addEventListener("click", e => { //ボタンが押されたときに作動します
        e.preventDefault(); //ボタンを一旦無効化します
        let card = {
          number: document.getElementById("card_number").value,
          cvc: document.getElementById("cvc").value,
          exp_month: document.getElementById("exp_month").value,
          exp_year: document.getElementById("exp_year").value
          // number: document.getElementById("name.payment_card_no1").value,
          // cvc: document.getElementById("name.payment_card_no3").value,
          // exp_month: document.getElementById("payment_card_expire_mm.select-default").value,
          // exp_year: document.getElementById("payment_card_expire_yy.select-default").value
        }; //入力されたデータを取得します。
        Payjp.createToken(card, (status, response) => {
          if (status === 200) { 
            console.log("成功3")//成功した場合
            $("#card_number").removeAttr("name");
            $("#cvc").removeAttr("name");
            $("#exp_month").removeAttr("name");
            $("#exp_year").removeAttr("name"); //データを自サーバにpostしないように削除
            $("#card_token").append(
              $('<input type="hidden" name="payjp-token">').val(response.id)
            // $("#name.payment_card_no").removeAttr("name");
            // $("#name.payment_card_no3").removeAttr("name");
            // $("#payment_card_expire_mm.select-default").removeAttr("name");
            // $("#payment_card_expire_yy.select-default").removeAttr("name"); //データを自サーバにpostしないように削除
            // $("#card_token").append(
            //   $('<input type="hidden" name="payjp-token">').val(response.id)
            ); //取得したトークンを送信できる状態にします
            document.inputForm.submit();
            alert("登録が完了しました"); //確認用
          } else {
            alert("カード情報が正しくありません。"); //確認用
          }
        });
      });
    }
  },
  false
);