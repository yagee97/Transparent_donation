package org.test.ahn.mdm_app;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;

public class MainActivity extends AppCompatActivity {

    Button LDrawer, MND, login, TabBar, UserNavi, BottomNavi;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        MND = (Button)findViewById(R.id.MND);
        login = (Button)findViewById(R.id.login);
        TabBar = (Button)findViewById(R.id.TabBar);
        UserNavi = (Button)findViewById(R.id.UserNavi);
        BottomNavi = (Button)findViewById(R.id.BottomNavi);

//        MND.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View view) {
//                Intent intent = new Intent(getApplicationContext(), );
//                startActivity(intent);
//            }
//        });
//
//        login.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View view) {
//                Intent intent = new Intent(getApplicationContext(), );
//                startActivity(intent);
//            }
//        });
//
//        TabBar.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View view) {
//                Intent intent = new Intent(getApplicationContext(), );
//                startActivity(intent);
//            }
//        });

        UserNavi.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getApplicationContext(), UserNavi.class);
                startActivity(intent);
            }
        });

        BottomNavi.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getApplicationContext(), Navigation.class);
                startActivity(intent);
            }
        });
    }
}
