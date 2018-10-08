/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

// '.tbl-content' consumed little space for vertical scrollbar, scrollbar width 
// depend on browser/os/platfrom. Here calculate the scollbar width .

$(window).on("load resize ", function() {
  var scrollWidth = $('.tbl-content').width() - $('.tbl-content table').width();
  $('.tbl-header').css({'padding-right':scrollWidth});
}).resize();


//for hiding button below table
function show2()
{
  document.getElementById('divbutton').style.display = 'block';
}

function myFunction() 
{
    if (document.getElementById("id1").validity.rangeOverflow) 
    {
        document.getElementById("id1").setCustomValidity("Amount is in excess of the outstanding fees!");
    }
}