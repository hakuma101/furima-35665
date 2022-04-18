const pay = () => {
  Payjp.setPublicKey("pk_test_******************"); // PAY.JPテスト公開鍵
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

  });
};

window.addEventListener("load", pay);