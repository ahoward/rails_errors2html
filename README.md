--------------------------------
NAME
--------------------------------
  rails_errors2html

--------------------------------
DESCRIPTION
--------------------------------

  sane html rendering of active_model errors 

--------------------------------
SYNOPSIS
--------------------------------

````erb

    <%= form_for @post do %>

      <!-- these are all the same -->
      <%= @post.errors %>
      <%= @post.errors.to_s %>
      <%= @post.errors.to_html %>

    <% end %>

  <!-- you can merge errors from different objects -->

    <%= Errors2Html.to_html(@post.errors, @comment.errors) %>

````

you can override the built-in template like so

````ruby

  # file : config/initializers/errors2html.rb

    Errors2Html.template = 'shared/errors'

````

here is an example template.

note that errors are partioned into global and field based errors.


````erb
  <!-- file : app/views/shared/errors.html.erb -->

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
````


you might want some css like this

````css

  .errors-summary {
    box-sizing: border-box;
    width: 100%;
    height: auto;
    color: #333;
    background-color: #fffff6;
    padding: 1em;
  }
  .errors-caption {
    font-weight: bold;
  }
  .errors-title {
  }
  .errors-message {
  }

````

--------------------------------
INSTALL
--------------------------------

   gem install rails_errors2html

   gem 'rails_errors2html'
   bundle install
