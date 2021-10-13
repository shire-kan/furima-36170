window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.round(priceInput.value * 0.1 );
    const saleProfit = document.getElementById("profit");
    saleProfit.innerHTML = Math.round(priceInput.value - Math.round(priceInput.value * 0.1 ))
  })
});