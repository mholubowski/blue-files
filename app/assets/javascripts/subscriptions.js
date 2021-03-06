// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var subscription;

// Toggling plans
jQuery(function() {
  $('.plan').click(function(){
    $('.plan').removeClass("active");
    $(this).addClass("active");
  })
  $('#plan1').click(function(){
    $('#subscription_plan').val(0);
    $('#plan-selected').html('Free');
  })

  $('#plan2').click(function(){
    $('#subscription_plan').val(1);
    $('#plan-selected').html('Pro');
  })

  $('#plan3').click(function(){
    $('#subscription_plan').val(2);
    $('#plan-selected').html('Extra');
  })

  


  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));
  return subscription.setupForm();
});

subscription = {
  setupForm: function() {
    return $('#new_subscription').submit(function() {
      $('input[type=submit]').attr('disabled', true);
      subscription.processCard();
      return false;
    });
  },
  processCard: function() {
    var card;
    card = {
      number:   $('#card_number').val(),
      cvc:      $('#card_code').val(),
      expMonth: $('#card_month').val(),
      expYear:  $('#card_year').val()
    };
    return Stripe.createToken(card, subscription.handleStripeResponse);
  },
  handleStripeResponse: function(status, response) {
    if (status === 200) {
      // return alert(response.id);
      $('#subscription_stripe_card_token').val(response.id);
      $('#new_subscription')[0].submit();
    } else {
      $('#stripe_error').text(response.error.message);
      $('input[type=submit]').attr('disabled', false);
    }
  }
};

