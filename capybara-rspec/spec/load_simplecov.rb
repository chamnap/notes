require 'simplecov'

class SimpleCov::Formatter::MergedFormatter
  def format(result)
    puts SimpleCov::Formatter::SimpleFormatter.new.format(result)
    puts SimpleCov::Formatter::HTMLFormatter.new.format(result)
  end
end

# run tests with test coverage and print out results in console
if ENV["COVERAGE"]
  SimpleCov.formatter = SimpleCov::Formatter::MergedFormatter
  
  SimpleCov.start 'rails' do
    add_filter "vendor/gems"
  end
  
  SimpleCov.at_exit do
    puts "Coverage Done."
    SimpleCov.result.format!
  end
end