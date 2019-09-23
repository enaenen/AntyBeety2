package com.example.thingbee_android;


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
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.skt.Tmap.TMapGpsManager;
import com.skt.Tmap.TMapView;


/**
 * A simple {@link Fragment} subclass.
 */
public class FragmentPrototype extends Fragment implements TMapGpsManager.onLocationChangedCallback {


    private TMapView tMapView;
    private Bitmap bitmap;

    private TMapGpsManager gps; // 현재 위치 gps

    public FragmentPrototype() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        ViewGroup view = (ViewGroup) inflater.inflate(R.layout.fragment_prototype, container, false);
        LinearLayout relativeLayout = view.findViewById(R.id.linearLayoutTmap);
        tMapView = new TMapView(this.getContext());  // 지도 생성
//        tMapView.setUserScrollZoomEnable(true);
        tMapView.setSKTMapApiKey(getString(R.string.tMapKey));
        relativeLayout.addView(tMapView); // 화면에 지도 추가
        tMapView.setIconVisibility(false);

//        tMapView.setCenterPoint( 126.985302, 37.570841 ); // 지도 중심 화면 조정
        return view;

    }

    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.buttonSettings:
                startActivity(new Intent(getContext(), SettingsActivity.class));
                break;
        }
    }


    @Override
    public void onLocationChange(Location location) {

    }
}
