# Sisyphus::Rails

A gem to add gmail like form saving through sisyphus.js

## Installation

Add this line to your application's Gemfile:

    gem 'sisyphus-rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sisyphus-rails

For a basic install include the following in your *app/assets/javascripts/application.js* file

    //= require sisyphus

To support IE6/7 users include jStorage as well

    //= require jstorage

## How it Works

Sisyphus uses an aliased form_tag method to automatically put a *&lt;script&gt;...&lt;/script&gt;* tag infront of your forms to initialize Sisyphus. It also uses an aliased FormHelper form_for method to read options.

    <script>$(document).ready(function() {$('#sampleform').sisyphus();});</script>
    <form id="sampleform">
      ...
    </form>
## Usage

Sisyphus automatically works with all your forms, including custom form builders. 

### Exclude form

To stop Sisyphus from initializing on a form include the *with_sisyphus* option in your form_for.

    <%= form_for User.new, :with_sisyphus=>false do |f| %>
      ...
    <% end %>

## Dependencies

- Rails >= 3.1
- Jquery 1.8+

## TODO

- Tests
- Move away from form_tag_helper, should be able to do it all from form_helper? Script tag can go at the end anyhow. Why aren't we doing that right now? We don't seem to have access to the same variables that the regular form_for does. Also the options array gets muddied by the FormHelper form_for call -> it removes the [:html] section (we need the id of the form for sisyphus). 
- conflict resolution... i.e. you have an object edit form, the fields are populated from the DB but if you have local browser changes they may get overridden. We need a way to resolve conflicts between local and remote data -> could use a jquery based modal dialog to present the diff?
- Model/Object based exclusions via config or activerecord extension?
- Env. based and global on/off switches
- block based options (this would allow us to easily and neatly implement Sisyphus options)

    <%= form_for User.new do |f| %>
      <% :sisyphus => flase %>
      <% :sisyphus_customKeyPrefix => 'sisy' %>
      ...
    <% end %>

- implement all sisyphus options and any relevant ones in jStorage

## Contributing

If you have time to tackle something off the TODO list before I manage to get around to it then please do!

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Included Libraries

https://github.com/rails/jquery-rails
https://github.com/simsalabim/sisyphus
https://github.com/andris9/jStorage

## Resources

http://coding.smashingmagazine.com/2011/12/05/sisyphus-js-client-side-drafts-and-more/
