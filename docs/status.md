---
title: Conformance <em>&amp;</em> Status
id: docs-status
game: adarkroom
---
What parts of the [HTML5 validation
API](https://html.spec.whatwg.org/multipage/forms.html#constraints) are ready
for prime time?

| feature                      | status      | comment            |
| ---------------------------- | ----------- | ------------------ |
| `willValidate`               | :full_moon: | |
| `setCustomValidity(message)` | :full_moon: | |
| `validity.valueMissing`      | :full_moon: | (access via `hyperform.ValidityState`) |
| `validity.typeMismatch`      | :full_moon: | (access via `hyperform.ValidityState`) |
| `validity.patternMismatch`   | :full_moon: | (access via `hyperform.ValidityState`) |
| `validity.tooLong`           | :full_moon: | (access via `hyperform.ValidityState`) |
| `validity.tooShort`          | :full_moon: | (access via `hyperform.ValidityState`) |
| `validity.rangeUnderflow`    | :full_moon: | (access via `hyperform.ValidityState`) |
| `validity.rangeOverflow`     | :full_moon: | (access via `hyperform.ValidityState`) |
| `validity.stepMismatch`      | :full_moon: | (access via `hyperform.ValidityState`) |
| `validity.badInput`          | :full_moon: | (access via `hyperform.ValidityState`) |
| `validity.customError`       | :full_moon: | (access via `hyperform.ValidityState`) |
| `validity.valid`             | :full_moon: | (access via `hyperform.ValidityState`) |
| `checkValidity()`            | :full_moon: | |
| `reportValidity()`           | :full_moon: | |
| `validationMessage`          | :full_moon: | |
| `valueAsDate`                | :full_moon: | |
| `valueAsNumber`              | :full_moon: | |
| `valueLow` / `valueHigh`     | :new_moon:  | not started, yet   |
| `stepUp(n)` / `stepDown(n)`  | :full_moon: | |
| `accept` attribute           | :full_moon: | for `type=file` inputs. It’s useful to implement a check because there are browsers without support, that implement the File API. |
| support for `novalidate`     | :full_moon: | |
| support for properties like `element.pattern` | :full_moon: | |

Todo list and plans for the high-level API:

*   :new_moon: Trigger an event before validating individual elements.

*   :new_moon: Allow functions to hook into the actual validations to accept or
    reject inputs.

*   :first_quarter_moon: Translate validation messages. We have some partial
    translations ready: https://github.com/hyperform/hyperform-l10n

*   :first_quarter_moon: Allow specifying settings to customize the behavior of
    Hyperform (e. g., specifying a renderer for error messages).

*   :new_moon: Idea: Add a means of linking two `<input>`s together so they get
    validated synchronously:

    ```js
    hyperform.link(element1, element2);
    element1.reportValidity();
    // element2.reportValidity gets triggered automatically
    ```

Do you have a wish or an idea? [File an issue and let us discuss
it!](https://github.com/hyperform/hyperform/issues/new)

----

:gem: Next: This is the last page of the documentation. Why not [take a look at
the examples](../examples.html)?
