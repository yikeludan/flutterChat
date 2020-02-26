package flutter.pro.com.travel;

import android.os.Bundle;
import android.os.PersistableBundle;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;
public class MainActivity extends FlutterActivity {

  @Override
  protected void onCreate(Bundle savedInstanceState) {
        //SplashScreen.show(this, true);// here

    super.onCreate(savedInstanceState);
  }

  @Override
  public void configureFlutterEngine(FlutterEngine flutterEngine) {
    GeneratedPluginRegistrant.registerWith(flutterEngine);
  }
}
