package ac.cr.tec.straviatecapp

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.os.Looper
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.create

class MainActivity : AppCompatActivity() {

    private val activity = this@MainActivity
    private lateinit var lgnButton: Button

    //private val userNameList = mutableListOf<String>()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        lgnButton = findViewById(R.id.loginButton)
        lgnButton.setOnClickListener{
            login()
        }



    }

    /**
     * Se encarga de buscar si correo y contraseña coinciden
     * en la base de datos.
     */


    fun login() {
        val username = findViewById<EditText>(R.id.emailInput).text.toString()
        val password = findViewById<EditText>(R.id.passwordInput).text.toString()
        val user = User(username, password)
        val session = Session(this, user)


        // se valida si usuario se encuentra en la base de datos

        session.addQueso()
        session.login { success ->
            run {
                if (success) {
                    (application as GlobalApp).session = session
                    val intent = Intent(this, HomeActivity::class.java)
                    startActivity(intent)
                } else {
                    Toast.makeText(this, "Invalid username or password", Toast.LENGTH_SHORT).show()
                }
            }
        }

    }


    /**
     * Se encarga de limpiar los inputs
     */
    private fun emptyInputEditText() {
        findViewById<EditText>(R.id.emailInput)!!.text = null
        findViewById<EditText>(R.id.passwordInput)!!.text = null
    }

    private fun getRetrofit():Retrofit{
        return Retrofit.Builder()
            .baseUrl("URL-BASE")
            .addConverterFactory(GsonConverterFactory.create())
            .build()
    }

    private fun sync() {
        CoroutineScope(Dispatchers.IO).launch {
            val userCall = getRetrofit().create(APIService::class.java).getUsernames("URLforUSERS")
            val pwCall = getRetrofit().create(APIService::class.java).getPasswords("URLforUSERS")
            val _usernames = userCall.body()
            val _passwords = pwCall.body()
            runOnUiThread{
                if (userCall.isSuccessful){
                    val usernames = _usernames?.username ?: emptyList<String>()
                    val passwords = _usernames?.password ?: emptyList<String>()
                }else {
                    showError()
                }
            }
        }
    }


    private fun showError() {
        Toast.makeText(this, "Ha ocurrido un error", Toast.LENGTH_SHORT).show()
    }
}