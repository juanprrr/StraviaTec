package ac.cr.tec.straviatecapp

import android.content.Context
import androidx.room.Room

class Session (
    var context: Context,
    private val user: User,
    private val db: LocalDB = Room.databaseBuilder(context.applicationContext, LocalDB::class.java, "localdb.db").allowMainThreadQueries().build()
        ){

    fun login(auth: (Boolean) -> Unit) {
        val usersfound = db.userDao().findCredentials(user.username, user.password)
        if (usersfound == null){
            auth(false)
        } else{
            auth(true)
        }
    }

    fun addActivity(activity: Activity, afterOp: (Boolean) -> Unit) {
        db.activityDao().insertAll(activity)
        afterOp(true)
    }

    fun addQueso(){
        db.clearAllTables()
        db.userDao().insertAll(User("queso", "123"))
    }

    fun addUser(user: User) {
        db.userDao().insertAll(user)
    }

    fun getUsername(): String {
        return user.username
    }

}