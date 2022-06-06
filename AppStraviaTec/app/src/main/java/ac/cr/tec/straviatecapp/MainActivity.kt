package ac.cr.tec.straviatecapp

import android.app.Application
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.os.Looper
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import com.google.gson.GsonBuilder
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

        runOnUiThread {

            session.addQueso()
            session.login { success ->
                run {
                    if (success) {
                        (application as GlobalApp).session = session
                        val intent = Intent(this, HomeActivity::class.java)
                        startActivity(intent)
                    } else {
                        Toast.makeText(this, "Invalid username or password", Toast.LENGTH_SHORT)
                            .show()
                    }
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

    /**
     * Se crea instancia Retrofit
     */
    private fun getRetrofit(): Retrofit {

        return Retrofit.Builder()
            .baseUrl("baseURL")
            .addConverterFactory(GsonConverterFactory.create())
            //.client(getClient())
            .build()
    }

    /**
     * Sincroniza las bases de datos
     */
    fun sync(view: View) {
        CoroutineScope(Dispatchers.IO).launch {
            val userCall = getRetrofit().create(APIService::class.java).getUsernames()
            val _usernames = userCall.body() as User?

            runOnUiThread{
                if (userCall.isSuccessful){
                    (application as GlobalApp).session!!.addUser(_usernames!!)

                    Toast.makeText(this@MainActivity, "Se han sincornizado las bases de datos", Toast.LENGTH_SHORT)
                        .show()
                }else {
                    showError()
                }
            }
        }
    }

    /**
     * Mensaje de error generico
     */
    private fun showError() {
        Toast.makeText(this, "Ha ocurrido un error", Toast.LENGTH_SHORT).show()
    }
}