package com.example.thingbee_android.retorift;

import java.util.List;
import java.util.Map;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.POST;
import retrofit2.http.Query;
import retrofit2.http.QueryMap;

public interface ApiReportService {
    String API_URL = "http://localhost:8088/api/report/";

    @GET("search")
    Call<List<ReportInfoVO>> searchReport(@QueryMap Map<String,Object> params);

    @POST("add")
    Call<Integer> addReport(@QueryMap Map<String,Object> map);
}
