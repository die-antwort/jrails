# The following options can be changed by creating an initializer in config/initializers/jrails.rb

# jRails does NOT use jQuery.noConflict() by default
# to use jQuery.noConflict() , use:
# ActionView::Helpers::PrototypeHelper::JQUERY_VAR = 'jQuery'


ActionView::Helpers::AssetTagHelper.module_eval do 
  def yield_authenticity_javascript
<<JAVASCRIPT
<script type='text/javascript'>
 //<![CDATA[
   window._auth_token = '#{form_authenticity_token}';
  $(document).ajaxSend(function(event, xhr, s) {
    if (typeof(window._auth_token) == "undefined") return;
    if (s.data && s.data.match(new RegExp("\\bauthenticity_token="))) return;
    if (s.data)
      s.data += "&";
    else {
      s.data = "";
      xhr.setRequestHeader("Content-Type", s.contentType);
    }
    s.data += "authenticity_token=" + encodeURIComponent(window._auth_token);
  });
 //]]>
</script>
JAVASCRIPT
  end 

  def javascript_include_tag_with_jquery(*source)
    javascripts = []
    javascripts << javascript_include_tag_without_jquery(*source)
    javascripts << yield_authenticity_javascript if protect_against_forgery?
    javascripts.join("\n").html_safe
  end
  alias_method_chain :javascript_include_tag, :jquery
end
