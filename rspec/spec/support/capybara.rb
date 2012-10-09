# By default, use webkit in javascript driver
Capybara.javascript_driver = :webkit
Capybara.default_host = "http://localhost"

require 'headless'
headless = Headless.new
headless.start

at_exit do
  headless.destroy
end

# capybara helpers
# wait for ajax completed
def wait_for_ajax
  wait_until { page.evaluate_script('jQuery.active === 0') }
rescue Capybara::TimeoutError
  flunk 'Ran out of time waiting for ajax request'
end

# overwrite this method for your modal
def modal_id
end

# wait for modal hidden
def wait_for_modal_hidden
  wait_until { !page.find(modal_id).visible? }
rescue Capybara::TimeoutError
  flunk 'Expected modal to be visible.'
end

# wait for modal visible
def wait_for_modal_visible
  wait_until { page.find(modal_id).visible? }
rescue Capybara::TimeoutError
  flunk 'Expected modal to be visible.'
end