const pay = () => {
  Payjp.setPublicKey("pk_test_fc7d31ab4ebff85a1808cf71");
  const submit = document.getElementById("button");
  submit.addEventListener("click",(e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_deliverys[number]"),
      exp_month: formData.get("order_deliverys[exp_month]"),
      exp_year: `20${formData.get("order_deliverys[exp_year]")}`,
      cvc: formData.get("order_deliverys[cvc]"),
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200 ) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name=token type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

        document.getElementById("order_deliverys_number").removeAttribute("name");
        document.getElementById("order_deliverys_exp_month").removeAttribute("name");
        document.getElementById("order_deliverys_exp_year").removeAttribute("name");
        document.getElementById("order_deliverys_cvc").removeAttribute("name");

        document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load",pay);