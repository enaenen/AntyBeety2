package com.example.thingbee_android;

import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentPagerAdapter;

public class TabViewAdapter extends FragmentPagerAdapter {
    int mNumOfTabs;


    public TabViewAdapter(FragmentManager fm, int mNumOfTabs) {
        super(fm);
        this.mNumOfTabs = mNumOfTabs;
    }

    @Override
    public Fragment getItem(int position) {
        switch (position) {

            case 0:
                FragmentMap tab1 = new FragmentMap();
                return tab1;
            case 1:
                FragmentNews tab2 = new FragmentNews();
                return tab2;
            case 2:
                FragmentStatics tab3 = new FragmentStatics();
                return tab3;
            case 3:
                FragmentPrototype tab4 = new FragmentPrototype();
                return tab4;
            default:
              FragmentSettings tab5 = new FragmentSettings();
            return tab5;
        }
    }

    @Override
    public int getCount() {
        return mNumOfTabs;
    }
}
