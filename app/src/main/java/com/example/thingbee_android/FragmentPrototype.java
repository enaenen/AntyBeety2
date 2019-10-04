package com.example.thingbee_android;


import android.Manifest;
import android.app.DatePickerDialog;
import android.app.TimePickerDialog;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.location.Location;
import android.os.Build;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.core.app.ActivityCompat;
import androidx.fragment.app.Fragment;
import androidx.preference.PreferenceManager;

import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.TimePicker;
import android.widget.Toast;

import com.example.thingbee_android.retorift.ApiNewsService;
import com.example.thingbee_android.retorift.ApiReportService;
import com.example.thingbee_android.retorift.ReportInfoVO;
import com.skt.Tmap.TMapGpsManager;
import com.skt.Tmap.TMapMarkerItem;
import com.skt.Tmap.TMapPoint;
import com.skt.Tmap.TMapPolyLine;
import com.skt.Tmap.TMapView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;


/**
 * A simple {@link Fragment} subclass.
 */
public class FragmentPrototype extends Fragment{


    private Retrofit retrofit;
    private List<ReportInfoVO> reports;
    private ApiReportService reportService;

    private boolean compassFlag = false;    //  나침반 모드
    private boolean sightFlag=false;  // 현 위치 모드
    private boolean sightCenterFlag=false;
    private TMapPoint tpoint;
    private Context mContext =null;
    public static final int REQUEST_ACCESS_FINE_LOCATION = 1000;

    private Bitmap bitmap;
    private ViewGroup view;
    private Button dateButton;//날짜 선택 버튼
    private Button timeButton;//시간 선택 버튼
    private Button submit;//확인 버튼
    private ImageButton btnSight; // 내 위치 버튼
    private Spinner category;
    private TextView comment;

    private TMapView tMapView;
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
        btnSight = view.findViewById(R.id.btnSight);
        relativeLayout.addView(tMapView); // 화면에 지도 추가
        tMapView.setIconVisibility(false);
        //tMapView.setOnClickListenerCallBack(new FragmentPrototype.MapClickListener());
        //tMapView.setOnLongClickListenerCallback(new FragmentPrototype.MapLongClickListener());
        // 지도 스크롤 종료 -> 지도 화면 선택 종료시, 드래그 종료시
        tMapView.setOnDisableScrollWithZoomLevelListener(new TMapView.OnDisableScrollWithZoomLevelCallback() {
            @Override
            public void onDisableScrollWithZoomLevelEvent(float zoom, TMapPoint centerPoint) {
                // 현 위치 모드 또는 나침반모드가 켜져 있으면
                if(sightFlag){
                    getActivity().runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            btnSight.setImageResource(R.drawable.location_not_center);
                        }
                    });
                    sightFlag = false;
                    sightCenterFlag = false;
                    compassFlag = false;
                }
            }
        });
        //지도 초기화
        initGps();
        //나침반 버튼(현재위치 버튼)
        view.findViewById(R.id.btnSight).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                onSight(view);
            }
        });

        //버튼 바인딩
        dateButton=view.findViewById(R.id.dateBtn);
        timeButton=view.findViewById(R.id.timeBtn);
        submit = view.findViewById(R.id.submitButton);
        category = view.findViewById(R.id.categorySpinner);
        comment = view.findViewById(R.id.commentArea);

        //retrofit 초기화

        retrofit=new Retrofit.Builder()
                .baseUrl(ApiReportService.API_URL)
                .addConverterFactory(GsonConverterFactory.create())
                .build();
        reportService = retrofit.create(ApiReportService.class);

