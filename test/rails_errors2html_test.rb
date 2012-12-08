require_relative '../lib/rails_errors2html.rb'
require_relative '../test/testing.rb'

Testing Errors2Html do

##
#
  testing 'simple rendering' do
    errors = ActiveModel::Errors.new(base = Map.new)
    errors.add :base, 'error on base'
    errors.add :field, 'error on field'

    expected = <<-__
      <div class="errors2html errors-summary">
        <h4 class="errors-caption">Sorry, we encountered some errors:</h4>

          <ul class="errors-global-list">
              <li class="errors-message">
                error on base
              </li>
          </ul>

          <dl class="errors-fields-list">
              <dt class="errors-title">
                Field
              </dt>
                <dd class="errors-message">
                  error on field
                </dd>
          </dl>
      </div>
    __

    assert{ compress(errors.to_html) == compress(expected) } 
    assert{ compress(errors) == compress(expected) } 
  end


##
#
  testing 'map-y errors' do
    errors = Map.new
    errors.set '*', 'error on base'
    errors.set 'field', 'error on field'
    errors.set 'a', 'b', 'c', %w'one two three'
    errors.extend(Errors2Html::Mixin)

    expected = <<-__
      <div class="errors2html errors-summary">
        <h4 class="errors-caption">Sorry, we encountered some errors:</h4>


          <ul class="errors-global-list">
              <li class="errors-message">
                error on base
              </li>
          </ul>


          <dl class="errors-fields-list">
              <dt class="errors-title">
                Field
              </dt>
                <dd class="errors-message">
                  error on field
                </dd>

              <dt class="errors-title">
                A B C
              </dt>
                <dd class="errors-message">
                  one
                </dd>

                <dd class="errors-message">
                  two
                </dd>

                <dd class="errors-message">
                  three
                </dd>

          </dl>
      </div>
    __

    assert{ compress(errors.to_html) == compress(expected) } 
    assert{ compress(errors) == compress(expected) } 
  end

protected
  def compress(*strings)
    strings.flatten.compact.join.gsub(/\s+/, '')
  end
end
