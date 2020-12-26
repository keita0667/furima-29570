function Sprice (){
  const price_input = document.getElementById("item-price");
  price_input.addEventListener("keyup", () =>{
    const price =price_input.value;
    const fee = document.getElementById("add-tax-price");
    const profit = document.getElementById('profit');
    const fee_price = price * 0.1;
    const HTML_fee =`
    <span id='add-tax-price'>
    ${Math.round(fee_price)}
    </span>`
    const HTML_profit =`
    <span id='profit'>
    ${Math.round(price - fee_price)}
    </span>`
    fee.innerHTML = HTML_fee;
    profit.innerHTML = HTML_profit;
  });
}

window.addEventListener("load", Sprice)