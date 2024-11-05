# HexletCode

[![Ruby](https://github.com/frontstall/rails-project-63/actions/workflows/main.yml/badge.svg)](https://github.com/frontstall/rails-project-63/actions/workflows/main.yml)

## Installation

Clone repo to local machine, then run:

    ```sh
    $ gem build /path/to/repo/hexlet_code.gemspec
    $ gem install /path/to/repo/hexlet_code-0.1.0.gem 
    ```

## Usage

    ```ruby
    require 'hexlet_code'

    Struct.new 'User', :name, :job, :gender, keyword_init: true
    user = Struct::User.new name: 'Vasyan', job: 'Hexlet', gender: 'male'

    form = HexletCode.form_for user do |f|
        f.input :name, class: 'user-input'
        f.input :job
        f.submit 'Custom submit text'
    end

    puts form
    ```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HexletCode project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/frontstall/hexlet_code/blob/main/CODE_OF_CONDUCT.md).

### Hexlet tests and linter status

[![Actions Status](https://github.com/frontstall/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/frontstall/rails-project-63/actions)
