AUI().ready(
	'anim',
	function(A) {
		var BODY = A.getBody();

		var triggerPos = 200;

		BODY.delegate(
			'click',
			function (event) {
				var node = event.currentTarget;

				var section = A.one(node.get('hash'));

				if (!section) {
					return;
				}

				event.preventDefault();

				var offset = parseInt(node.attr('data-offset'), 10);

				var scrollTo = parseInt(section.getY(), 10);

				if ((scrollTo - window.scrollY) < triggerPos) {
					scrollTo -= bannerHeight;
				}

				if (offset) {
					scrollTo -= offset;
				}

				new A.Anim(
					{
						duration: 0.5,
						easing: 'easeBoth',
						node: 'win',
						to: {
							scroll: [0, scrollTo]
						}
					}
				).run();

				window.history.pushState('', '', node.get('hash'));
			},
			'.animate-scroll'
		);
	}
);