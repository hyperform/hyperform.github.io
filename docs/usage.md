---
title: Usage
id: docs-usage
---

The library introduces the global variable `hyperform`. You can let Hyperform
take over a single form:

```js
hyperform(document.forms[0]);
```

or all forms, current and future ones:

```js
hyperform(window);
```

Configure settings as second argument:

```js
hyperform(window, {
    strict: false,         // default. En- or disable some high-level APIs

    revalidate: 'oninput', // default. Whether fields should be
                           // re-validated automatically. Valid values:
                           // `oninput`, `onsubmit`, and `never`.

    valid_event: true,     // default. Whether the non-standard `valid`
                           // event should be triggered
});
```

If you only need a certain feature, you can access it directly by name:

```js
if (hyperform.willValidate(form.elements[0])) {
    var is_valid = hyperform.validityState(form.elements[0]).valid;
}
```
