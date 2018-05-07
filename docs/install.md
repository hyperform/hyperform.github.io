---
title: Installation
id: docs-install
game: arcade
---

Fetch Hyperform in any way you like as laid out on the [downloads page](/download.html).

Then embed `dist/hyperform.min.js` in your file:

```html
<script src="hyperform/dist/hyperform.min.js"></script>
<link rel="stylesheet" href="hyperform/css/hyperform.css">
<script>hyperform(window);</script>
```

If you use a build system like Browserify or Webpack, require Hyperform
in your own Javascript files:

```js
// "classic" CJS variant:
var hyperform = require('hyperform');

// or "newer" ESM variant:
import hyperform from 'hyperform';

hyperform(window);
```

For Hyperform to work in old IEs you need polyfills for
[`WeakMap`](https://github.com/Benvie/WeakMap) (IE 10 and lower), and
[`element.classList`](https://github.com/remy/polyfills) (IE 9 and lower).

[Polyfill.io](https://polyfill.io/) offers this as conveniant URL, that only
returns the necessary polyfills based on the browser UA string:

```html
<script src="https://polyfill.io/v2/polyfill.min.js?features=Element.prototype.classList,WeakMap"></script>
```

Finished! Yes, in modern browsers Hyperform has **zero** external
dependencies.

## ES2015 Modules

Hyperform is developed using a strict ES2015 module approach. If you want to
make use of the granular modules yourself, you can import them directly from
the `src` folder:

```js
import hyperform from 'path/to/hyperform/src/hyperform';
```

## Auto-Loading Hyperform

There might be situations, where you just want to throw in the Hyperform
`script` element, let it do its magic and call it a day. To spare the call to
`hyperform(window)` you can simply add a special attribute to the embedding
script element:

```html
<script src="path/to/hyperform.min.js" data-hf-autoload></script>
```

This will then automatically run `hyperform(window)` for you. (Note: If you're
supporting IE, then you must add a [polyfill for
`document.currentScript`](https://github.com/JamesMGreene/document.currentScript)
for this feature to work. If you don’t want that, simply call
`hyperform(window)` yourself somewhere in your code.)

----

:gem: Next: [Usage](usage.html) – all the things you can do with Hyperform
