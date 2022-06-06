package ac.cr.tec.straviatecapp

import com.google.gson.annotations.SerializedName

data class UserResponse(
    @SerializedName("usuario") var username: String,
    @SerializedName("password") var password: String
)
