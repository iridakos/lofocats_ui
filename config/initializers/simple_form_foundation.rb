SimpleForm.setup do |config|
  config.wrappers :vertical_form, class: :input, hint_class: :field_with_hint, error_class: :error do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label_input
    b.use :error, wrap_with: { tag: :small, class: :error }
  end

  config.wrappers :horizontal_form, tag: 'div', class: 'row', hint_class: :field_with_hint, error_class: :error do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly

    b.wrapper :label_wrapper, tag: :div, class: 'small-3 columns' do |ba|
      ba.use :label, class: 'right inline'
    end

    b.wrapper :right_input_wrapper, tag: :div, class: 'small-9 columns' do |ba|
      ba.use :input
      ba.use :error, wrap_with: { tag: :small, class: :error }
    end
  end

  config.wrappers :horizontal_radio_and_checkboxes, tag: 'div', class: 'row' do |b|
    b.use :html5
    b.optional :readonly

    b.wrapper :container_wrapper, tag: 'div', class: 'small-offset-3 small-9 columns' do |ba|
      ba.wrapper tag: 'label', class: 'checkbox' do |bb|
        bb.use :input
        bb.use :label_text
      end

      ba.use :error, wrap_with: { tag: :small, class: :error }
    end
  end

  config.wrappers :inline_form, tag: 'div', class: 'column small-4', hint_class: :field_with_hint, error_class: :error do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly

    b.use :label, class: 'hidden-for-small-up'
    b.use :input

    b.use :error, wrap_with: { tag: :small, class: :error }
  end

  config.wrappers :customizable_wrapper, tag: 'div', error_class: :error do |b|
    b.use :html5
    b.optional :readonly

    b.wrapper :custom_wrapper, tag: :div do |ba|
      ba.use :label_input
    end

    b.use :error, wrap_with: { tag: :small, class: :error }
  end

  config.button_class = 'button'

  config.item_wrapper_tag = :div

  config.error_notification_class = 'alert-box alert'

  config.default_wrapper = :vertical_form
end
