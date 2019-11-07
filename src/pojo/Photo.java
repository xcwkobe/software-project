package pojo;

public class Photo {
    private Integer id;

    private String fheadphoto;

    private String mheadphoto;

    private String kheadphoto;

    private Integer uid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFheadphoto() {
        return fheadphoto;
    }

    public void setFheadphoto(String fheadphoto) {
        this.fheadphoto = fheadphoto == null ? null : fheadphoto.trim();
    }

    public String getMheadphoto() {
        return mheadphoto;
    }

    public void setMheadphoto(String mheadphoto) {
        this.mheadphoto = mheadphoto == null ? null : mheadphoto.trim();
    }

    public String getKheadphoto() {
        return kheadphoto;
    }

    public void setKheadphoto(String kheadphoto) {
        this.kheadphoto = kheadphoto == null ? null : kheadphoto.trim();
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }
}