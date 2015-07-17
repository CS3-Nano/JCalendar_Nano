package beans;

public class Map {
	private int mapId;
	private int	evntID;
	private int	zoom;
	private double lat;
	private double lng;
	
	public Map() {
		super();
	}

	public Map(int mapId, int evntID, int zoom, double lat, double lng) {
		super();
		this.mapId = mapId;
		this.evntID = evntID;
		this.zoom = zoom;
		this.lat = lat;
		this.lng = lng;
	}

	public int getMapId() {
		return mapId;
	}

	public void setMapId(int mapId) {
		this.mapId = mapId;
	}

	public int getEvntID() {
		return evntID;
	}

	public void setEvntID(int evntID) {
		this.evntID = evntID;
	}

	public int getZoom() {
		return zoom;
	}

	public void setZoom(int zoom) {
		this.zoom = zoom;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}
	
	
}

//mapId int not null primary key auto_increment,
//evntID int ,
//zoom int,
//lat DOUBLE,
//lng DOUBLE