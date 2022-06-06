package ac.cr.tec.straviatecapp

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.AdapterView
import android.widget.ArrayAdapter
import android.widget.Spinner
import kotlinx.android.synthetic.main.activity_start.*
import java.util.*

class StartActivity : AppCompatActivity() {

    lateinit var spinType : Spinner

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_start)


        spinType = findViewById(R.id.typeSpinner) as Spinner
        val actTypesArr = arrayOf("Correr", "Nadar", "Ciclismo", "Senderismo", "Kayak", "Caminata")

        spinType.adapter = ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, actTypesArr)
        spinType.onItemSelectedListener  = object : AdapterView.OnItemSelectedListener{
            override fun onItemSelected(parent: AdapterView<*>?, view: View?, position: Int, id: Long) {
                // conseguir opcion selecionada -> actTypesArr.get(position)
            }

            override fun onNothingSelected(p0: AdapterView<*>?) {
                TODO("Not yet implemented")
            }
        }
    }

    fun nextBtn(view: View){
        println(typeSpinner.selectedItem)
        println(switchCarrera.isChecked)
        val intent = Intent(this, TrackActivity::class.java)
        intent.putExtra("activityType", typeSpinner.selectedItem.toString())
        if(switchCarrera.isChecked) {
            intent.putExtra("carrera", etIdCarrera.text)
        } else{
            intent.putExtra("carrera", "")
        }

        if (switchReto.isChecked) {
            intent.putExtra("reto", etIdReto.text)
        } else{
            intent.putExtra("reto", "")
        }

        startActivity(intent)

    }


}