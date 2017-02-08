---
title: Download Hyperform
game: freeciv
id: download
---

## Zip File

Download the whole project as Zip file:

<a class="arcade-btn" href="https://github.com/hyperform/hyperform/archive/master.zip">Press Button for Download</a>

In this archive you will find the files `dist/hyperform.min.js` and
`css/hyperform.css`. Simply include them in your project, and you’re ready to
go:

```html
<script src="hyperform/dist/hyperform.min.js"></script>
<link rel="stylesheet" href="hyperform/css/hyperform.css">
<script>hyperform(window)</script>
```

## Install via Package Managers

The easiest way is installing via `npm`:

```sh
$ npm install hyperform
```

or you can use Bower:

```sh
bower install hyperform
```

Both methods provide you with the same files as the direct download above.

If you use a build system like Browserify or Webpack, simply require Hyperform
there:

```js
import hyperform from 'hyperform';

hyperform(window);
```

## Embed From A CDN

Get up and running quickly with Hyperform by embedding it from a CDN:
[CDNJS](https://cdnjs.com/libraries/hyperform)

```html
<script src="https://cdnjs.cloudflare.com/ajax/libs/hyperform/0.8.15/hyperform.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/hyperform/0.8.15/hyperform.min.css">
```

or unpkg.com:

```html
<script src="https://unpkg.com/hyperform"></script>
<link rel="stylesheet" href="https://unpkg.com/hyperform@latest/css/hyperform.css">
```

No local installation necessary.

## Polyfills

For IE 9 and IE 10 you need two polyfills:

* a `WeakMap` implementation. We suggest [this one](https://github.com/Benvie/WeakMap) ([download](https://unpkg.com/weakmap@0.0.6/weakmap.min.js))
* a `classList` polyfill like [this one](http://purl.eligrey.com/github/classList.js) ([download](https://cdnjs.cloudflare.com/ajax/libs/classlist/1.1.20150312/classList.min.js))
