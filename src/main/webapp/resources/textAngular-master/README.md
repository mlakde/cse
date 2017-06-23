Full Featured textAngular
=========================

I built this because I needed a lot more stuff that wasn't included in the default textAngular. This is a work in progress and currently includes the following extras:

- Colorpicker via angular-bootstrap-colorpicker
- Font family
- Font size
- Indent / outdent
- Added angular-ui bootstrap dropdown toggle to hold common items
  - h1-h6 and p formatBlocks
  - text alignment

Many thanks for the hard work put in by @fraywing on textAngular and @buberdds on angular-bootstrap-colorpicker.

## Requirements

1. `AngularJS` ≥ `1.2.x` ;
2. `Angular Sanitize` ≥ `1.2.x`.

### Optional requirements

1. [Bootstrap 3.x](http://getbootstrap.com/) for the default styles
2. [Font-Awesome 4.x](http://fortawesome.github.io/Font-Awesome/) for the default icons on the toolbar
3. [Rangy 1.x](https://code.google.com/p/rangy/) for better activeState detection and more dynamic plugins, also the selectionsaverestore module.

### Where to get it

**NOTE:** If you are using `angular-sanitize` anywhere you need to pick one of `angular-sanitize` OR `textAngular-sanitize` as the latter is our fork of the `angular-sanitize` file so loading both may cause conflicts.

**Via Bower:**

Run `bower install textAngular` from the command line.
Include script tags similar to the following:
```html
<script src='/bower_components/textAngular/textAngular-sanitize.js'></script>
<script src='/bower_components/textAngular/textAngular.js'></script>
```

**Via CDNJS:**

Include script tags similar to the following:
```html
<script src='http://cdnjs.cloudflare.com/ajax/libs/textAngular/1.2.0/textAngular-sanitize.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/textAngular/1.2.0/textAngular.min.js'></script>
```

**Via jsDelivr:**

Include script tags similar to the following:
```html
<script src='//cdn.jsdelivr.net/angular.textangular/1.2.0/textAngular-sanitize.min.js'></script>
<script src='//cdn.jsdelivr.net/angular.textangular/1.2.0/textAngular.min.js'></script>
```

**Via Github**

Download the code from [https://github.com/fraywing/textAngular/releases/latest](https://github.com/fraywing/textAngular/releases/latest), unzip the files then add script tags similar to the following:
```html
<script src='/path/to/unzipped/files/textAngular-sanitize.js'></script>
<script src='/path/to/unzipped/files/textAngular.js'></script>
```

### Usage

1. Include `textAngular.js` or `textAngular.min.js` and `textAngular-sanitize.js` or `textAngular-sanitize.min.js` in your project using script tags
2. Add a dependency to `textAngular` in your app module, for example: ```angular.module('myModule', ['textAngular'])```.
3. Create an element to hold the editor and add an `ng-model="htmlVariable"` attribute where `htmtlVariable` is the scope variable that will hold the HTML entered into the editor:
```html
<div text-angular ng-model="htmlVariable"></div>
```
OR
```html
<text-angular ng-model="htmlVariable"></div>
```
This acts similar to a regular AngularJS / form input if you give it a name attribute, allowing for form submission and AngularJS form validation.

Have fun!
 
**Important Note:** Though textAngular supports the use of all attributes in it's input, please note that angulars ng-bind-html **WILL** strip out all of your style attributes.

For Additional options see the [github Wiki](https://github.com/fraywing/textAngular/wiki).

### Issues?

textAngular uses ```execCommand``` for the rich-text functionality. 
That being said, its still a fairly experimental browser feature-set, and may not behave the same in all browsers - see http://tifftiff.de/contenteditable/compliance_test.html for a full compliance list.
It has been tested to work on Chrome, Safari, Opera, Firefox and Internet Explorer 8+.
If you find something, please let me know - throw me a message, or submit a issue request!

## Developer Notes

When checking out, you need a node.js installation, running `npm install` will get you setup with everything to run the unit tests and minification.

## License

This project is licensed under the [MIT license](http://opensource.org/licenses/MIT).


## Contributers

Special thanks to all the contributions thus far! 

Including those from:

* [SimeonC](https://github.com/SimeonC)
* [slobo](https://github.com/slobo)
* [edouard-lopez](https://github.com/edouard-lopez)
* [108ium](https://github.com/108ium)
* [nadeeshacabral](https://github.com/nadeeshacabral) 
* [netbubu17](https://github.com/netbubu17)
* [worldspawn](https://github.com/worldspawn)
* [JonathanGawrych](https://github.com/JonathanGawrych)
* [kanakiyajay](https://github.com/kanakiyajay)
* [kencaron](https://github.com/kencaron)
* [gintau](https://github.com/gintau)
* [uxtx](https://github.com/uxtx)