package com.example.thingbee_android;


import android.app.DatePickerDialog;
import android.app.TimePickerDialog;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.location.Location;
import android.os.Bundle;

import androidx.fragment.app.Fragment;
import androidx.preference.PreferenceManager;

import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.LinearLayout;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.TimePicker;
import android.widget.Toast;

import com.skt.Tmap.TMapGpsManager;
import com.skt.Tmap.TMapView;

import java.util.Date;


/**
 * A simple {@link Fragment} subclass.
 */
public class FragmentPrototype extends Fragment implements TMapGpsManager.onLocationChangedCallback {


    private TMapView tMapView;
    private Bitmap bitmap;
    private ViewGroup view;
    private Button dateButton;
    private Button timeButton;

    private TMapGpsManager gps; // 현재 위치 gps

    public FragmentPrototype() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        view = (ViewGroup) inflater.inflate(R.layout.fragment_prototype, container, false);
        LinearLayout relativeLayout = view.findViewById(R.id.linearLayoutTmap);
        tMapView = new TMapView(this.getContext());  // 지도 생성
//        tMapView.setUserScrollZoomEnable(true);
        tMapView.setSKTMapApiKey(getString(R.string.tMapKey));
        relativeLayout.addView(tMapView); // 화면에 지도 추가
        tMapView.setIconVisibility(false);
        dateButton=view.findViewById(R.id.dateBtn);
        timeButton=view.findViewById(R.id.timeBtn);

//        tMapView.setCenterPoint( 126.985302, 37.570841 ); // 지도 중심 화면 조정

        final Spinner category_spinner = (Spinner)view.findViewById(R.id.categorySpinner);
        String[] categories = getResources().getStringArray(R.array.categoryArray);
        final ArrayAdapter<String> category_adapter = new ArrayAdapter<String>(this.getContext(),R.layout.support_simple_spinner_dropdown_item,categories);
        category_spinner.setAdapter(category_adapter);




        dateButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                long now = System.currentTimeMillis();
                Date date = new Date(now);
                DatePickerDialog datePickerDialog = new DatePickerDialog(view.getContext(),
                        new DatePickerDialog.OnDateSetListener() {

                            @Override
                            public void onDateSet(DatePicker datePicker, int i, int i1, int i2) {

                            }

                        },date.getYear(), date.getMonth(), date.getDate());
                datePickerDialog.show();
            }
        });
        timeButton.setOnClickListener(new View.OnClickListener(){

            @Override
            public void onClick(View view) {
                long now = System.currentTimeMillis();
                Date date = new Date(now);
                TimePickerDialog timePickerDialog =  new TimePickerDialog(view.getContext(), new TimePickerDialog.OnTimeSetListener() {
                    @Override
                    public void onTimeSet(TimePicker timePicker, int i, int i1) {

                    }
                },date.getHours(),date.getMinutes(),false);
                timePickerDialog.show();

            }
        });

        return view;

    }


    @Override
    public void onLocationChange(Location location) {

    }
}
