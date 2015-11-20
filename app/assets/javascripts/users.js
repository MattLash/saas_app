$(document).ready(function(){
    Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));
    // Watch for a form submission
    $('#form-submit-btn').click(function(event){
        event.preventDefault();
        $('input[type=submit]').prop('disabled',true);
        var error = false;
        var ccNum = $('#card_number').val(),
            cvcNum = $('#card_code').val(),
            expMonth = $('#card_month').val(),
            expYear = $('#card_year').val();
            
        if (!error) {
            //get the stripe token!!
            Stripe.createToken({
                number: ccNum,
                cvc: cvcNum,
                exp_month: card_month,
                exp_year: card_year
            }, stripeResponseHandler);
        }
        return false;
    }); //form submission
    
    function stripeResponseHandler(status, response){
        //Get a reference to the form
        var f = $('#new_user');
        
        //Get the token from the response:
        var token = response.id;
        
        //Add the token to the form:
        f.append('<input type="hidden" name="user[stripe_card_token]" value="' + token + '" />');
        
        //submit the form:
        f.get(0).submit();
    }
});