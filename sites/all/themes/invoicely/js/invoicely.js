jQuery(document).ready(function(){
    jQuery('ul.menu > li').hover(function(){
        jQuery('ul.dropdown-menu', this).show();
    }, function(){
        jQuery('ul.dropdown-menu', this).hide();
    });
});