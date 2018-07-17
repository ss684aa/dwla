%dw 1.0
%output application/xml skipNullOn="everywhere"
---
products:{
	
	(payload map (prod)-> {
		
		product:{
			
			prodId:prod.productId,
			prodDesc:trim prod.ProductDesc,
			brand:prod.brand default 'NB',
			originalPrice:prod.originalPrice,
			offer:{
				offerPrice:prod.offer.offerPrie,
				offerValid:prod.offer.offerValid
				
			},
			(images:{
				
				(prod.images map (image) -> {
					image:image
				})
			}) when prod.images !=null
			
		}
		
	})
	
}