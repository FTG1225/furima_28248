const pay = () => {
  console.log('OK')
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    const card = {
      number: document.getElementById("number").value,
      cvc: document.getElementById("cvc").value,
      exp_month: document.getElementById("exp_month").value,
      exp_year: `20${document.getElementById("exp_year").value}`
    };
    console.log(card)
    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
  
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        // debugger;
        document.getElementById("number").removeAttribute("name");
        document.getElementById("cvc").removeAttribute("name");
        document.getElementById("exp_month").removeAttribute("name");
        document.getElementById("exp_year").removeAttribute("name");

        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
      } else {
        let inputElement = document.querySelector('input[name="commit"]');
        inputElement.disabled = false;
        alert(`Error Credit Card can't be blank!`);
        return null; 
        // document.getElementById("charge-form").submit();
        // document.getElementById("charge-form").reset();
      }
    });
  });
};

window.addEventListener("load", pay);