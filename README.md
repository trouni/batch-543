# Creating JavaScript components with Stimulus

---

## Simple Component: Collapsible Form

Let's create an "collapsible form" component for the `reviews#new` form, that expands when we click on a button.


Let's do it in pure **JavaScript**


### Stimulus JS

A JavaScript [library](https://github.com/stimulusjs/stimulus) that pairs well with Turbolinks.

Read the [Handbook](https://stimulusjs.org/handbook/origin)


### Stimulus in Rails
Quick setup in rails:

```shell
rails webpacker:install:stimulus
```

Check your app/javascript/packs/application.js


### Stimulus Controller

```shell
touch app/javascript/controllers/collapsible_form_controller.js
```
```js
import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    console.log(`Hello from the ${this.identifier} controller!`);
  }
}
```


### Data-controller

Connect the component to the `collapsible_form` controller by adding a `data-controller` attribute.

```erb
<!-- app/views/restaurants/show.html.erb -->

<div data-controller="collapsible-form"> <!-- create a container for our new component -->
  <button class="btn btn-outline-primary">Leave a review</button>

  <%= simple_form_for([ @restaurant, @review ], remote: true) do |f| %>
    <!-- [...] -->
  <% end %>
</div>
```
Set the `data-controller` in a div that contains both:
- the element listening to an event (the button)
- the element you want to update (the form)


### Data-target

`data-<controller>-target` is the equivalent of `document.querySelector`

```erb
<%= simple_form_for([ @restaurant, @review ],
                    html: { data: { collapsible_form_target: 'form' } },
                    remote: true) do |f| %>
```

Simple form will generate a form tag like this:

```html
<form action="..." data-collapsible-form-target="form" ... >
```

`data-<controller-name>-target="targetName"`


### Targets

```js
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'form' ];

  connect() {
    console.log(this.formTarget);
  }
}
```

`this.countTarget` returns the first one, `this.countTargets` returns them all


### Connect

Set the initial state of the form in the `connect()` action.

```js
export default class extends Controller {
  static targets = [ 'form' ];

  connect() {
    this.formTarget.style.height = "0"
    this.formTarget.style.overflow = "hidden"
    this.formTarget.style.transition = "height 0.2s ease-in"
  }
}
```


### Data-Action

Listening to the `click` event on the button (`addEventListener`):

```erb
<!-- app/views/restaurants/show.html.erb -->

<div data-controller="collapsible-form">
  <button class="btn btn-outline-primary"
          data-action="click->collapsible-form#expandForm">Leave a review</button>
  <!-- [...] -->
</div>
```

Syntax: `event->controller-name#actionName`


### Action

```js
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'form' ];
  // ...
  expandForm(event) {
    console.log(event);
  }
}
```

Let’s expand the form!


### Settings

Use data attributes to add settings to your component

```erb
  <div data-controller="collapsible-form" data-expanded-height="150px">
```

```js
expandForm(event) {
  this.formTarget.style.height = this.element.dataset.expandedHeight
  event.currentTarget.remove() // Remove the button after expanding the form
}
```


### Additional actions

```erb
<div data-controller="collapsible-form" data-expanded-height=150>
  <!-- [...] -->
  <%= f.input :content, as: :text,
    label: false,
    input_html: {
      placeholder: 'Press enter to submit your review.',
      data: { action: 'keydown->collapsible-form#submitOnEnter' }
    } %>
</div>
```

```js
export default class extends Controller {
  // ...
  submitOnEnter(event) {
    if (event.key === 'Enter' && !event.shiftKey) {
      event.preventDefault()
      this.formTarget.submit()
    }
  }
}
```


### Stimulus takeaways

- `querySelector` is replaced by `data-<controller-name>-target="targetName"`
- `addEventListener` is replaced by `data-action`
- the `data-controller` wraps the other elements


### Syntax

- `data-controller="controller-name"`
- `data-<controller-name>-target="targetName"="targetName"`
- `data-action="event->controller-name#actionName"`
  
---

## AJAX in Rails

Let's fix the *scrolling back to the top* issue using JavaScript views in Rails.


### Render JS views

Rails controllers can render different formats based on the request’s “Accept” header:

```rb
# app/controllers/reviews_controller.rb
# [...]
  def create
    # ...
    if @review.save
      respond_to do |format|
        format.html { redirect_to restaurant_path(@restaurant) }
        format.js
      end
    else
  end
```

It will respond to requests that have `Accept: text/javascript` in their headers with a `js.erb` view.


### Implement the `create.js.erb` view

Add some JavaScript to insert the review partial at the beginning of the `#reviews` div.

```js
document.getElementById('reviews').insertAdjacentHTML('afterBegin', '<%=j render @review %>')
```


### WTH are the `js.erb` views?

Don't think of the `js.erb` files as actual views (because we're not reloading the page or rendering new HTML). Think of it simply as **some JS code you run on the current page** instead of sending HTML at the end of your controller action.


---

## HAPPY AJAXIFICATION!