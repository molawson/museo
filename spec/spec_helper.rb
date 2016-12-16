require "museo"
require "pry"
require "awesome_print"

Museo.clear_configuration!
Museo.configuration.generation_disabled = false

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    if expectations.respond_to?(:include_chain_clauses_in_custom_matcher_descriptions)
      expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    end
  end

  config.mock_with :rspec do |mocks|
    if mocks.respond_to?(:verify_partial_doubles)
      mocks.verify_partial_doubles = true
    end
  end

  if config.respond_to?(:treat_symbols_as_metadata_keys_with_true_values)
    config.treat_symbols_as_metadata_keys_with_true_values = true
  end

  # These two settings work together to allow you to limit a spec run
  # to individual examples or groups you care about by tagging them with
  # `:focus` metadata. When nothing is tagged with `:focus`, all examples
  # get run.
  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  if config.respond_to?(:example_status_persistence_file_path)
    # Allows RSpec to persist some state between runs in order to support
    # the `--only-failures` and `--next-failure` CLI options. We recommend
    # you configure your source control system to ignore this file.
    config.example_status_persistence_file_path = "spec/reports/examples.txt"
  end

  if config.respond_to?(:disable_monkey_patching!)
    # Limits the available syntax to the non-monkey patched syntax that is
    # recommended. For more details, see:
    #   - http://rspec.info/blog/2012/06/rspecs-new-expectation-syntax/
    #   - http://www.teaisaweso.me/blog/2013/05/27/rspecs-new-message-expectation-syntax/
    #   - http://rspec.info/blog/2014/05/notable-changes-in-rspec-3/#zero-monkey-patching-mode
    config.disable_monkey_patching!
  end

  # Many RSpec users commonly either run the entire suite or an individual
  # file, and it's useful to allow more verbose output when running an
  # individual spec file.
  if config.files_to_run.one?
    # Use the documentation formatter for detailed output,
    # unless a formatter has already been configured
    # (e.g. via a command-line flag).
    config.default_formatter = 'doc'
  end

  # Print the 10 slowest examples and example groups at the
  # end of the spec run, to help surface which specs are running
  # particularly slow.
  config.profile_examples = 10

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = :random

  # Seed global randomization in this process using the `--seed` CLI option.
  # Setting this allows you to use `--seed` to deterministically reproduce
  # test failures related to randomization by passing the same `--seed` value
  # as the one that triggered the failure.
  Kernel.srand config.seed
end
