// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

//function for removing
function removeNewRow(elem){
    $(elem).parents('li').remove();
    return false;
}

function removeNewContact(elem){
    $(elem).parents('li').remove();
    return false;
}

//function for show/hide new - this doesn't work will need to '
function toggleNewRow(elem){
    if ($(elem).hasClass('show')){
        $(elem).siblings('div').slideDown(150);
        aTxt = $(elem).text();
        aTxt = aTxt.replace('Show','Hide');
        $(elem).text(aTxt);
        $(elem).removeClass('show'); 
    } else {
        $(elem).siblings('div').slideUp(150);
        aTxt = $(elem).text();
        aTxt = aTxt.replace('Hide','Show');
        $(elem).text(aTxt);
        $(elem).addClass('show'); 
                
    }
    return false; 
}

    //show and hide existing licensors
    $(document).ready(function(){
        $('a.show').toggle(
        function () {
            var aTxt = $(this).text();
            aTxt = aTxt.replace('Show','Hide');
            $(this).text(aTxt);
            $(this).siblings('div').slideDown(150);
            $(this).siblings('ul').slideDown(150);
            $(this).addClass('hide');
            return false;
        },
        function () {
            var aTxt = $(this).text();
            aTxt = aTxt.replace('Hide','Show');
            $(this).text(aTxt);
            $(this).siblings('div').slideUp(150);
            $(this).siblings('ul').slideUp(150);
            $(this).removeClass('hide');
            return false;
        }
    );
        $('body.rights a.add').click(function(){
            $(this).remove();
        });
    
        //set input.destroy value to 1 and hide fields
        $('a.destroy').click(function () { 
            $(this).siblings('div.licensorSourcingDetail').children('input.destroy').val('1');
            $(this).siblings('input.destroy').val('1');
            $(this).parents('li').hide();
            return false;
        });

        //datepicker
        $(function()
        {
            $('.selectDate').datePicker({startDate:'1930-01-01'});
        });

        //highlight table rows
        $('tr').hover(
        function () {
            $(this).addClass('highlight');
        }, 
        function () {
            $(this).removeClass('highlight');
        }
    );
        //select list contacts for licensors

        $('#licensor_contact_ids').asmSelect({
            listType:'ul',
            addItemTarget: 'bottom',
            animate: true,
            highlight: true,
            sortable: true
        });
        
        //select list titles for profiles
         $('#profile_title_ids').asmSelect({
            listType:'ul',
            addItemTarget: 'bottom',
            animate: true,
            highlight: true,
            sortable: true
        });

    });



