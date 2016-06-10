---
title: Conformance <em>&amp;</em> Status
id: docs-status
---
What parts of the [HTML5 validation
API](https://html.spec.whatwg.org/multipage/forms.html#constraints) are ready
for prime time?

| feature                      | status      | comment            |
| ---------------------------- | ----------- | ------------------ |
| `willValidate`               | :full_moon: | |
| `setCustomValidity(message)` | :full_moon: | |
| `validity.valueMissing`      | :full_moon: | (access via `hyperform.validityState`) |
| `validity.typeMismatch`      | :full_moon: | (access via `hyperform.validityState`) |
| `validity.patternMismatch`   | :full_moon: | (access via `hyperform.validityState`) |
| `validity.tooLong`           | :full_moon: | (access via `hyperform.validityState`) |
| `validity.tooShort`          | :full_moon: | (access via `hyperform.validityState`) |
| `validity.rangeUnderflow`    | :full_moon: | (access via `hyperform.validityState`) |
| `validity.rangeOverflow`     | :full_moon: | (access via `hyperform.validityState`) |
| `validity.stepMismatch`      | :full_moon: | (access via `hyperform.validityState`) |
| `validity.badInput`          | :full_moon: | (access via `hyperform.validityState`) |
| `validity.customError`       | :full_moon: | (access via `hyperform.validityState`) |
| `validity.valid`             | :full_moon: | (access via `hyperform.validityState`) |
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

What parts of the high-level API are finished?

*   :full_moon: Trigger a `validate` event before validating a form:

    ```js
    form.addEventListener('validate', event => {
      /* cancel validation (will also cancel form submission!) */
      event.preventDefault();
    });
    ```

*   :new_moon: Trigger an event before validating individual elements.

*   :full_moon: Trigger a `valid` event, when an input becomes valid, again:

    ```js
    input.addEventListener('valid', () => alert('Yay!'));
    ```

*   :new_moon: Allow functions to hook into the actual validations to accept or
    reject inputs.

*   :first_quarter_moon: Translate validation messages. We have some partial
    translations ready: https://github.com/hyperform/hyperform-l10n

*   :full_moon: Provide a registry for user defined validators, that are called
    automatically in the `validity.customError` step:

    ```js
    hyperform.register(element, function(element) {
      return result_of_convoluted_validation_routine();
    });
    ```

*   :full_moon: Catch form submissions _before_ the `submit` event to do our
    own validation (`click`s on submit buttons and `enter` keys in text inputs
    in forms w/o submit buttons).

*   :full_moon: Add helper classes `hf-valid` and `hf-invalid` as well as
    proper `aria-invalid` to elements to become independent of `:valid` /
    `:invalid` pseudo-classes.

*   :first_quarter_moon: Allow specifying settings to customize the behavior of
    Hyperform (e. g., specifying a renderer for error messages).

*   :full_moon: Take single `<input>` elements out of validation by supporting
    a non-standard `novalidate` attribute and `noValidate` property for inputs:

    ```js
    var element = document.querySelector('input[name="foo"]');
    element.noValidate = true;
    // done. element won't be validated.
    ```

*   :new_moon: Add support for declarative custom validation messages:

    ```html
    <input data-validation-message="We need this field!">
    ```

*   :new_moon: Idea: Add a means of linking two `<input>`s together so they get
    validated synchronously:

    ```js
    hyperform.link(element1, element2);
    element1.reportValidity();
    // element2.reportValidity gets triggered automatically
    ```

Do you have a wish or an idea? [File an issue and let us discuss
it!](https://github.com/hyperform/hyperform/issues/new)