//        tMapView.setCenterPoint( 126.985302, 37.570841 ); // 지도 중심 화면 조정
        //카테고리 선택 설정
        final Spinner category_spinner = (Spinner)view.findViewById(R.id.categorySpinner);
        String[] categories = getResources().getStringArray(R.array.categoryArray);
        final ArrayAdapter<String> category_adapter = new ArrayAdapter<String>(this.getContext(),R.layout.support_simple_spinner_dropdown_item,categories);
        category_spinner.setAdapter(category_adapter);
        // 날짜 선택버튼 리스너 부착
        dateButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                long now = System.currentTimeMillis();
                Date date = new Date(now);
                DatePickerDialog datePickerDialog = new DatePickerDialog(view.getContext(),
                        new DatePickerDialog.OnDateSetListener() {

                            @Override
                            public void onDateSet(DatePicker datePicker, int year, int monthOfYear, int dayOfMonth) {
                                dateButton.setText(""+year+"-"+(monthOfYear+1)+"-"+dayOfMonth);
                            }

                        },date.getYear()+1900, date.getMonth(), date.getDate());
                datePickerDialog.show();
            }
        });

        // 시간 선택버튼 리스너 부착
        timeButton.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view) {
                long now = System.currentTimeMillis();
                Date date = new Date(now);
                TimePickerDialog timePickerDialog =  new TimePickerDialog(view.getContext(), new TimePickerDialog.OnTimeSetListener() {
                    @Override
                    public void onTimeSet(TimePicker timePicker, int hour, int min) {
                        timeButton.setText(""+hour+"-"+min);
                    }
                },date.getHours(),date.getMinutes(),false);
                timePickerDialog.show();

            }
        });
        btnSight.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view) {
                onSight(view);
            }
        });

        submit.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view) {
                //유효성 체크
                if(validCheck()) {
                    Toast.makeText(mContext.getApplicationContext(), "카테고리 혹은 날짜를 선택해주세요.",Toast.LENGTH_LONG).show();
                    return;
                }

                tpoint=tMapView.getCenterPoint();
                //Toast.makeText(mContext.getApplicationContext(), ""+tpoint.getLatitude()+" AND "+tpoint.getLongitude(),Toast.LENGTH_LONG).show();
                reportSubmit(tpoint.getLatitude(),tpoint.getLongitude());
                //report();
            }
        });

        return view;
    }
    public boolean validCheck(){
        if( category.getSelectedItem().toString().equals("카테고리 선택"))
            return true;
        if(dateButton.getText().equals("날짜"))
            return true;
        if( timeButton.getText().equals("시간"))
            return true;

        return false;
    }
    //submit을 눌렀을때 report
    public void reportSubmit(double lat, double lon){
        Map<String,Object> map = new HashMap<String,Object>();
        String oDate  = dateButton.getText()+"-"+timeButton.getText();

        map.put("lat", lat);
        map.put("lon",lon);
        map.put("address","temp");
        map.put("category",category.getSelectedItem().toString());
        map.put("comments",comment.getText());
        map.put("date",oDate);
        Call<Integer> call = reportService.addReport(map);
        call.enqueue(new Callback<Integer>() {
            @Override
            public void onResponse(Call<Integer> call, Response<Integer> response) {
                Toast.makeText(mContext.getApplicationContext(), "성공적으로 등록되었습니다.",Toast.LENGTH_LONG).show();
            }

            @Override
            public void onFailure(Call<Integer> call, Throwable t) {
                Toast.makeText(mContext.getApplicationContext(), "등록에 실패하였습니다.",Toast.LENGTH_LONG).show();
            }
        });


    }
    public void report(){
        TMapPoint leftTopPoint = tMapView.getLeftTopPoint();
        TMapPoint rightBottomPoint = tMapView.getRightBottomPoint();

        Map<String, Object> params = new HashMap<String,Object>();

        double top = leftTopPoint.getLatitude();
        double left = leftTopPoint.getLongitude();
        double bottom = rightBottomPoint.getLatitude();
        double right = rightBottomPoint.getLongitude();

        params.put("top",top);
        params.put("left",left);
        params.put("right",right);
        params.put("bottom",bottom);

        Call<List<ReportInfoVO>> call = reportService.searchReport(params);
        call.enqueue(new Callback<List<ReportInfoVO>>(){

            @Override
            public void onResponse(Call<List<ReportInfoVO>> call, Response<List<ReportInfoVO>> response) {
                List<ReportInfoVO> result = response.body();
                if(result!=null){
                    reports.clear();
                    reports.addAll(result);
                }
            }

            @Override
            public void onFailure(Call<List<ReportInfoVO>> call, Throwable t) {
                t.printStackTrace();
            }
        });


    }

    @Override
    public void onAttach(@NonNull Context context) {
        super.onAttach(context);
        mContext = context;
    }

    public void initGps() {
        // gps 관련
        gps = new TMapGpsManager(this.getContext());
        gps.setMinTime(1000);
        gps.setMinDistance(5);
        gps.setProvider(gps.NETWORK_PROVIDER);  // 연결된 인터넷으로 현 위치를 받는다
//        gps.setProvider(gps.GPS_PROVIDER);    // GPS로 현 위치를 잡는다
        // 시작할 때 위치모드가 켜져 있으면 시작 위치로 바로 이동
        if(checkLocationPermission() == true) {
            showPresentLocation();
        }
    }
    // 버튼 클릭했을 때 메소드 분기
    public void onSight(View view){
        // 현위치, 나침반 모드 끄기
        if (sightFlag == true && compassFlag == true) {
            hidePresentLocation();
        }
        // 현위치만 표시되어있을때 나침반 모드 켜기
        else if(sightFlag == true){
            onCompassMode();
        }
        // 현 위치 모드 켜기
        else {
            if(checkLocationPermission() == true) {
                showPresentLocation();
            }
        }
    }
    // 나침반 모드 켜기 ( 현재 위치 켜져 있을 때만 )
    public void onCompassMode(){
        if(sightCenterFlag == false){   // 현재 위치가 화면 중심이 아니면 중심으로 이동
            tMapView.setTrackingMode(true);
            sightCenterFlag = true; // 현재 위치가 중심 = true
            return ;
        }
        tMapView.setSightVisible(true); // 시야 표시
        tMapView.setCompassMode(true);  // 나침반 모드 ON
        compassFlag = true;             // 나침반 Flag on
        btnSight.setImageResource(R.drawable.compass);
    }

    // 현재 위치 표시 -- 마커 이미지는 안됨
    public void showPresentLocation() {
        gps.OpenGps();  // GPS 키고
        tMapView.setTrackingMode(true); //  현재 위치 트래킹
        tMapView.setIconVisibility(true);   // 현 위치 아이콘 표시

        sightFlag =true;    // 현 위치 모드 TRUE
        sightCenterFlag = true;     // 현재 위치가 화면 중심이다 ㅇㅇ
        btnSight.setImageResource(R.drawable.location_click);   // 이미지 변경
    }

    // 현재 위치 끄기, 나침반도 같이 끄기
    public void hidePresentLocation(){
        gps.CloseGps();
        TMapGpsManager temp = gps;
        tMapView.setIconVisibility(false); // 현재 위치 아이콘 숨기기
        tMapView.setSightVisible(false);    // 시야표시 숨기기
        tMapView.setTrackingMode(false);    // 현재 위치 트래킹 끄기
        tMapView.setCompassMode(false); // 나침반 모드 끄기
        sightFlag = false;
        compassFlag =false;
        btnSight.setImageResource(R.drawable.location);
    }
    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        // grantResults[0] 거부 -> -1
        // grantResults[0] 허용 -> 0 (PackageManager.PERMISSION_GRANTED)

        // 권한 획득
        if(grantResults[0] == PackageManager.PERMISSION_GRANTED){
            showPresentLocation();
        }
        // 권한 거부
        else {
            return ;
        }
    }

    // 위치 권한 확인하기
    public boolean checkLocationPermission() {
        if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.M){
            int permissionCheck = ActivityCompat.checkSelfPermission(mContext, Manifest.permission.ACCESS_FINE_LOCATION);
            int permissionCheck2 = ActivityCompat.checkSelfPermission(mContext, Manifest.permission.ACCESS_COARSE_LOCATION);
            if(permissionCheck != PackageManager.PERMISSION_GRANTED && permissionCheck2 != PackageManager.PERMISSION_GRANTED) {
                //권한 없음
                ActivityCompat.requestPermissions(getActivity(), new String[]{
                        Manifest.permission.ACCESS_FINE_LOCATION, Manifest.permission.ACCESS_COARSE_LOCATION}, REQUEST_ACCESS_FINE_LOCATION);
                return false;
            }
            else {
                // 권한 있음
                return true;
            }
        }
        // 권한 체크 필요 없는 버전
        else {
            return true;
        }
    }

