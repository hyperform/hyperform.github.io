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

For Hyperform to work in old IEs you need polyfills for
[`WeakMap`](https://github.com/Benvie/WeakMap) (IE 10 and lower), and
[`element.classList`](https://github.com/remy/polyfills) (IE 9 and lower).

Finished! Yes, in modern browsers Hyperform has **zero** external
dependencies.

## ES2015 Modules

Hyperform is developed using a strict ES2015 module approach. If you want to
make use of the granular modules yourself, you can import them directly from
the `src` folder:

```js
import hyperform from 'path/to/hyperform/src/hyperform';
```

:gem: Next: [Usage](usage.html) – all the things you can do with Hyperform
