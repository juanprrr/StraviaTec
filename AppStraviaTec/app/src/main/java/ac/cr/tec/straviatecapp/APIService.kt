package ac.cr.tec.straviatecapp

import retrofit2.Response
import retrofit2.http.GET
import retrofit2.http.Url

interface APIService {
    @GET
    suspend fun getUsernames(@Url url:String):Response<UserResponse>

    @GET
    fun getPasswords(@Url url:String):Response<UserResponse>
}