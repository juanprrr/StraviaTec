package ac.cr.tec.straviatecapp

import com.google.gson.annotations.SerializedName

/**
 * Data class para respuesta de api
 */
data class UserResponse(
    @SerializedName("usuario") var username: String,
    @SerializedName("password") var password: String,
)
