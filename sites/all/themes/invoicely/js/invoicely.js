jQuery(document).ready(function(){
    jQuery('.git-revision a.revision').hover(function(){
        var revision = jQuery(this);
        var temp = revision.text();
        revision.empty().append(revision.attr('title'));
        revision.attr('title', temp);
    }, function(){
        var revision = jQuery(this);
        var temp = revision.text();
        revision.empty().append(revision.attr('title'));
        revision.attr('title', temp);
    })
    jQuery('ul.menu > li').hover(function(){
        jQuery('ul.dropdown-menu', this).show();
    }, function(){
        jQuery('ul.dropdown-menu', this).hide();
    });
});