module ActionView
  module Helpers
    module FormTagHelper

      def form_tag_with_sisyphus(url_for_options = {}, options = {}, &block)
        buf = ActiveSupport::SafeBuffer.new

        if options.has_key?(:id)
          buf.safe_concat("<script type=\"text/javascript\">$(document).ready(function() {$('##{options[:id]}').sisyphus();});</script>")
        end

        buf << form_tag_without_sisyphus(url_for_options, options, &block)
      end

      alias_method_chain :form_tag, :sisyphus
    end
  end
end