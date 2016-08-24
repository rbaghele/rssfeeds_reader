var RSS = RSS || {}

RSS = (function($, window, document, RssFeedReader){
  RssFeedReader.FeedValidator = {
    init: function(){
      
      $.validator.addMethod(
        "regex",
        function(value, element, regexp) {
            var re = new RegExp(regexp);
            return this.optional(element) || re.test(value);
        },
        "Invalid format."
      );    
      
      $('#new_rss_feed, .edit_rss_feed').validate({
        rules: {
          'rss_feed[name]': {required: true},
          'rss_feed[url]': {required: true, regex: /^(ftp|http|https):\/\/[^ "]+$/}
        }
      });
      
      $('#new_rss_feed, .edit_rss_feed').validate({ 
        submitHandler: function(form) {  
                        if ($(form).valid()) 
                          form.submit(); 
                        return false; // prevent normal form posting
                      }
      });
    },
    
    bindEvents: function(){}
  },
  
  $(function(){
    RssFeedReader.FeedValidator.init();
    RssFeedReader.FeedValidator.bindEvents();
  });

  return RssFeedReader;
})(jQuery, this, this.document, RSS)

