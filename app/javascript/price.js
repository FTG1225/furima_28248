function input() {
  const price = document.getElementById("item-price");
  const tax = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');
  const min_price = 300;
  const max_price = 9999999;

  price.addEventListener('keyup', function(e) {
    const form = this.value;
    const yen = parseInt(form);
    if (yen < min_price) return false;
    if (yen > max_price) return false;

    let fee = Math.floor(yen * 0.1);
    tax.textContent = fee;
    profit.textContent = yen - fee;
    e.preventDefault
  })
}
window.addEventListener("load", input);