<header id="banner" role="banner">
	<div class="banner-wrapper">
		<div class="banner-content max-full">
			<a class="${logo_css_class}" href="${site_default_url}" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />" tabindex="0">
				<img alt="${logo_description}" class="logo-full" src="${images_folder}/custom/rhc_logo.png" />
				<img alt="${logo_description}" class="logo-icon" src="${images_folder}/custom/rhc_logo_sm.png" />
			</a>

			<a class="mobile-nav-trigger" onclick="document.querySelector('#navigation').classList.toggle('show-nav');" tabindex="0">
				<svg height="24" stroke="currentColor" stroke-miterlimit="10" stroke-width="2" viewBox="0 0 24 24" width="24"> <line class="nav-line nav-line-top" x1="0" x2="24" y1="4" y2="4"></line> <line class="nav-line nav-line-center" x1="0" x2="24" y1="12" y2="12"></line> <line class="nav-line nav-line-bottom" x1="0" x2="24" y1="20" y2="20"></line> </svg>
			</a>

			<nav class="${nav_css_class}" id="navigation" role="navigation">
				<h1 class="hide-accessible"><@liferay.language key="navigation" /></h1>

				<ul aria-label="<@liferay.language key="site-pages" />" role="menubar">
					<#list nav_items as nav_item>
						<#assign
						nav_item_attr_has_popup = ""
						nav_item_attr_selected = ""
						nav_item_css_class = "root-nav-item nav-item-${nav_item_index}"
						nav_item_layout = nav_item.getLayout()
						/>

						<#if nav_item.isSelected()>
							<#assign
							nav_item_attr_has_popup = "aria-haspopup='true'"
							nav_item_attr_selected = "aria-selected='true'"
							nav_item_css_class = "${nav_item_css_class} selected"
							/>
						</#if>

						<li ${nav_item_attr_selected} class="${nav_item_css_class}" id="layout_${nav_item.getLayoutId()}" role="presentation" tabindex="0">
							<span><@liferay_theme["layout-icon"] layout=nav_item_layout /> ${nav_item.getName()}</span>

							<#if nav_item.hasChildren()>
								<div class="child-menu nav-item-${nav_item_index}" role="menu">
									<ul class="max-full">
										<#list nav_item.getChildren() as nav_child>
											<#assign
											nav_child_attr_selected = ""
											nav_child_css_class = ""
											/>

											<#if nav_child.isSelected()>
												<#assign
												nav_child_attr_selected = "aria-selected='true'"
												nav_child_css_class = "selected"
												/>
											</#if>

											<li ${nav_child_attr_selected} class="${nav_child_css_class}" id="layout_${nav_child.getLayoutId()}" role="presentation">
												<a aria-labelledby="layout_${nav_child.getLayoutId()}" href="${nav_child.getURL()}" ${nav_child.getTarget()} role="menuitem">${nav_child.getName()}</a>
											</li>
										</#list>
									</ul>
								</div>
							</#if>
						</li>
					</#list>
				</ul>
			</nav>
		</div>
	</div>
</header>