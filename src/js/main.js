Liferay.on(
	'allPortletsReady',
	function() {
	}
);

var navItems = document.querySelectorAll('#banner .root-nav-item');
var childNavWrapper = document.querySelector('#banner .child-nav-wrapper');

for (i = 0; i < navItems.length; i++) {
	var item = navItems[i];

	item.addEventListener(
		"mouseenter",
		function(event) {
			childNavWrapper.classList.add(event.currentTarget.getAttribute('data-child-class'));
		}
	);

	item.addEventListener(
		"mouseleave",
		function(event) {
			childNavWrapper.classList.remove(event.currentTarget.getAttribute('data-child-class'));
		}
	);
}