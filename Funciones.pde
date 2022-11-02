public void SetupPosicionEstructas()
{
  JSONArray listado = loadJSONArray("./data/data.json");
  for (int i=0; i<posiciones_estructuras.length; i++) {
    JSONObject item = listado.getJSONObject(i);
    int x = item.getInt("x");
    int y = item.getInt("y");
    int w = item.getInt("w");
    int h = item.getInt("h");
    int id = item.getInt("id");
    posiciones_estructuras[i][0] = x;
    posiciones_estructuras[i][1] = y;
    posiciones_estructuras[i][2] = w;
    posiciones_estructuras[i][3] = h;
    posiciones_estructuras[i][4] = id;
  }
}

public void SetupBase()
{
  JSONArray listado = loadJSONArray("./data/limites.json");
  for (int i=0; i<posiciones_base.length; i++) {
    JSONObject item = listado.getJSONObject(i);
    int x = item.getInt("x");
    int y = item.getInt("y");
    posiciones_base[i][0] = x;
    posiciones_base[i][1] = y;
  }
}

String PathGen(int material)
{
  String prefix = "./assets/";
  switch(material)
  {
  case 0:
    prefix = prefix + "vidrio";
    break;
  case 1:
    prefix = prefix + "madera";
    break;
  case 2:
    prefix = prefix + "piedra";
    break;
  default:
    prefix = prefix + "madera";
  }

  return prefix;
}

void ResetEstructuras()
{
      s_wood.loop();
  for (Estructura e : estructuras) mundo.Remove(e.GetHitbox());
  estructuras.clear();
  //mundo.Remove(base);
  //mundo.Add(base);
  base.setFill(120,20,10);
  for (int i=0; i<posiciones_estructuras.length; i++) {
    int x = posiciones_estructuras[i][0];
    int y = posiciones_estructuras[i][1];
    int w = posiciones_estructuras[i][2];
    int h = posiciones_estructuras[i][3];

    Estructura actual = new Estructura(x, y, w, h, 1, 0.06);
    estructuras.add(actual);
    mundo.Add(actual.GetHitbox());
  }
}
