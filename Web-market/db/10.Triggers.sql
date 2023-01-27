-- Trigger: trg_product_date_autoins

CREATE TRIGGER trg_product_date_autoins
    BEFORE INSERT
    ON "web-market".products
    FOR EACH ROW
    EXECUTE FUNCTION "web-market".product_date_autoins();
	
-- Trigger: trg_product_date_upd

CREATE TRIGGER trg_product_date_upd
    AFTER UPDATE 
    ON "web-market".products
    FOR EACH ROW
    EXECUTE FUNCTION "web-market".product_date_update();