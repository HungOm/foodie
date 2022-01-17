require('@rails/ujs');

import {onReady} from './util'

onReady(function(){


    const shipping_addresses = document.querySelector('#shipping_address');

    shipping_addresses.addEventListener('ajax:success',function(){
        localStorage.removeItem("cart");
    })

    // shipping_addresses.addEventListener('ajax:complete',function(){
    //     console.log("Failed")
    // })



})