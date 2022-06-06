package ac.cr.tec.straviatecapp

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.AdapterView
import android.widget.ArrayAdapter
import android.widget.Spinner
import android.widget.SpinnerAdapter
import kotlinx.android.synthetic.main.activity_load.*
import java.net.Inet4Address

class LoadActivity : AppCompatActivity() {

    lateinit var spinType : Spinner

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_load)
        etDate.setOnClickListener{ showDatePicker() }
        etTime.setOnClickListener{ showTimePicker() }

        btnCF.setOnClickListener{
            val intent = Intent()
                .setType("*/*")
                .setAction(Intent.ACTION_GET_CONTENT)

            startActivityForResult(Intent.createChooser(intent, "Select a file"), 111)

        }


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

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?){
        super.onActivityResult(requestCode, resultCode, data)

        if (requestCode==111 && resultCode == RESULT_OK){
            val selectedFile = data?.data
        }

    }

    private fun showTimePicker() {
        val timePicker = TimePickerFragment {onTimeSelected(it)}
        timePicker.show(supportFragmentManager, "time")
    }

    private fun onTimeSelected(time:String){
        etTime.setText("Hora: $time")
    }
    private fun showDatePicker() {
        val datePicker = DatePickerFragment { day, month, year -> onDateSelected(day, month, year) }
        datePicker.show(supportFragmentManager, "datePicker")
    }

    fun onDateSelected(day: Int, month: Int, year: Int){
        etDate.setText("Fecha: $day / $month / $year")
    }
}