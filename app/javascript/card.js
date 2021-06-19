const pay = () => {
  // 公開鍵の情報
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY); 
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    // e.preventDefaultでもともとある送信処理をキャンセルしておく
    // ↑購入ボタンを押したらイベント発火する

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    // カード情報を取得し card変数に情報を代入
    const card = {
      number: formData.get("order[number]"),
      cvc: formData.get("order[cvc]"),
      exp_month: formData.get("order[exp_month]"),
      exp_year: `20${formData.get("order[exp_year]")}`,
    };

    // status→エラーが起きずにフォームが送信されたか判断する。,response→PAYJP側からのレスポンスを受け取る引数 
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      // カードの情報をサーバーサイドに送らないようにする

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);