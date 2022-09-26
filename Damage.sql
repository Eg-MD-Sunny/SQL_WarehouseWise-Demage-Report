-- Damage

SELECT max(te.ThingId) MaximumThingId,min(te.ThingId) MinimumThingId
FROM ThingEvent te
JOIN ThingTransaction tt on tt.id = te.ThingTransactionId
WHERE tt.CreatedOn >= '2022-05-25 00:00 +6:00'
AND tt.CreatedOn < '2022-06-24 00:00 +6:00'
AND ToState in ( 8, 32 )

--#########################################################


Select 
	   w.Name [Warehouse],
	   count(*) Quantity,
	   sum(t.CostPrice)Amount

from thing t
join ThingEvent te on te.ThingId=t.id
join ThingTransaction tt on tt.id=te.ThingTransactionId
join productvariant pv on pv.id=t.ProductVariantId
join Warehouse w on w.Id=te.WarehouseId

where tt.CreatedOn >= '2022-05-25 00:00 +6:00'
and tt.CreatedOn < '2022-06-24 00:00 +6:00'
and ToState in (8,32)
and pv.ShelfType in (5,9)
and w.id in (8,7)
and t.id>=26427265 ------ MinimumThingId
and t.id<=154103591 ------ MaximumThingId


group by 
		 w.Name