/*
    /// 리포트 찾기
    public void searchFacility() throws JSONException {
        TMapPoint leftTopPoint = tMapView.getLeftTopPoint();
        TMapPoint rightBottomPoint = tMapView.getRightBottomPoint();

        double top = leftTopPoint.getLatitude();
        double left = leftTopPoint.getLongitude();
        double bottom = rightBottomPoint.getLatitude();
        double right = rightBottomPoint.getLongitude();

        try {
//            new HttpThread(getString(R.string.searchFacilityURL) +
            new HttpThread("http://think.powerlinux.co.kr/api/map/search/mobile" +
                    "?la="+bottom+
                    "&ka="+top+
                    "&ea="+left+
                    "&ja="+right+
                    "&facilFlag="+ URLEncoder.encode(facility.getFacilitiesFlag(),"UTF-8")+
                    "&facilName="+ URLEncoder.encode(String.valueOf(facility.getFacilitiesName()),"UTF-8")).start();
        } catch (UnsupportedEncodingException | JSONException e) {
            e.printStackTrace();
        }
//            }
//        },500);
    }

    // 리포트를 지도에 표시하는 스레드
    private class HttpThread extends Thread {
        String url;
        String result;

        public HttpThread(String url){
            this.url  = url;
        }

        public void run() {
            try{
                HttpURLConnection conn =
                        (HttpURLConnection) new URL(url).openConnection();
                conn.setRequestMethod("GET");
                conn.setDoInput(true); // 서버에서 오는 데이터 수신

                int status = conn.getResponseCode();
                InputStream is ;
                if(status != HttpURLConnection.HTTP_OK){
                    is = conn.getErrorStream();
                }
                else {
                    is = conn.getInputStream();
                }

                BufferedReader br = new BufferedReader(
                        new InputStreamReader(is,getString(R.string.encoding)) );

                StringBuffer buffer = new StringBuffer();
                String line = br.readLine();
                while(line != null){
                    buffer.append(line);
                    line = br.readLine();
                }
                br.close();
                result = buffer.toString();
                if(status != HttpURLConnection.HTTP_OK) {
                    runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            Toast.makeText(getApplicationContext(), result, Toast.LENGTH_LONG).show();
                        }
                    });
                    return;
                }
                // 에러가 발생하지 않은 경우
                final JSONArray jsonArray = new JSONArray(result);
                JSONArray dataArray;
                JSONObject jsonObject ;
                JSONObject dataObject ;
                for(int i=0; i<jsonArray.length(); i++){
                    try {
                        jsonObject = jsonArray.getJSONObject(i);
                        if(jsonObject.isNull("data")) { continue;}
                        dataArray = (JSONArray) jsonObject.get("data");

                        List<TMapMarkerItem> tempList = null;  // 시설물 배열 동적으로 결정할 임시

                        switch ((String) jsonObject.get("name")){
                            case "cctv":
                                bitmap =  BitmapFactory.decodeResource(getApplicationContext().getResources(), R.drawable.cctv_color);
                                tempList = cctvList;
                                break;
                            case "bell":
                                bitmap =  BitmapFactory.decodeResource(getApplicationContext().getResources(), R.drawable.bell_color);
                                tempList = bellList;
                                break;
                            case "guard":
                                bitmap =  BitmapFactory.decodeResource(getApplicationContext().getResources(), R.drawable.protect_color);
                                tempList = protectList;
                                break;
                            case "convenience":
                                bitmap =  BitmapFactory.decodeResource(getApplicationContext().getResources(), R.drawable.shop_color);
                                tempList = shopList;
                                break;
                            case "light":
                                bitmap =  BitmapFactory.decodeResource(getApplicationContext().getResources(), R.drawable.lamp_color);
                                tempList = lampList;
                                break;
                            case "police":
                                bitmap =  BitmapFactory.decodeResource(getApplicationContext().getResources(), R.drawable.police_color);
                                tempList = policeList;
                                break;
                            default :
                                break;
                        }


                        for(int j = 0; j< dataArray.length(); j++){
                            TMapMarkerItem markerItem = new TMapMarkerItem();
                            dataObject = (JSONObject) dataArray.get(j);
                            TMapPoint tMapPoint = new TMapPoint((double) dataObject.get("lat"),(double) dataObject.get("lng"));

                            markerItem.setIcon(bitmap);
                            markerItem.setPosition(0.5f,0.5f);
                            markerItem.setTMapPoint(tMapPoint);
                            markerItem.setName((String) dataObject.get("code"));
                            tMapView.addMarkerItem((String) dataObject.get("code"),markerItem);

                            tempList.add(markerItem);   // 시설물 배열에 마커 추가
                        }
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                }
                // 스레드로 시설물 표시
//                runOnUiThread(new Runnable() {
//                    @Override
//                    public void run() {
//
//
//                    }
//                });
            }
            catch(Exception e ){e.printStackTrace();}
        }
    }

    // 시설물 숨기기
    public void hideFacility(final List<TMapMarkerItem> list){
        runOnUiThread(new Runnable() {
            @Override
            public void run() {
                for(int i=0; i<list.size(); i++ ){
                    String id = list.get(i).getID();
                    tMapView.removeMarkerItem(id);
                }
            }
        });
        list.clear();
    }
*/

}
