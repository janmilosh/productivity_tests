class ProductivityPage
  include PageObject

  page_url 'http://localhost:8000/'

  text_field(:tx_minutes, id: 'tx-minutes')
  text_field(:productivity, id: 'productivity')

  text_fields(:hour_in, class: 'hour-in')
  text_fields(:min_in, class: 'min-in')
  text_fields(:hour_out, class: 'hour-out')
  text_fields(:min_out, class: 'min-out')

  button(:add_row, id: 'add-row')
  button(:remove_row, id: 'remove-row')
  button(:get_productivity, id: 'get-productivity')
  button(:get_clockout, id: 'get-clockout')

  def enter_hour_in_for(num, value)
    hour_in_elements[num - 1] = value
  end

  def enter_min_in_for(num, value)
    min_in_elements[num - 1] = value
  end

  def enter_hour_out_for(num, value)
    hour_out_elements[num -1] = value
  end

  def enter_min_out_for(num, value)
    min_out_elements[num - 1] = value
  end
end