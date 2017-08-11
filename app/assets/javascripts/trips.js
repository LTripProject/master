$(document).ready(function() {
    $('.wysihtml5').each(function(i, elem) {

      var el = $(elem).wysihtml5({
      	toolbar: {
			    "font-styles": true, //Font styling, e.g. h1, h2, etc. Default true
			    "emphasis": true, //Italics, bold, etc. Default true
			    "lists": true, //(Un)ordered lists, e.g. Bullets, Numbers. Default true
			    "html": false, //Button which allows you to edit the generated HTML. Default false
			    "link": true, //Button to insert a link. Default true
			    "image": true, //Button to insert an image. Default true,
			    "color": false, //Button to change color of font  
			    "blockquote": true, //Blockquote  
			    "size": "sm", //default: none, other options are xs, sm, lg
			    'autoresize-limit': 250
			  }
      });


      
    });

    
});