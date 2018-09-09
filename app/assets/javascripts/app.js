(function (root, factory) {
	'use strict';

	if ( typeof define === 'function' && define.amd ) {
		define([], factory(root));
	} else if ( typeof exports === 'object' ) {
		module.exports = factory(root);
	} else {
		root.mudhead = factory(root);
	}
})(typeof global !== 'undefined' ? global : this.window || this.global, (function (root) {
	'use strict';

	var Mudhead = {};

		// helper for enabling IE 8 event bindings
	function addEvent(el, type, handler) {
    if (el.attachEvent) el.attachEvent('on'+type, handler); else el.addEventListener(type, handler);
	}
	// live binding helper with CSS selector
	function live(selector, event, callback, context) {
	  addEvent(context || document, event, function(e) {
      var qs = (context || document).querySelectorAll(selector);
      if (qs) {
        var el = e.target || e.srcElement, index = -1;
        while (el && ((index = Array.prototype.indexOf.call(qs, el)) === -1)) el = el.parentElement;
        if (index > -1) callback.call(el, e);
      }
	  });
	}

	Mudhead.live = live;

	Mudhead.sidebar = {
		init: false,
		options: {
			inDuration: 300,
			outDuration: 200
		},
		activate: function () {
			var o = this;
			// var sbTrigger = document.querySelector('[data-target="main-sidebar"]');
			var sbTrigger = '[data-target="main-sidebar"]';
			if (!o.init) {
				o.elems = document.querySelectorAll('.sidenav');
				o.instances = M.Sidenav.init(o.elems, o.options);
				Mudhead.live(sbTrigger, 'click', function (event) {
					o.instances.forEach(function (v, i) {
						v.open();
					});
				});
			}
		}
	};

	Mudhead.flash = {
		selector: 'body .flash-wrapper',
		delay: 3000,
		activate: function () {
			var o = this;
			setTimeout(function () {
				$(o.selector).fadeOut('slow', function () {
					$(this).remove();
				});
			}, o.delay);
		}
	}

	Mudhead.formInput = {
		selector: '.fld-input',
		parent: '.fld-grp',
		toggleClass: 'fld-grp--focused',
		activate: function () {
			var o = this;
			var baseElem = o.parent + ' ' + o.selector;
			$(baseElem).on('focus blur', function (i) {
				$(this).parents(o.parent).toggleClass(o.toggleClass, 'focus' === i.type || this.value.length > 0);
			});
		}
	};

	Mudhead.csvUploader = {
		parent_form_class: '.admin-form',
		input_file_id: 'adm_file',
		show_input_file: 'adm_file_path',
		submit_btn_selector: '.actions button.md-button',
		activate: function () {
			var o = this;
			$('body ' + o.parent_form_class).on('change', '#' + o.input_file_id, function (ev) {
				var inp = $(this);
				var lbl = inp.val().replace(/\\/g, '/').replace(/.*\//, '');
				$(o.parent_form_class).find('#' + o.show_input_file).val(lbl);
				$(o.parent_form_class).find(o.submit_btn_selector).removeAttr('disabled');
			});
		}
	};

	Mudhead.init = function () {
		var o = this;
		if ($('body').hasClass('administrate')) {
			o.csvUploader.activate();
		} else {
			o.sidebar.activate();
			o.flash.activate();
			M.updateTextFields();
			M.AutoInit();
			// $('.dropdown-trigger').dropdown({
			// 	onCloseEnd: function () {
			// 		$(this.el).blur();
			// 	}
			// });
			o.formInput.activate();
		}
		console.log('run');
	};


	function _run () {
		// M.AutoInit();
		Mudhead.init();
	}

		// in case the document is already rendered
	if (document.readyState!='loading') _run();
	// modern browsers
	else if (document.addEventListener) document.addEventListener('DOMContentLoaded', _run);
	// IE <= 8
	else document.attachEvent('onreadystatechange', function(){
	    if (document.readyState=='complete') _run();
	});


	return Mudhead;

}));
