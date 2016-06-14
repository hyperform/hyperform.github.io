---
title: Using Hyperform’s Validation Enhancements
id: docs-usage-high
---

*   Trigger a `validate` event before validating a form:

    ```js
    form.addEventListener('validate', event => {
      /* cancel validation (will also cancel form submission!) */
      event.preventDefault();
    });
    ```

*   Trigger a `valid` event, when an input becomes valid, again:

    ```js
    input.addEventListener('valid', () => alert('Yay!'));
    ```

*   Translate validation messages. We have some partial
    translations ready: https://github.com/hyperform/hyperform-l10n

*   Provide a registry for user defined validators, that are called
    automatically in the `validity.customError` step:

    ```js
    hyperform.register(element, function(element) {
      return result_of_convoluted_validation_routine();
    });
    ```

*   Add helper classes `hf-valid` and `hf-invalid` as well as
    proper `aria-invalid` to elements to become independent of `:valid` /
    `:invalid` pseudo-classes.

*   Allow specifying settings to customize the behavior of
    Hyperform (e. g., specifying a renderer for error messages).

*   Take single `<input>` elements out of validation by supporting
    a non-standard `novalidate` attribute and `noValidate` property for inputs:

    ```js
    var element = document.querySelector('input[name="foo"]');
    element.noValidate = true;
    // done. element won't be validated.
    ```

*   Add support for declarative custom validation messages:

    ```html
    <input required data-value-missing="We need this field!">
    ```
