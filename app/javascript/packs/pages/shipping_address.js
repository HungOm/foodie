require('@rails/ujs');

import {onReady} from './util'

onReady(function(){


    const shipping_addresses = document.querySelector('#shipping_address');
    debugger

    shipping_addresses.addEventListener('ajax:success',function(){
        localStorage.removeItem("cart");
    })



})