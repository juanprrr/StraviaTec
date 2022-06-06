package ac.cr.tec.straviatecapp

import com.google.gson.annotations.SerializedName
import retrofit2.Call
import retrofit2.Response
import retrofit2.http.Body
import retrofit2.http.GET
import retrofit2.http.POST
import retrofit2.http.Url

/**
 * Interfaz que sirve como servicio API para comunicarse con base
 * de datos principal
 */
interface APIService {
    @GET("/api/Usuario/")
    suspend fun getUsernames():Response<UserCred>

    @POST("/api/Actividad/")
    suspend fun postActivities(@Body activity: Activity): Call<*>

}

data class UserCred(
    @SerializedName("usuario") var username: String,
    @SerializedName("password") var password: String,
)