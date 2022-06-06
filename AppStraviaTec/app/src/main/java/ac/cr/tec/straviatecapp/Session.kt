package ac.cr.tec.straviatecapp

import android.content.Context
import androidx.room.Room

/**
 * Clase session para mantener el uso del mismo usuario y base de datos a lo largo
 * del uso de la aplicacion
 */
class Session (
    var context: Context,
    private val user: User,
    private val db: LocalDB = Room.databaseBuilder(context.applicationContext, LocalDB::class.java, "localdb.db").allowMainThreadQueries().build()
        ){

    /**
     * Verifica credenciales
     */
    fun login(auth: (Boolean) -> Unit) {
        val usersfound = db.userDao().findCredentials(user.username, user.password)
        if (usersfound == null){
            auth(false)
        } else{
            auth(true)
        }
    }

    /**
     * Agrega actividad a base de datos
     */
    fun addActivity(activity: Activity, afterOp: (Boolean) -> Unit) {
        db.activityDao().insertAll(activity)
        afterOp(true)
    }

    /**
     * prueba
     */
    fun addQueso(){
        db.clearAllTables()
        db.userDao().insertAll(User("queso", "123"))
    }

    /**
     * Agrega usuario
     */
    fun addUser(user: User) {
        db.userDao().insertAll(user)
    }

    /**
     * Obtener username del usuario actual
     */
    fun getUsername(): String {
        return user.username
    }

}