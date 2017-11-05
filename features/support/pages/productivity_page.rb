class ProductivityPage
  include PageObject

  page_url 'http://localhost:8000/'

  rows(:entry, class: 'entry')
  elements(:entry_minutes, css: 'td.minutes')

  text_field(:tx_minutes, id: 'tx-minutes')
  text_field(:productivity, id: 'productivity')

  text_fields(:hour_in, class: 'hour-in')
  text_fields(:min_in, class: 'min-in')
  text_fields(:hour_out, class: 'hour-out')
  text_fields(:min_out, class: 'min-out')

  button(:add_row, id: 'add-row')
  button(:remove_row, id: 'remove-row')
  button(:get_productivity, id: 'get-productivity')
  button(:get_clock_out, id: 'get-clockout')

  def enter_complete_time_for(num, arr)
    enter_time_in_for num, [arr[0], arr[1]]
    enter_time_out_for num, [arr[2], arr[3]]
  end

  def enter_time_in_for(num, arr)
    enter_hour_in_for num, arr[0]
    enter_min_in_for num, arr[1]
  end

  def enter_time_out_for(num, arr)
    enter_hour_out_for num, arr[0]
    enter_min_out_for num, arr[1]
  end

  def enter_hour_in_for(num, value)
    hour_in_elements[num - 1].value = value
  end

  def enter_min_in_for(num, value)
    min_in_elements[num - 1].value = value
  end

  def enter_hour_out_for(num, value)
    hour_out_elements[num - 1].value = value
  end

  def enter_min_out_for(num, value)
    min_out_elements[num - 1].value = value
  end

  def hour_out_for(num)
    hour_out_elements[num - 1].value
  end

  def min_out_for(num)
    min_out_elements[num - 1].value
  end

  def enter_tx_minutes(value)
    tx_minutes_element.value = value
  end

  def enter_productivity(value)
    productivity_element.value = value
  end

  def get_clock_out_time
    get_clock_out
    row = entry_elements.size
    hour = hour_out_for row
    min = min_out_for row
    "#{hour}:#{min}"
  end

  def entry_minutes_for(row)
    entry_minutes_elements[row - 1].inner_html.to_i
  end
end