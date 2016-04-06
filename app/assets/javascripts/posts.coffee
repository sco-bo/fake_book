jQuery ->
	if $('.pagination').length
		$(window).scroll ->
			url = $('.pagination .next_page a').attr('href')
			if url && $(window).scrollTop() > $(document).height() - $(window).height() - 60
				$('.pagination').text("Fetching more posts...")
				$.getScript(url)
		$(window).scroll