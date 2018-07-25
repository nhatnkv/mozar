class CartDecorator < Draper::Decorator
  delegate_all
  include Draper::LazyHelpers
  decorates_association :line_items
  
  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

  def no_item_or_update_item_request display_btn
    if display_btn == 'none'
      content_tag(:span, id: 'suggest-shopping') do
        link_to 'Go Shopping', root_path
      end     
    else
      submit_tag 'Update Cart', class: 'pull-right btn btn-primary update-cart-btn'
    end
  end
end
