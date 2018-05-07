---
id: home
title: Capture form validation back from the browser
---

Hyperform is a complete implementation of the **HTML 5 form validation API**
in Javascript. It replaces or polyfills the browser’s native methods and
eases your validation task with custom events and hooks.

<div class="max">
  <a class="max__l" href="download.html">
    <img src="https://assets-cdn.github.com/images/icons/emoji/unicode/2198.png" alt="" class="max__i">
    <span class="max__t">Download</span>
  </a>
  <a class="max__l" href="examples.html">
    <img src="https://assets-cdn.github.com/images/icons/emoji/unicode/1f527.png" alt="" class="max__i">
    <span class="max__t">Examples</span>
  </a>
  <a class="max__l" href="docs/">
    <img src="https://assets-cdn.github.com/images/icons/emoji/unicode/1f4d6.png" alt="" class="max__i">
    <span class="max__t">Documentation</span>
  </a>
  <a class="max__l" href="https://github.com/hyperform/hyperform/">
    <img src="https://assets-cdn.github.com/images/icons/emoji/octocat.png" alt="" class="max__i">
    <span class="max__t">GitHub</span>
  </a>
</div>

Hyperform is neatly packed in a single Javascript file, weights only 32kB
(9.3kB gzipped!) and includes:

*   a **full, working and compliant implementation** of the whole [HTML 5
    constraint
    API](https://html.spec.whatwg.org/multipage/forms.html#the-constraint-validation-api)

    ```js
    assert(input.validity.valid);
    ```
*   polyfills _and_ [ponyfills](https://ponyfill.com) for **other useful methods** like
    [`valueAsNumber`](https://html.spec.whatwg.org/multipage/forms.html#dom-input-valueasnumber)
    or
    [`stepUp`](https://html.spec.whatwg.org/multipage/forms.html#dom-input-stepup)

    ```js
    // polyfill:
    assert(input.valueAsNumber === 123);

    // ponyfill:
    hyperform.stepUp(input); // instead of input.stepUp()
    ```
*   **new events**

    ```js
    form.addEventListener('validate', function(event) {
      // stop the engines!
      event.preventDefault();
    });
    ```
*   easily **customizable error messages**

    ```html
    <input required data-value-missing="No chance! Fill it already.">
    ```
*   fine-grained **control over the display** of messages

    ```css
    .hf_warning {
      border-color: pink;
    }
    ```
*   and all this licensed under the terms of the [**MIT
    license**](LICENSE.html)
