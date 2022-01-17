import { 
    onReady,
 } from "./util";



// const menuButton = document.querySelector('#menu-button');

onReady(()=>{

const overlay = document.querySelector('#overlay');
const nav1 =document.querySelector('#nav-1') ;
const nav2 =document.querySelector('#nav-2');
const nav3 =document.querySelector('#nav-3'); 
// const nav4 =document.querySelector('#nav-4'); 
// const nav5 =document.querySelector('#nav-5');
const menuBars = document.querySelector('#menu-bars');

// #toggle nav e.g => open/close 
const toggleNav = ()=>{
    menuBars.classList.toggle('change')
    overlay.classList.toggle('overlay-active')
    if(overlay.classList.contains('overlay-active')){
      
      overlay.classList.remove('overlay-slide-left');
      overlay.classList.add('overlay-slide-right');
      // animate slide in 
      nav1.classList.remove('slide-out-1')
      nav1.classList.add('slide-in-1')
  
  
      nav2.classList.remove('slide-out-2')
      nav2.classList.add('slide-in-2')
  
      nav3.classList.remove('slide-out-3')
      nav3.classList.add('slide-in-3')
  

  
    }else{
      overlay.classList.remove('overlay-slide-right');
      overlay.classList.add('overlay-slide-left');
  
      // animate slide out
      nav1.classList.remove('slide-in-1')
      nav1.classList.add('slide-out-1')
  
  
      nav2.classList.remove('slide-in-2')
      nav2.classList.add('slide-out-2')
  
      nav3.classList.remove('slide-in-3')
      nav3.classList.add('slide-out-3')

 
  
    }
  
}


menuBars.addEventListener('click',toggleNav);
nav1.addEventListener('click',toggleNav);
nav2.addEventListener('click',toggleNav);
nav3.addEventListener('click',toggleNav);
// nav4.addEventListener('click',toggleNav);
// nav5.addEventListener('click',toggleNav);


})