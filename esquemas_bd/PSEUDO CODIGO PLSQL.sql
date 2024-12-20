autorizarPase(peticion)

   si existe peticion.quickpass y quickpass está activo 

      obtener el tipoVehiculo asociado al peticion.quickpass
      obtener el peaje asociado al peticion.idAntena

      si existe el peaje y el tipoVehiculo

         consultarCosto del peaje y tipoVehiculo

         buscarCuentas asociadas al peticion.quickpass
         pudoAutorizar = false

         mientras hayaCuentasPorRevisar y !pudoAutorizar (recorrer el cursor de cuentas)
            si saldoCuenta >= montoCobrar
               registrarTransaccion (peticion.quickpass, peaje, montoCobrar, peticion.idAntena, idCuenta)
               actualizarSaldo de la cuenta (saldoCuenta - montoCobrar)
               pudoAutorizar = true
            fin si saldoCuenta >= montoCobrar
         fin mientras hayaCuentasPorRevisar y !pudoAutorizar

         si !pudoAutorizar
            rechazarPase
         fin si !pudoAutorizar

      sino existe el peaje o el tipoVehiculo
         rechazarPase
      fin

   sino existe peticion.quickpass o quickpass no está activo
      rechazarPase
   fin

fin de autorizarPase




