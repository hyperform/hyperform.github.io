---
title: Using Hyperform’s Validation Enhancements
id: docs-usage-high
game: hextris
---

## React to Validation Results in CSS

All validated elements receive helper classes `hf-valid` and `hf-invalid`,
respectively, as well as proper `aria-invalid` attributes. After the first
validation they receive an additional class `hf-validated`. Additionally,
Hyperform will try to keep the `:valid` and `:invalid` pseudo-classes
functional (as long as browsers [already support
them](http://caniuse.com/#feat=form-validation)).

So, to address an invalid `<input>` _after_ a user has first tried to fill it,
you can use

```css
.hf-validated.hf-invalid {
  ...
}
/* or */
.hf-validated[aria-invalid="true"] {
  ...
}
/* or, if the browser supports it: */
.hf-validated:invalid {
  ...
}
```


## Control Validation Flow with Events

When an element is validated and found invalid, an event `invalid` is triggered
on this node. The event is cancellable, and if you decide to cancel it, any
feedback to the user will be suppressed:

```js
/* never render a warning to the user */
element.addEventListener('invalid', event => event.preventDefault());
```

When an input becomes valid again, (or is valid on initial validation) a
`valid` event is triggered with the same cancelling behavior.

```js
input.addEventListener('valid', () => alert('Yay! Congratulations.'));
```

A form element emits a `validate` event right before validating all its child
elements and submitting the form. This event is cancellable, too, which will
call off the validation and the subsequent submission.

```js
form.addEventListener('validate', event => {
  /* cancel validation (will also cancel form submission!)
   * This is similar to a `novalidate` attribute on the form, but needs
   * manual form submission.
   */
  event.preventDefault();
});
```


## Adapt Validation Messages

You can translate all validation messages and also set the language used. We
have [some partial translations](https://github.com/hyperform/hyperform-l10n)
ready, that are based on Firefox’s messages. The interface for this consists
of two methods, `hyperform.set_language()` and `hyperform.add_translation()`.

```js
hyperform.add_translation("de", {
  TextTooLong: "Bitte kürzen Sie diesen Text auf maximal %l Zeichen (Sie verwenden derzeit %l Zeichen).",
  ValueMissing: "Bitte füllen Sie dieses Feld aus.",
  // ...
});

hyperform.set_language("de");
```


Hyperform supports declarative custom validation messages. Set a `data-*`
attribute on the element, that you want to customize, and add the type of
validation error that the message describes:

```html
<input required data-value-missing="We need this field!">
```

| `data-*` attribute      | meaning |
| ----------------------- | ------- |
| `data-bad-input`        | the value cannot be converted to a value type |
| `data-custom-error`     | the element doesn’t conform to a custom validator |
| `data-pattern-mismatch` | the value doesn’t adhere to a given regular expression |
| `data-range-overflow`   | the value is too little |
| `data-range-underflow`  | the value is too much |
| `data-step-mismatch`    | the value is not a step increment from the base value |
| `data-too-long`         | the value is too long |
| `data-too-short`        | the value is too short |
| `data-type-mismatch`    | the value doesn’t follow the syntax that the type attribute requests |
| `data-value-missing`    | the value is required, but missing |

If you want to adapt the messages of an element in code, you can do so with the
`hyperform.set_message()` method. It expects an element, the type of validator
and the message in case the validation goes wrong:

```js
hyperform.set_message(element, 'valueMissing',
                      'Shugs! You need to fill in this form');
```

## Define Custom Validators

Define your own validators per input element, that are called automatically in
the `validity.customError` step:

```js
hyperform.add_validator(element, function(element) {
  var valid = result_of_convoluted_validation_routine();
  // now is a good time to set error messages:
  element.setCustomValidity(valid? '' :
    'Please follow the on-screen instructions to receive your white rabbit.');
  return valid;
});

element.validity.customError? 'the script returned false' :
                              'the script returned true';
```

## Exclude a Single `<input>` from Validation

You can take single `<input>` elements out of validation by setting a
non-standard `novalidate` attribute in the HTML or setting the `noValidate`
property in your JS code to `true`:

```js
var element = document.querySelector('input[name="foo"]');
element.noValidate = true;
// done. element won't be validated.
```

## Prevent Implicit Submits

An [implicit
submit](https://www.w3.org/TR/html5/forms.html#implicit-submission) occurs,
when a user presses `Enter` in a single-line input field. Sometimes this
behaviour is not wanted. You can disable it globally with a setting:

```js
hyperform(window, {
  prevent_implicit_submit: true
});
```

----

:gem: Next: [Conformance _&_ status](status.html) – what parts of the HTML 5
validation API are supported, and what are the plans for additional features.
