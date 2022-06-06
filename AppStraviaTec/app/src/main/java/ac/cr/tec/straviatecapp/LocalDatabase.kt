package ac.cr.tec.straviatecapp

import androidx.room.*

/**
 * Definición de base de datos local
 */
@Database(
    entities = [User::class, Activity::class],
    version = 1
)
abstract class LocalDB : RoomDatabase() {
    abstract fun userDao(): UserDao
    abstract fun activityDao(): ActivityDao
}
/**
 * Entidad Usuario
 */
@Entity
data class User(
    @PrimaryKey val username: String,
    val password: String,
)

/**
 * Entidad Actividad
 */
@Entity
data class Activity(
    @PrimaryKey (autoGenerate = true)
    val ID: Int,
    val Id_reto:String,
    val Id_usuario:String,
    val start: String,
    val end: String,
    val length: Float,
    var gpx: String,
    val type: String,
)

/**
 * Interface para operaciones SQL para la entidad Usuario
 */
@Dao
interface UserDao {
    @Insert
    fun insertAll(vararg users: User)

    @Delete
    fun delete(user: User)

    @Update
    fun updateUser(user: User)

    @Query("DELETE FROM user where username = :username")
    fun deleteByUsername(username: String)

    @Query("SELECT * FROM user")
    fun getAll(): List<User>

    @Query(
        "SELECT * FROM user WHERE username = :username"
    )
    fun findUser(username: String): User?

    @Query(
        "SELECT * FROM user WHERE username = :username AND password = :password"
    )
    fun findCredentials(username: String, password: String): User?
}

/**
 * Interface para operaciones SQL para la entidad Activity
 */
@Dao
interface ActivityDao {
    @Insert
    fun insertAll(vararg activity: Activity)

    @Delete
    fun delete(activity: Activity)

    @Query("SELECT * FROM activity")
    fun getAll(): List<Activity>
}