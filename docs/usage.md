---
title: Usage
id: docs-usage
game: untrusted
---

The library introduces the global variable `hyperform`. You can let Hyperform
take over a single form:

```js
var $form = hyperform(document.forms[0]);
```

or all forms, current and future ones:

```js
var $form = hyperform(window);
```

In the first case, Hyperform will only polyfill the elements currently
available in the form. In the second case, the polyfills are applied to all
current and future forms and input elements (via the element prototypes).

Hyperform returns a wrapper object. If you want to remove the extra
functionality, call the wrapper’s `destroy()` method:

```js
$form.destroy();
```

If you only need a certain feature, you can access it directly by name from
the global `hyperform` object:

```js
if (hyperform.willValidate(form.elements[0])) {
  var is_valid = hyperform.validityState(form.elements[0]).valid;
}
```

## Configuration

Configure settings as second argument:

```js
hyperform(window, {
  revalidate: 'onsubmit',
  validEvent: false,
});
```

The available settings are:

*   `strict`: (*bool*) When `true`, disable the high-level API. Default:
    `false`.
*   `preventImplicitSubmit`: (*bool*) Prevent `Enter` in input fields to
    submit the form. Default: `false`.
*   `revalidate`: (*string*) Whether and when fields should be re-validated
    automatically. Valid values:

    *   `oninput` validate after a field changes
    *   `onblur` validate after a field is left
    *   `hybrid` an intelligent mixed approach: report valid value on input,
        but complain about invalid value on blur
    *   `onsubmit` validate when the form should be submitted
    *   `never`: never revalidates on its own
    Default: `hybrid`.
*   `validEvent`: (*bool*) Whether the non-standard `valid` event should be
    triggered. Default: `true`.
*   `extendFieldset`: (*bool*) Whether the `<fieldset>` element should be
    treated like a normal input field, e.g. allowing it to receive an error
    message. Default: `true`.
*   `novalidateOnElements`: (*bool*) Whether input fields with the
    non-standard attribute `novalidate` should be exempted from validation.
    Default: `true`.
*   `classes`: (*object*) CSS class names to use instead of the default ones.
    This is an object with the possible keys:

    *   `warning`: the node created to show a validation warning. Default:
        `hf-warning`.
    *   `valid`: a valid element, like the `:valid` pseudo-class. Default:
        `hf-valid`.
    *   `invalid`: an invalid element, like the `:invalid` pseudo-class.
        Default: `hf-invalid`.
    *   `validated`: an element that was validated at least once. Allows to
        address invalid input only _after_ the user has first touched them.
*   `validateNameless`: (*bool*) Whether to include input elements without
    `name` attribute as validation candidates.
    Default: `false`. Since 0.9.11.

----

:gem: Next: [HTML 5 API](low_level_api.html) – how to use the HTML 5 form
validation with Hyperform for fun and profit.
