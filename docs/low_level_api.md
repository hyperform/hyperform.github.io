---
title: Working with the HTML 5 Validation API
id: docs-usage-low
---
The HTML 5 validation API is designed to work without Javascript interception,
only based on the markup that the browser sees. However, there are some entry
points, where you can influence the course of the validation.

All the following methods and properties are fully supported by Hyperform.
When you apply Hyperform to `window`, the polyfills for them will be installed
globally for all input elements:

```js
hyperform(window);
var element = document.createElement('input');
assert('willValidate' in element);
```

## Checking, if an Element will be Validated at all

To check, if an element will be validated at all (or whether it will be skipped
for one reason or another), evaluate `element.willValidate`.

```js
if (element.willValidate) {
  // this element is not disabled. On submit it
  // will be checked for its validity state.
}
```

## Marking an Element as Invalid

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

## Manually Checking the Validity and Reporting to the User

Use `checkValidity`, if you are just interested in whether an element will
validate or not. Use `reportValidity` to also inform the user about the
validation result.

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
```

## Things, that do not Work with the HTML 5 API

When you try to hook into the HTML 5 validation API, you will quite soon run
into a wall that prevents you from implementing some of the most common
validation patterns. This is where the [high level API of
Hyperform](high_level_api.html) comes to rescue. Some common problems, that
are not solvable with the methods above alone, include:

* TODO. Validation before submit, reacting on input change, ...

----

:gem: Next: [Extra Hyperform Features](high_level_api.html) – functionality
added beyond standard HTML 5 validation.
