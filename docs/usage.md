---
title: Usage
id: docs-usage
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
  valid_event: false,
});
```

The available settings are:

| Setting                  | Description                                      |
| ------------------------ | ------------------------------------------------ |
| `strict`                 | When `true`, disable the high-level API. Default: `false`. |
| `revalidate`             | Whether fields should be re-validated automatically. Valid values: `oninput` (validate after a field changes), `onsubmit` (validate when the form should be submitted), and `never`. Default: `oninput`. |
| `valid_event`            | Whether the non-standard `valid` event should be triggered. Default: `true`. |
| `extend_fieldset`        | Whether the `<fieldset>` element should be treated like a normal input field, e.g. allowing it to receive an error message. Default: `true`. |
| `novalidate_on_elements` | Whether input fields with the non-standard attribute `novalidate` should be exempted from validation. Default: `true`. |
| `classes`                | CSS class names to use instead of the default ones. This is an object with the possible keys `warning`, `valid`, `invalid`, and `validated`. |
