var banner = document.querySelector('#banner');
var navItems = banner.querySelectorAll('.root-nav-item');
var childNavWrapper = banner.querySelector('.child-nav-wrapper');

for (i = 0; i < navItems.length; i++) {
	var item = navItems[i];

	item.addEventListener(
		"mouseenter",
		function(event) {
			banner.className = event.currentTarget.getAttribute('data-child-class');
		}
	);

	banner.addEventListener(
		"mouseleave",
		function(event) {
			banner.className = '';
		}
	);
}