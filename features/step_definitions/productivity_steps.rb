Given("I am on the productivity page") do
  visit(ProductivityPage)
  expect_the_number_of_entry_rows_to_equal 1
end

When("I click the add row button twice") do
  on(ProductivityPage) do |page|
    2.times { page.add_row }
  end
end

Then("there are three rows of entries") do
  expect_the_number_of_entry_rows_to_equal 3
end

When("I click the remove row button once") do
  on(ProductivityPage).remove_row
end

Then("there are two rows of entries") do
  expect_the_number_of_entry_rows_to_equal 2
end

def expect_the_number_of_entry_rows_to_equal(num)
  expect(on(ProductivityPage).hour_in_elements.size).to eq num
end