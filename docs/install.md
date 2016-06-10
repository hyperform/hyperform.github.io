---
title: Installation
id: docs-install
---
The easiest way is installing via `npm`:

```sh
npm install hyperform
```

Then require Hyperform in your code:

```js
var hyperform = require('hyperform');
hyperform(window);
```

If you do not use Node.js, you can install Hyperform with **Bower**,

```sh
bower install hyperform
```

or simply download the [current version as ZIP
archive](https://github.com/hyperform/hyperform/archive/master.zip).

Then embed `dist/hyperform.min.js` in your file:

```html
<script src="path/to/hyperform/dist/hyperform.min.js"></script>
```

In old browsers you will need polyfills for the following features:
[`WeakMap`](https://github.com/Benvie/WeakMap) (IE 10 and lower),
[`element.classList`](https://github.com/remy/polyfills) (IE 9 and lower),
`array.filter`, `array.every`, `Object.keys` and
`Object.defineProperty` (IE 8 and lower).

Finished! Yes, apart from some polyfills Hyperform has **zero** external
dependencies.
