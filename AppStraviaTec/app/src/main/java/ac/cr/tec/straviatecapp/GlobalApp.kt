package ac.cr.tec.straviatecapp

import android.app.Application

/**C
 * Clase para mantener una única y misma sesión a
 * través de la aplicación
 */
class GlobalApp : Application() {
    var session: Session? = null
}