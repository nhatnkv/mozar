class CartDecorator < Draper::Decorator
  delegate_all
  include Draper::LazyHelpers
  decorates_association :line_items

  def total_price
    line_items.to_a.sum(&:total_price)
  end

  def align_cart
    line_items.present? ? '' : 'center'
  end

  def no_item_or_update_item_request
    display_btn = line_items.present? ? 'block' : 'none'
    if display_btn == 'none'
      content_tag(:span, id: 'suggest-shopping') do
        link_to 'Go Shopping', root_path
      end
    else
      submit_tag 'Update Cart', class: 'pull-right btn btn-primary update-cart-btn'
    end
  end
end
