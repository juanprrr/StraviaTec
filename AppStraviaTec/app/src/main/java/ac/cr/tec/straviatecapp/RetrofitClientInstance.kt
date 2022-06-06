package ac.cr.tec.straviatecapp

import com.google.gson.Gson
import com.google.gson.GsonBuilder
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

/**
 * Clase para crear instancia de retrofit cliente
 */
class RetrofitClientInstance {
    private val baseURL = "baseurl"
    private lateinit var retrofit: Retrofit
    private lateinit var gson: Gson

    fun getRetrofit(): Retrofit {
        if(retrofit==null) {
            gson = GsonBuilder().setLenient().create()

            retrofit = Retrofit.Builder()
                .baseUrl(baseURL)
                .addConverterFactory(GsonConverterFactory.create())
                .build()
        }

        return retrofit
    }
}
