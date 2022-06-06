package ac.cr.tec.straviatecapp

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.PersistableBundle
import android.view.View
import android.widget.EditText
import android.widget.Toast

/**
 * Actividad Home, donde se puede escoger si iniciar una actividad
 * o si subir una actividad.
 */
class HomeActivity : AppCompatActivity() {
    private val activity =  this@HomeActivity

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_home)


    }

    /**
     * Dirige hacia actividad Load
     */
    fun gotoLoad(view: View){
        val intent = Intent(this, LoadActivity::class.java)
        startActivity(intent)
    }

    /**
     * Dirige hacia actividad Start
     */
    fun gotoStart(view: View){
        val intent = Intent(this, StartActivity::class.java)
        startActivity(intent)
    }
}