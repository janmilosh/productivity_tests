Given(/^I am on the productivity page$/) do
  visit(ProductivityPage)
  expect(on(ProductivityPage).entry_elements.size).to eq 1
end

When(/^I click the add row button (\d+) times?$/) do |int|
  int.times { on(ProductivityPage).add_row }
end

Then(/^there (are|is) (\d+) rows? of entries$/) do |x, num|
  expect(on(ProductivityPage).entry_elements.size).to eq num
end

When(/^I click the remove row button (\d+) times?$/) do |num|
  num.times { on(ProductivityPage).remove_row }
end

When(/^in row (\d+), I enter time in of (\w+:\w+) and time out of (\w+:\w+)$/) do |row_num, time_in, time_out|
  time_in = time_in.split(":")
  time_out = time_out.split(":")
  on(ProductivityPage).enter_complete_time_for row_num, time_in + time_out
end

When(/^in row (\d+), I enter time in of (\w+:\w+)$/) do |row_num, time_in|
  time_in = time_in.split(":")
  on(ProductivityPage).enter_time_in_for row_num, time_in
end

Then(/^I enter (\d+) treatment minutes$/) do |minutes|
  on(ProductivityPage).enter_tx_minutes minutes
end

Then (/^I enter (\d+.?\d)% productivity$/) do |productivity|
  on(ProductivityPage).enter_productivity productivity
end

Then (/^the time out is (\w+:\w+)$/) do |time|
  on(ProductivityPage) do |page|
    expect(page.get_clock_out_time).to eq time
  end
end

Then(/^the productivity is (\d+.?\d)%$/) do |productivity|
  on(ProductivityPage) do |page|
    expect(page.get_percent_productivity).to eq productivity
  end
end

Then (/^row (\d+) minutes is (\d+)$/) do |row, min|
  on(ProductivityPage) do |page|
    expect(page.entry_minutes_for row).to eq min
  end
end

Then (/^Tx minutes is invalid$/) do
  on(ProductivityPage) do |page|
    expect(page.tx_minutes_invalid?).to eq true
  end
end

Then (/^Productivity is invalid$/) do
  on(ProductivityPage) do |page|
    expect(page.productivity_invalid?).to eq true
  end
end

Then (/^I click Productivity$/) do
  on(ProductivityPage).get_productivity
end

Then (/^I click Clock Out$/) do
  on(ProductivityPage).get_clock_out
end
