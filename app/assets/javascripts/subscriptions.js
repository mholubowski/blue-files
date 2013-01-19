// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var subscription;

jQuery(function() {
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));
  return subscription.setupForm();
});

subscription = {
  setupForm: function() {
                                                              console.log("step 2");
    return $('#new_subscription').submit(function() {
      $('input[type=submit]').attr('disabled', true);
                                                              console.log("step 3");
      subscription.processCard();
                                                              console.log("step 4");
      return false;
    });
  },
  processCard: function() {
    var card;
                                                              console.log("step 5");
    card = {
      number:   $('#card_number').val(),
      cvc:      $('#card_code').val(),
      expMonth: $('#card_month').val(),
      expYear:  $('#card_year').val()
    };
                                                              console.log("step 6");
    return Stripe.createToken(card, subscription.handleStripeResponse);
  },
  handleStripeResponse: function(status, response) {
    if (status === 200) {
                                                              console.log("step 7");
      return alert(response.id);
    } else {
                                                              console.log("step 8");
      return alert(response.error.message);
    }
  }
};