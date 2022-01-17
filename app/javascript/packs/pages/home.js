import { createCart ,items_array,addOrRemoveItemsFromCart} from './createCart';
import { 
    extractFoodInfoAndUpdate,
    toggleModal,
    show_cart_button,hide_to_cart_button,
    onReady,
    DomCleanUp ,
    user_logged_in} from './util';


// import * as _  from 'lodash';
const _ = require('lodash');
const {
    fetchData
} = require("./fetchData");

require('./util')

const baseUrl = window.location.origin;



// update search result 
function updateValue(word) {
    let searchUrl = baseUrl + '/search?'
    let url = new URL(searchUrl)
    url.searchParams.set('query', word)
    return search(url)
}



// search function 
async function search(url) {
    DomCleanUp();
    await delay(500);
    try {
        const raw_response = await fetch(url);
        if (!raw_response.ok) { // check for the 404 errors
            throw new Error(raw_response.status);
        }
        const json_data = await raw_response.json();
        console.log(json_data);
        const resultsWrapper = document.querySelector('#results');
        resultsWrapper.innerHTML = '';
        for (let data of json_data) {
            resultsWrapper.classList.remove('hidden')
            resultsWrapper.appendChild(injectToDom(data, baseUrl));
        }
    } catch (error) { // catch block for network errors
        console.log(error);
    }
    return;
}

// create search result dom 
const injectToDom = (data, baseUrl) => {
    const hr = document.createElement('hr')
    const resultDom = document.createElement('div');
    const resultLink = document.createElement('a');
    const resultTitle = document.createElement('h1');
    // resultLink.classList.add('')
    const resultDescription = document.createElement('div');
    const spannedText = document.createElement('span')
    const img = document.createElement('img');
    spannedText.setAttribute('class', 'description-text w-8/12 items-center')
    spannedText.innerText = data.description + data.id
    img.setAttribute('class', 'search-image w-4/12 rounded-lg')
    img.src = data.image_url
    hr.setAttribute('width', '80%')
    resultDescription.classList.add('flex', 'flex-row')
    resultDescription.appendChild(spannedText)
    resultDescription.appendChild(img)
    resultDom.classList.add('result-item', 'drop-shadow-2xl');
    resultLink.setAttribute('href', `${baseUrl}/foods/${data.id}`)
    resultLink.setAttribute('id', `search-${data.id}`)
    resultTitle.setAttribute('class', 'text-2xl p-2');
    resultTitle.textContent = data.name
    // resultLink.textContent = data.name
    resultLink.classList.add('result-link')
    resultLink.appendChild(resultTitle);
    // resultDom.classList.add('result-link');
    resultDom.appendChild(resultDescription);
    resultLink.appendChild(resultDom);
    // resultDom.appendChild(resultLink)
    return resultLink
}






// call the works 
onReady(function () {
    DomCleanUp();
    var searchInput = document.querySelector('#search-input');
    let cancelModal = document.querySelector('#modal-cancel');
    cancelModal.addEventListener('click',()=>{
        toggleModal();
    })
    searchInput.addEventListener('keyup', function (e) {
        console.log(e.target.value)
        e.preventDefault();
        updateValue(e.target.value)
    });
    if (!user_logged_in()) {
        localStorage.removeItem('cart')
    }

    createCart()


    // ==========
    const links = document.querySelectorAll(
        ".add_cart"
    );
    links.forEach((el) => {
        el.addEventListener('click', function (e) {
            e.stopImmediatePropagation();
            e.preventDefault();

            if (e.target !== e.currentTarget) return;
            if (!user_logged_in()) {
                toggleModal();
                // localStorage.removeItem('cart')
                return;
            }
            let element = e.target
            let food_id = get_food_id(element.children[0])

            extractFoodInfoAndUpdate(food_id);
            // creating shopping cart 
            createCart();
            const [hideBtn,showBtn] = [...element.children].slice(0,3)
            hide_to_cart_button(hideBtn)
            show_cart_button(showBtn)

        })
        return;
    })


    const checkbtn = document.querySelector('#btn');
        addToCart(checkbtn)

    // =======================



})





const addToCart = (checkBtn)=>{
  
    checkBtn.addEventListener('click',function(e){
        e.stopImmediatePropagation();
        e.preventDefault();
            let fullUrl =`http://localhost:3000/add_to_cart`
            let postData = localStorage.getItem('cart')||'';
              
        fetchData(fullUrl,postData,function(err,data){
            if(!err){

              window.location =`http://localhost:3000/shipping_addresses/new`
            }else{
                console.log("error: "+err)
            }
    
        })


    })
       

}

const get_food_id = (element) => {
    let food_id = element.firstElementChild.dataset['params'].split('=')[1];
    return food_id
}








window.addEventListener('click', DomCleanUp)

const delay = ms => new Promise(res => setTimeout(res, ms));
