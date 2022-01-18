import * as _ from 'lodash';
// import { fetchData } from "./fetchData"
import { onReady,show_cart_button,hide_to_cart_button } from "./util";
import { removeObjectFromLocalStorage ,resetCartButton,resetFoodCard} from "./util";

 
export function createCart(){



  // <a href="http://localhost:3000/foods/${item.food_id}" class="w-8 h-4 m-2" title="${item.name}"><img alt="${item.name}" src="${item.image}" /></a>

  function shoppingCart() {
    let totalAmount = 0;
    let cartArray = JSON.parse(localStorage.getItem('cart')) || [];
    totalAmount = 0;
    document.querySelector(".total-amount").classList.remove("updated-amount");
    document.querySelector(".total-amount span").textContent = "0";
    document.querySelector(".cart-count").textContent = 0;
    document.querySelector(".disappear ul").innerHTML = "";
    if (cartArray.length > 0) {
      document.querySelector(".checkout").classList.remove("disabled");
      cartArray.map(function (item, food_id) {
        document.querySelector(".disappear ul").innerHTML += ` <li class="">
                  <div class="item flex flex-row">
                  <input type="hidden" value="${item.food_id}" id="itemId">

                      <div class="item-details text-md text-red-600"><span class="item-name"><a href="http://localhost:3000/foods/${item.food_id}"> ${item.name}</a></span>
                      <span class="arrival text-gray-600 text-sm">Quantity: ${item.quantity}</span>
                      <span class="price text-gray-600  text-sm">Price:  <span class="text-green-400 ">$${item.price}</span></span></div>
                      <button class="delete text-white  text-sm" id=${item.food_id} onClick="deletePrompt(this)" title="Remove item"><i class="far fa-trash-alt text-sm hover:text-red-600"></i></button>
                  </div>
              </li>`;
        document.querySelector(".cart-count").textContent = cartArray.length;
        totalAmount += item.price;
        document.querySelector(".total-amount").classList.add("updated-amount");
        document.querySelector(".total-amount span").textContent = totalAmount;
        document.querySelector(".checkout-btn").removeAttribute('disabled');

      });
    } else {
      document.querySelector(".total-amount").classList.add("updated-amount");
      document.querySelector(".checkout-btn").setAttribute('disabled','disabled');
      resetCartButton()
      document.querySelector(
        ".disappear ul"
      ).innerHTML += `<li><div class="item empty-cart"><p>Your cart is empty.</p></div></li>`;
    }
  }
  
  shoppingCart();
  function deletePrompt(e) {
    // resetCartButton(e.id)
    
    e.closest("li").classList.add("selected");
    promptYes(e)
  }
  


  function promptYes(e) {
    let food_id = e.closest("li.selected").querySelector("#itemId").value;
    removeObjectFromLocalStorage(food_id)
    document.querySelector("li.selected").classList.add("deleted");
    setTimeout(function () {
      shoppingCart();
    }, 500);

  }


  
  // function promptNo(e) {
  //   document.querySelector("li.selected").classList.add("cancelled");
  //   e.closest(".prompt").remove();
  //   shoppingCart();
  // }
  
  window.deletePrompt = deletePrompt;
  
  // window.promptNo = promptNo;
  window.promptYes = promptYes
  
  



}


  onReady(function(){ 
    createCart()
  })
 




