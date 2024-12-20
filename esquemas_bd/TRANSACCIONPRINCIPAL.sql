CREATE OR REPLACE PROCEDURE AutorizarPase(
    peticionQuickpass IN NUMBER,
    peticionIdAntena IN NUMBER,
    resultado OUT NUMBER
) AS
    vTipoVehiculo NUMBER;
    vIdPeaje NUMBER;
    vMontoCobrar NUMBER;
    vSaldoCuenta NUMBER;
    vIdCuenta NUMBER;
    vQuickpassActivo NUMBER;
    vPudoAutorizar NUMBER := 0;
    vError NUMBER := 0;

    CURSOR cCuentas IS
        SELECT cpq.idCuenta, c.saldo
        FROM TABLAS_BANCO.CUENTASPORQUICKPASS cpq
        JOIN TABLAS_BANCO.CUENTA c
          ON cpq.idCuenta = c.idCuenta
        WHERE cpq.idQuickPass = peticionQuickpass;

BEGIN
    
    BEGIN
        SELECT activo INTO vQuickpassActivo
        FROM TABLAS_QUICKPASS.QUICKPASS
        WHERE idQuickpass = peticionQuickpass;

        IF vQuickpassActivo = 0 THEN
            vError := 2;
        END IF;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            vError := 1;
    END;

    
    IF vError = 0 THEN
        BEGIN
            SELECT idTipoVehiculo INTO vTipoVehiculo
            FROM TABLAS_QUICKPASS.QUICKPASS
            WHERE idQuickpass = peticionQuickpass;

            SELECT idPeaje INTO vIdPeaje
            FROM TABLAS_PEAJE.ANTENA
            WHERE idAntena = peticionIdAntena;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                vError := 3;
        END;
    END IF;

    
    IF vError = 0 THEN
        BEGIN
            SELECT monto INTO vMontoCobrar
            FROM TABLAS_PEAJE.COSTOPEAJE
            WHERE idPeaje = vIdPeaje
              AND idTipoVehiculo = vTipoVehiculo;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                vError := 4;
        END;
    END IF;

    
    IF vError = 0 THEN
        OPEN cCuentas;
        LOOP
            FETCH cCuentas INTO vIdCuenta, vSaldoCuenta;
            EXIT WHEN cCuentas%NOTFOUND;

            IF vSaldoCuenta >= vMontoCobrar THEN
                
                INSERT INTO TABLAS_QUICKPASS.TRANSACCION (
                    idTransaccion, monto, fecha, idQuickPass, idAntena
                ) VALUES (
                    TABLAS_QUICKPASS.SEQ_TRANSACCION.NEXTVAL, vMontoCobrar, SYSDATE, peticionQuickpass, peticionIdAntena
                );

                
                UPDATE TABLAS_BANCO.CUENTA
                SET saldo = saldo - vMontoCobrar
                WHERE idCuenta = vIdCuenta;

                vPudoAutorizar := 1; 
                EXIT;
            END IF;
        END LOOP;
        CLOSE cCuentas;
    END IF;

    
    IF vPudoAutorizar = 0 THEN
        INSERT INTO TABLAS_QUICKPASS.TRANSACCION (
            idTransaccion, monto, fecha, idQuickPass, idAntena
        ) VALUES (
            TABLAS_QUICKPASS.SEQ_TRANSACCION.NEXTVAL, 0, SYSDATE, peticionQuickpass, peticionIdAntena
        );
    END IF;

    
    IF vError > 0 THEN
        resultado := vError; 
    ELSIF vPudoAutorizar = 1 THEN
        resultado := 5; 
    ELSE
        resultado := 6;
    END IF;
END;
/
