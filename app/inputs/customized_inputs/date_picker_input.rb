module CustomizedInputs
  class DatePickerInput < SimpleForm::Inputs::Base
    # include OptionsConverter

    def input
      @builder.text_field(attribute_name, input_html_options)
    end

    private

    def input_html_options
      value = @builder.object.send attribute_name
      value = I18n.localize value if value.present?

      convert_html_options super_options: super,
                           options: {
                             data: {
                               mask_format: I18n.t('simple_form.mask.date.format'),
                               mask_placeholder: I18n.t('simple_form.mask.date.placeholder')
                             }, class: 'mask',
                             value: value
                           }
    end
  end
end
