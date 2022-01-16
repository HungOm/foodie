import * as _ from 'lodash'
import {
    createCart
} from './createCart';
export function incrementValue(food_id) {
    let input = document.getElementById(`number-input-${food_id}`)
    var value = parseInt(input.value, 10);
    value = isNaN(value) ? 1 : value;
    value++;
    input.value = value;
    extractFoodInfoAndUpdate(food_id)
    createCart();
}

export function decrementValue(food_id) {
    let input = document.getElementById(`number-input-${food_id}`)
    var value = parseInt(input.value, 10);
    value = isNaN(value) ? 1 : value;
    value--;
    input.value = value;

    if(value<1){
        resetFoodCard(food_id);
        removeObjectFromLocalStorage(food_id)
        createCart();

        return;

    }

    extractFoodInfoAndUpdate(food_id)
    createCart();
}


export function extractFoodInfoAndUpdate(food_id) {
    let food = {}
    let name = document.getElementById(`food-name-${food_id}`).textContent;
    let quantity = document.getElementById(`number-input-${food_id}`).value;
    let price = document.getElementById(`food-price-${food_id}`).textContent;
    food["name"] = name;
    food['quantity'] = parseInt(quantity)
    food['price'] = parseInt(price) * food['quantity']
    food['food_id'] = parseInt(food_id)
    updateLocalStorageObjectAttrs(food, food_id);
    // storeCartInLocalStrage(food)
}
export const storeCartInLocalStrage = (object) => {
    var oldItems = JSON.parse(localStorage.getItem('cart')) || [];
    oldItems.push(object);
    localStorage.setItem('cart', JSON.stringify(oldItems));
}
export const updateLocalStorageObjectAttrs = (foodObject) => {
    var data = JSON.parse(localStorage.getItem('cart')) || [];
    var index = -1
    data.forEach(function (food, i) {
        if (food.food_id === foodObject.food_id) {
            index = i
        }
    });
    if (index !== -1) {
        data[index] = foodObject
    } else {
        data.push(foodObject)
    }
    localStorage.setItem('cart', JSON.stringify(data));
}
export const removeObjectFromLocalStorage = (object_id) => {
    var data = JSON.parse(localStorage.getItem('cart')) || [];
    if (!_.isEmpty(data)) {
        var updatedData = _.filter(data, _.conforms({
            'food_id': function (n) {
                return n != object_id;
            }
        }));
        localStorage.setItem('cart', JSON.stringify(updatedData));
    } else {
        localStorage.removeItem("cart");
    }
    return;
}
export const toggleModal = () => {
    document.getElementById('modal').classList.toggle('hidden')
}
export const hide_to_cart_button = (x) => {
    if (!user_logged_in()) {
        toggleModal();
        return;
    }
        x.classList.remove('add')
        x.classList.add("added", "hidden")
   
}

export const show_cart_button = (x) => {
    x.classList.remove('added','hidden')
    x.classList.add('add')
}

export const resetFoodCard = (food_id)=>{
    let showBtn = document.querySelector(`#add-button-${food_id}`)
    let hideBtn = document.querySelector(`#added-button-${food_id}`)
    document.querySelector(`#number-input-${food_id}`).value = 1;
    show_cart_button(showBtn);
    hide_to_cart_button(hideBtn)

}


export const user_logged_in = () => {
    let user = document.querySelector('#user_status');
    return user.value == 'signed_in'
}
export const resetCartButton = () => {
    let catButtons = document.querySelectorAll('.cart-button')
    // cartButtons.
    for (var i = 0; i < catButtons.length; i++) {
        const [showBtn,hideBtn,] = [...catButtons[i].children].slice(0,3);
        hide_to_cart_button(hideBtn);
        show_cart_button(showBtn);

    }
}
// wait for 10 miliseconds after dom loaded to access dom contents 
export function onReady(yourMethod) {
    var readyStateCheckInterval = setInterval(function () {
        if (document && document.readyState === 'complete') { // Or 'interactive'
            clearInterval(readyStateCheckInterval);
            yourMethod();
        }
    }, 10);
}

// clearn up search DOM 
export const DomCleanUp = () => {
    const resultsWrapper = document.querySelector('#results');
    // const resultDom = document.createElement('div');
    // resultDom.innerHTML = '';
    resultsWrapper.innerHTML = '';
    resultsWrapper.classList.add('hidden')
    return;
};

export const cleanOnClick = ()=>{
    DomCleanUp()
}

window.incrementValue = incrementValue
window.decrementValue = decrementValue
window.cleanOnClick = cleanOnClick
