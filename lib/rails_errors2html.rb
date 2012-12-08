module Errors2Html
  VERSION = '1.0.1'

  def Errors2Html.version
    Errors2Html::VERSION
  end

  def Errors2Html.dependencies
    {
      'map' => [ 'map'           , ' >= 6.2.0' ],
      'rails_view' => [ 'rails_view'           , ' >= 1.0.1' ]
    }
  end
    
  begin
    require 'rubygems'
  rescue LoadError
    nil
  end

  Errors2Html.dependencies.each do |lib, dependency|
    gem(*dependency) if defined?(gem)
    require(lib)
  end

  class << Errors2Html
    attr_accessor :template
  end

  def Errors2Html.to_html(*args)
    args.flatten!
    args.compact!

    at_least_one_error = false

    errors = Map.new
    errors[:global] = []
    errors[:fields] = {}

    args.each do |e|
      e.each do |key, messages|
        key = key.to_s

        Array(messages).each do |message|
          at_least_one_error = true

          list =
            if key =~ /\A(?:[*]|base)\Z/iomx
              errors[:global] ||= []
            else
              errors[:fields][key] ||= []
            end

          list.push(message.to_s).uniq!
        end
      end
    end

    return "" unless at_least_one_error

    locals = {
      :errors => errors,
      :global_errors => errors.global,
      :fields_errors => errors.fields
    }

    if template
      View.render(:template => template, :locals => locals)
    else
      View.render(:inline => Template, :locals => locals)
    end
  end

  def to_html
    Errors2Html.to_html(self)
  end

  def to_s
    to_html
  end

  Template = <<-erb
    <div class="errors2html errors-summary">
      <h4 class="errors-caption">Sorry, we encountered some errors:</h4>

      <% unless errors.global.empty?  %>
        <ul class="errors-global-list">
          <% errors.global.each do |message| %>
            <li class="errors-message">
              <%= message %>
            </li>
          <% end %>
        </ul>
      <% end %>

      <% unless errors.fields.empty?  %>
        <dl class="errors-fields-list">
          <% 
            errors.fields.each do |key, messages|
              title = Array(key).join(" ").titleize
          %>
            <dt class="errors-title">
              <%= title %>
            </dt>

            <% Array(messages).each do |message| %>
              <dd class="errors-message">
                <%= message %>
              </dd>
            <% end %>
          <% end %>
        </dl>
      <% end %>
    </div>
  erb
end

require 'active_model' unless defined?(ActiveModel)
ActiveModel::Errors.send(:include, Errors2Html)

