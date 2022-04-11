window.addEventListener('load', function(){
  const inputPrice = document.getElementById("item-price");
  inputPrice.addEventListener('input', function(){
    const inputValue = inputPrice.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    const profitDom = document.getElementById("profit");
    profitDom.innerHTML = Math.floor(inputValue * 0.9);
  })
})