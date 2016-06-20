---
title: Working with the HTML 5 Validation API
id: docs-usage-low
game: "2048"
---
The [HTML 5 validation
API](https://html.spec.whatwg.org/multipage/forms.html#the-constraint-validation-api)
is designed to work without Javascript interception, only based on the markup
that the browser sees. However, there are some entry points, where you can
influence the course of the validation.

A typical flow without Javascript looks like this:

<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 600 600" style="width:400px;max-width:100%;display:block;margin:0 auto;">
<defs>
<marker id="Triangle"
viewBox="0 0 10 10" refX="0" refY="5"
markerUnits="strokeWidth"
markerWidth="4" markerHeight="3"
orient="auto">
<path d="M 0 0 L 10 5 L 0 10 z" fill="#78397E" />
</marker>
</defs>
<g fill="none" stroke-width="4" stroke="#78397E">
<line x1="50" y1="20" x2="50" y2="580" marker-end="url(#Triangle)"/>
<line x1="40" y1="20" x2="60" y2="20"/>
<line x1="40" y1="120" x2="60" y2="120"/>
<line x1="40" y1="220" x2="60" y2="220"/>
<line x1="40" y1="320" x2="60" y2="320"/>
<line x1="40" y1="420" x2="60" y2="420"/>
<line x1="40" y1="520" x2="60" y2="520"/>
<path d="M 380,400 A 1200,400 0 0,0 380,140" marker-end="url(#Triangle)"/>
</g>
<text font-size="20" font-family="Work Sans,sans-serif" fill="#262422">
<tspan x="70" y="125">user fills input field</tspan>
<tspan x="70" y="325">user tries to submit the form</tspan>
<tspan x="70" y="25">page load</tspan>
<tspan x="70" y="225"><tspan font-family="monospace">:valid</tspan> and <tspan font-family="monospace">:invalid</tspan> match</tspan>
<tspan x="70" y="425">errors are reported to the user</tspan>
<tspan x="70" y="525">without errors the form is submitted</tspan>
</text>
</svg>

All the methods and properties described below are fully supported by Hyperform.
When you apply Hyperform to `window`, their polyfills will be installed
globally for all input elements:

```js
hyperform(window);
var element = document.createElement('input');
assert('willValidate' in element);
```

## Checking, if an element will be validated at all

To check, if an element will be validated at all (or whether it will be skipped
for one reason or another), evaluate `element.willValidate`.

```js
if (element.willValidate) {
  // this element is not disabled. On submit it
  // will be checked for its validity state.
}
```

## Marking an element as invalid

At any time you can mark an element as invalid by setting its validation
message to a non-empty value:

```js
element.setCustomValidity(message);
```

An element marked this way will respond to the `:invalid` CSS pseudo-class and
will report `message` to the user, when she tries to submit the containing
form. To mark the element as valid, again, set the message to the empty string:

```js
element.setCustomValidity('');
```

You can query the currently set validation message (your own or the default
one of the browser) with `element.validationMessage`.

## Manually checking the validity and reporting to the user

Use `checkValidity`, if you are just interested in whether an element will
validate or not. Use `reportValidity` to also inform the user about the
validation result. Both will trigger an event named `invalid`, if the element
in question is, well, invalid.

To query specific errors (like, if the user entered a value into a required
field), the `validity` object provides specific properties:

```js
// specific problem with missing value:
var element_is_empty = element.validity.valueMissing;

// specific test for missing a pattern requirement:
var element_doesnt_match = element.validity.patternMismatch;

//.. and so on.

// overall test, if all constraints are met:
var element_is_valid = element.validity.valid;
// or equivalent (but triggers the "invalid" event):
var element_is_valid = element.checkValidity();

// show a warning to the user, if the element is invalid:
if (! element_is_valid) {
  element.reportValidity();
}
```

## Switching off the validation

When a form has an attribute `novalidate`, the browser will skip validation
altogether for this form. You can control this feature in your scripts by
toggling `form.noValidate` (with upper-case “V”).

```js
form.noValidate = true;
// validation is switched off for this form
```


## Things, that do not work well with the HTML 5 API

When you try to hook into the HTML 5 validation API, you will quite soon run
into a wall that prevents you from implementing some of the most common
validation patterns. This is where the [high level API of
Hyperform](high_level_api.html) comes to rescue. Some common problems, that
are not solvable with the methods above alone, include:

*   You cannot switch off the validation for single elements apart from setting
    the `disabled` attribute (or a handful of other comparably intrusive
    methods). If you want to allow a user to enter invalid data, you have to
    disable the validation for the whole form and reimplement everything
    yourself.

    _Hyperform_ respects a non-standard attribute `novalidate` on a per
    element base, so you can remove single input fields from the validation
    step.

*   When a user tries to submit a form, the browser will run the validation
    _before_ the `submit` event is fired. This is unfortunate, since there is
    no option to hook custom behavior into this step (like calling custom
    validation routines).

    _Hyperform_ allows to register custom validator functions that are called
    during validation. It also triggers a cancellable `validate` event on the
    form, before the validation starts.

*   Providing custom validation messages for the standard validations is
    non-trivial. You have to hook into the `invalid` event for each element,
    determine again, why exactly it is invalid, and then re-build the message
    before setting it with `setCustomValidity()` or rendering it yourself.

    _Hyperform_ gives you full localization control as well as methods to
    adapt _every_ element’s message per validation incident.

*   Detecting when a field becomes _valid_ again is not part of the API.

    _Hyperform_ will trigger a `valid` event on each field, that complements
    the `invalid` event from the specification.

How all of these work in detail is described on [the next
page](high_level_api.html).

----

:gem: Next: [Extra Hyperform Features](high_level_api.html) – functionality
added beyond standard HTML 5 validation.
