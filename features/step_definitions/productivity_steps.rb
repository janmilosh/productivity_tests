Given("I am on the productivity page") do
  visit(ProductivityPage)
  expect_the_number_of_entry_rows_to_equal 1
end

When(/^I click the add row button (\d+) times?$/) do |int|
  int.times { on(ProductivityPage).add_row }
end

Then(/^there (are|is) (\d+) rows? of entries$/) do |x, num|
  expect_the_number_of_entry_rows_to_equal num
end

When(/^I click the remove row button (\d+) times?$/) do |num|
  num.times { on(ProductivityPage).remove_row }
end

When(/^in row (\d+), I enter time in of (\w+:\w+)$/) do |int, time_in|
  time_in = time_in.split(":")
  on(ProductivityPage).enter_time_in_for 2, time_in
end

When(/^in row (\d+), I enter time in of (\w+:\w+) and time out of (\w+:\w+)$/) do |row_num, time_in, time_out|
  time_in = time_in.split(":")
  time_out = time_out.split(":")
  on(ProductivityPage).enter_complete_time_for row_num, time_in + time_out
end

Then(/^I enter (\d+) treatment minutes$/) do |minutes|
  on(ProductivityPage).enter_tx_minutes minutes
end

Then (/^I enter (\d+)% productivity$/) do |productivity|
  on(ProductivityPage).enter_productivity productivity
end

Then (/^the time out is (\w+:\w+)$/) do |time|
  on(ProductivityPage) do |page|
    expect(page.get_clock_out_time).to eq time
  end
end

Then (/^row (\d+) minutes equals (\d+)$/) do |row, min|
  on(ProductivityPage) do |page|
    expect(page.entry_minutes_for row).to eq min
  end
end

def expect_the_number_of_entry_rows_to_equal(num)
  expect(on(ProductivityPage).entry_elements.size).to eq num
end
