$(document).ready(function() {
	
	$("#sign_in_field_email").focus();
	
	$("#search_main_content table tr.rows").live('click', function() {
		$("#search_main_content table tr.rows").css('background', '');
		$(this).css('background', '#FAF8CC');
	});
	
	/*
	 * Show search save form
	 */
	$("#search_save_selected").live('click', function() {
		$('#search_save_form').slideToggle('fast');
	});
	
	/*
	 * Hide search save form
	 */
	$("#search_save_form_cancel").live('click', function() {
		$('#search_save_form').slideToggle('fast');
	});

	/*
	 * Un/Select from checkbox
	 */
	$('#search_main_content table tr.headers td.checkbox input').live('click', function() {
		var status = $(this).attr('checked');
		
		if (status == false)
			$('#search_main_content table tr.rows td.checkbox input').attr('checked', false);
		else
			$('#search_main_content table tr.rows td.checkbox input').attr('checked', true);
	});

	$('#search_save_progress_bar').progressbar({
		value: 0
	});
	
	$("#search_refine").live('click', function() {
		var status = $("#searchbar_refine").css("display");

		if (status == 'block') {
			$("#searchbar_refine").slideUp('fast');
			$(this).text("Refine Search ▼");
		}
		else {
			$("#searchbar_refine").slideDown('fast');
			$(this).text("Refine Search ▲");
		}
	});
	
	$('#search_save_form_button').live('click', function() {
		var _collection_id = $('#search_save_form select').val();
		var _query = $('#search_label').text();
		var _mpn = '';
		var _price = '';
		var _seller = '';
		var _condition = '';
		var _brand = '';
		var _upc = '';
		var _ean = '';
		var _model_number = '';
		var _type = '';
		var _url = '';
		var _image_url = '';
		var _country = '';
		var _expiration = '';
		var _total_products = $('#search_main_content table tr.rows td.checkbox input:checked').length;
		var _num_products_saved = 0;
		var _percent_done = 0;
		var $row;
		
		$('#search_save_progress_bar').css('display', 'block');
		$('#search_save_progress_percent').css('display', 'block');
		
		$('#search_main_content table tr.rows td.checkbox input:checked').each(function() {
			$row = $(this).parent().parent()
			
			_mpn = $row.find('td.mpn').text();
			_price = $row.find('td.price').text();
			_seller = $row.find('td.seller').text();
			_condition = $row.find('td.condition').text();
			_brand = $row.find('td.brand').text();
			_upc = $row.find('td.upc').text();
			_ean = $row.find('td.ean').text();
			_model_number = $row.find('td.model_number').text();
			_type = $row.find('td.type').text();
			_url = $row.find('td.url').text();
			_image_url = $row.find('td.image_url').text();
			_country = $row.find('td.country').text();
			_expiration = $row.find('td.expiration').text();
			
			$.ajax({
				type: "POST",
				url: "/product/index/",
				data: { collection_id: _collection_id, query: _query, mpn: _mpn, price: _price, seller: _seller, condition: _condition, brand: _brand, upc: _upc, ean: _ean, model_number: _model_number, type: _type, url: _url, image_url: _image_url, country: _country, expiration: _expiration },
				success: function() {
					_num_products_saved++;
					_percent_done = Math.ceil(_num_products_saved/_total_products*100);
					$("#search_save_progress_bar").progressbar("option", "value", _percent_done);
					$('#search_save_progress_percent').text(_percent_done + "%");
					
					if (_percent_done == 100) {
						$("#search_message a").text($('#search_save_form select option:selected').text()).attr('href', '/collections/' + _collection_id);
						$('#search_save_form').slideToggle('fast');
						$("#search_message").fadeIn('fast');
						$('#search_main_content table tr.header td.checkbox input').attr('checked', false);
						$('#search_main_content table tr.rows td.checkbox input').attr('checked', false);
					}
				}
			});
		});
	});
	
	$( "#price_range" ).slider({
		range: true,
		min: 1,
		max: 10000,
		values: [2500, 7500],
		slide: function( event, ui ) {
			$("#price_range_values").text("$" + ui.values[0] + " - $" + ui.values[1]);
			$("#price_low").val(ui.values[0]);
			$("#price_hi").val(ui.values[1]);
		}
	});
});