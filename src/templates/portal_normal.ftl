<!DOCTYPE html>

<#include init />

<html class="${root_css_class} rhc-theme" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${the_title}</title>

	<meta content="initial-scale=1.0, width=device-width" name="viewport" />

	<#if theme_settings["custom-head-code"]?has_content>
		${theme_settings["custom-head-code"]}
	</#if>

	<link href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,400i,500,600,700" rel="stylesheet">

	<@liferay_util["include"] page=top_head_include />
</head>

<body class="${css_class}">

<@liferay_ui["quick-access"] contentId="#main-content" />

<@liferay_util["include"] page=body_top_include />

<@liferay.control_menu />

<div class="container-fluid" id="wrapper">
	<#include "${full_templates_path}/banner.ftl" />

	<section id="content">
		<h1 class="hide-accessible">${the_title}</h1>

		<#if selectable>
			<@liferay_util["include"] page=content_include />
		<#else>
			${portletDisplay.recycle()}

			${portletDisplay.setTitle(the_title)}

			<@liferay_theme["wrap-portlet"] page="portlet.ftl">
				<@liferay_util["include"] page=content_include />
			</@>
		</#if>
	</section>

	<#if theme_settings["footer-content-article-id"]?has_content>
		<#assign VOID = freeMarkerPortletPreferences.setValue("portletSetupPortletDecoratorId", "barebone") />
		<#assign theme_groupID = htmlUtil.escape(theme_display.getCompanyGroupId()?string) />
		<#assign VOID = freeMarkerPortletPreferences.setValue("groupId", "${group_id}") />
		<#assign VOID = freeMarkerPortletPreferences.setValue("articleId", '${theme_settings["footer-content-article-id"]}') />

		<footer id="footer" role="contentinfo">
			<@liferay_portlet["runtime"]
				defaultPreferences="${freeMarkerPortletPreferences}"
				portletProviderAction=portletProviderAction.VIEW
				instanceId='${theme_settings["footer-content-article-id"]}'
				portletName="com_liferay_journal_content_web_portlet_JournalContentPortlet" />
		</footer>

		${freeMarkerPortletPreferences.reset()}
	</#if>
</div>

<@liferay_util["include"] page=body_bottom_include />

<@liferay_util["include"] page=bottom_include />

</body>

</html>