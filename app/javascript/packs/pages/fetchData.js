const Rails = require('@rails/ujs');


async function fetchData(url,options={}, callbacks) {
    var myHeaders = new Headers();
    myHeaders.append("Content-Type", "application/x-www-form-urlencoded");
    var urlencoded = new URLSearchParams();
    urlencoded.append("authenticity_token", Rails.csrfToken())
    urlencoded.append('current_cart',options)
    var requestOptions = {
        method: 'POST',
        headers: myHeaders,
        body: urlencoded,
        redirect: 'follow'
    };
    try {
        const raw_response = await fetch(url, requestOptions);
        if (!raw_response.ok) { // check for the 404 errors
            throw new Error(raw_response.status);
        }
        const json_data = await raw_response.json();
        debugger
        callbacks(null, json_data);
    } catch (error) { // catch block for network errors
        callbacks(error);
    }
}
const _fetchData = fetchData;
export {
    _fetchData as fetchData
};


// document.addEventListener('ajax:success',function(){
//     console.log("it's done, Ajax is done")

// })