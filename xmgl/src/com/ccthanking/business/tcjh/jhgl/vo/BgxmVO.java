package com.ccthanking.business.tcjh.jhgl.vo;
import com.ccthanking.framework.base.BaseVO;
import java.util.Date;

public class BgxmVO extends BaseVO{

	public BgxmVO(){
		this.addField("GC_JH_BGXM_ID",OP_STRING|this.TP_PK);
		this.addField("BGID",OP_STRING);
		this.addField("JHID",OP_STRING);
		this.addField("XMID",OP_STRING);
		this.addField("BDID",OP_STRING);
		this.addField("XMBH",OP_STRING);
		this.addField("BDBH",OP_STRING);
		this.addField("XMMC",OP_STRING);
		this.addField("BDMC",OP_STRING);
		this.addField("XMXZ",OP_STRING);
		this.addField("PXH",OP_STRING);
		this.addField("KGSJ",OP_DATE);
		this.addField("KGSJ_SJ",OP_DATE);
		this.addField("KGSJ_BZ",OP_STRING);
		this.addField("WGSJ",OP_DATE);
		this.addField("WGSJ_SJ",OP_DATE);
		this.addField("WGSJ_BZ",OP_STRING);
		this.addField("KYPF",OP_DATE);
		this.addField("KYPF_SJ",OP_DATE);
		this.addField("KYPF_BZ",OP_STRING);
		this.addField("HPJDS",OP_DATE);
		this.addField("HPJDS_SJ",OP_DATE);
		this.addField("HPJDS_BZ",OP_STRING);
		this.addField("GCXKZ",OP_DATE);
		this.addField("GCXKZ_SJ",OP_DATE);
		this.addField("GCXKZ_BZ",OP_STRING);
		this.addField("SGXK",OP_DATE);
		this.addField("SGXK_SJ",OP_DATE);
		this.addField("SGXK_BZ",OP_STRING);
		this.addField("CBSJPF",OP_DATE);
		this.addField("CBSJPF_SJ",OP_DATE);
		this.addField("CBSJPF_BZ",OP_STRING);
		this.addField("CQT",OP_DATE);
		this.addField("CQT_SJ",OP_DATE);
		this.addField("CQT_BZ",OP_STRING);
		this.addField("PQT",OP_DATE);
		this.addField("PQT_SJ",OP_DATE);
		this.addField("PQT_BZ",OP_STRING);
		this.addField("SGT",OP_DATE);
		this.addField("SGT_SJ",OP_DATE);
		this.addField("SGT_BZ",OP_STRING);
		this.addField("TBJ",OP_DATE);
		this.addField("TBJ_SJ",OP_DATE);
		this.addField("TBJ_BZ",OP_STRING);
		this.addField("CS",OP_DATE);
		this.addField("CS_SJ",OP_DATE);
		this.addField("CS_BZ",OP_STRING);
		this.addField("JLDW",OP_DATE);
		this.addField("JLDW_SJ",OP_DATE);
		this.addField("JLDW_BZ",OP_STRING);
		this.addField("SGDW",OP_DATE);
		this.addField("SGDW_SJ",OP_DATE);
		this.addField("SGDW_BZ",OP_STRING);
		this.addField("ZC",OP_DATE);
		this.addField("ZC_SJ",OP_DATE);
		this.addField("ZC_BZ",OP_STRING);
		this.addField("PQ",OP_DATE);
		this.addField("PQ_SJ",OP_DATE);
		this.addField("PQ_BZ",OP_STRING);
		this.addField("JG",OP_DATE);
		this.addField("JG_SJ",OP_DATE);
		this.addField("JG_BZ",OP_STRING);
		this.addField("XMSX",OP_STRING);
		this.addField("YWLX",OP_STRING);
		this.addField("SJBH",OP_STRING);
		this.addField("BZ",OP_STRING);
		this.addField("LRR",OP_STRING);
		this.addField("LRSJ",OP_DATE);
		this.addField("LRBM",OP_STRING);
		this.addField("LRBMMC",OP_STRING);
		this.addField("GXR",OP_STRING);
		this.addField("GXSJ",OP_DATE);
		this.addField("GXBM",OP_STRING);
		this.addField("GXBMMC",OP_STRING);
		this.addField("SJMJ",OP_STRING);
		this.addField("SFYX",OP_STRING);
		this.addField("SFXG",OP_STRING);
		this.addField("XMBS",OP_STRING);
		
		//字典
		this.bindFieldToDic("SFXG", "SF");//是否修改
		
		this.setFieldDateFormat("KGSJ","yyyy-MM-dd");
		this.setFieldDateFormat("KGSJ_SJ","yyyy-MM-dd");
		this.setFieldDateFormat("WGSJ","yyyy-MM-dd");
		this.setFieldDateFormat("WGSJ_SJ","yyyy-MM-dd");
		this.setFieldDateFormat("KYPF","yyyy-MM-dd");
		this.setFieldDateFormat("KYPF_SJ","yyyy-MM-dd");
		this.setFieldDateFormat("HPJDS","yyyy-MM-dd");
		this.setFieldDateFormat("HPJDS_SJ","yyyy-MM-dd");
		this.setFieldDateFormat("GCXKZ","yyyy-MM-dd");
		this.setFieldDateFormat("GCXKZ_SJ","yyyy-MM-dd");
		this.setFieldDateFormat("SGXK","yyyy-MM-dd");
		this.setFieldDateFormat("SGXK_SJ","yyyy-MM-dd");
		this.setFieldDateFormat("CBSJPF","yyyy-MM-dd");
		this.setFieldDateFormat("CBSJPF_SJ","yyyy-MM-dd");
		this.setFieldDateFormat("CQT","yyyy-MM-dd");
		this.setFieldDateFormat("CQT_SJ","yyyy-MM-dd");
		this.setFieldDateFormat("PQT","yyyy-MM-dd");
		this.setFieldDateFormat("PQT_SJ","yyyy-MM-dd");
		this.setFieldDateFormat("SGT","yyyy-MM-dd");
		this.setFieldDateFormat("SGT_SJ","yyyy-MM-dd");
		this.setFieldDateFormat("TBJ","yyyy-MM-dd");
		this.setFieldDateFormat("TBJ_SJ","yyyy-MM-dd");
		this.setFieldDateFormat("CS","yyyy-MM-dd");
		this.setFieldDateFormat("CS_SJ","yyyy-MM-dd");
		this.setFieldDateFormat("JLDW","yyyy-MM-dd");
		this.setFieldDateFormat("JLDW_SJ","yyyy-MM-dd");
		this.setFieldDateFormat("SGDW","yyyy-MM-dd");
		this.setFieldDateFormat("SGDW_SJ","yyyy-MM-dd");
		this.setFieldDateFormat("ZC","yyyy-MM-dd");
		this.setFieldDateFormat("ZC_SJ","yyyy-MM-dd");
		this.setFieldDateFormat("PQ","yyyy-MM-dd");
		this.setFieldDateFormat("PQ_SJ","yyyy-MM-dd");
		this.setFieldDateFormat("JG","yyyy-MM-dd");
		this.setFieldDateFormat("JG_SJ","yyyy-MM-dd");
		this.setFieldDateFormat("LRSJ","yyyy-MM-dd");
		this.setFieldDateFormat("GXSJ","yyyy-MM-dd");
		this.setVOTableName("GC_JH_BGXM");
	}

	public void setGc_jh_bgxm_id(String gc_jh_bgxm_id){
		this.setInternal("GC_JH_BGXM_ID",gc_jh_bgxm_id);
	}
	public String getGc_jh_bgxm_id(){
		return (String)this.getInternal("GC_JH_BGXM_ID");
	}
	public void setBgid(String bgid){
		this.setInternal("BGID",bgid);
	}
	public String getBgid(){
		return (String)this.getInternal("BGID");
	}
	public void setJhid(String jhid){
		this.setInternal("JHID",jhid);
	}
	public String getJhid(){
		return (String)this.getInternal("JHID");
	}
	public void setXmid(String xmid){
		this.setInternal("XMID",xmid);
	}
	public String getXmid(){
		return (String)this.getInternal("XMID");
	}
	public void setBdid(String bdid){
		this.setInternal("BDID",bdid);
	}
	public String getBdid(){
		return (String)this.getInternal("BDID");
	}
	public void setXmbh(String xmbh){
		this.setInternal("XMBH",xmbh);
	}
	public String getXmbh(){
		return (String)this.getInternal("XMBH");
	}
	public void setBdbh(String bdbh){
		this.setInternal("BDBH",bdbh);
	}
	public String getBdbh(){
		return (String)this.getInternal("BDBH");
	}
	public void setXmmc(String xmmc){
		this.setInternal("XMMC",xmmc);
	}
	public String getXmmc(){
		return (String)this.getInternal("XMMC");
	}
	public void setBdmc(String bdmc){
		this.setInternal("BDMC",bdmc);
	}
	public String getBdmc(){
		return (String)this.getInternal("BDMC");
	}
	public void setXmxz(String xmxz){
		this.setInternal("XMXZ",xmxz);
	}
	public String getXmxz(){
		return (String)this.getInternal("XMXZ");
	}
	public void setPxh(String pxh){
		this.setInternal("PXH",pxh);
	}
	public String getPxh(){
		return (String)this.getInternal("PXH");
	}
	public void setKgsj(Date kgsj){
		this.setInternal("KGSJ",kgsj);
	}
	public Date getKgsj(){
		return (Date)this.getInternal("KGSJ");
	}
	public void setKgsj_sj(Date kgsj_sj){
		this.setInternal("KGSJ_SJ",kgsj_sj);
	}
	public Date getKgsj_sj(){
		return (Date)this.getInternal("KGSJ_SJ");
	}
	public void setKgsj_bz(String kgsj_bz){
		this.setInternal("KGSJ_BZ",kgsj_bz);
	}
	public String getKgsj_bz(){
		return (String)this.getInternal("KGSJ_BZ");
	}
	public void setWgsj(Date wgsj){
		this.setInternal("WGSJ",wgsj);
	}
	public Date getWgsj(){
		return (Date)this.getInternal("WGSJ");
	}
	public void setWgsj_sj(Date wgsj_sj){
		this.setInternal("WGSJ_SJ",wgsj_sj);
	}
	public Date getWgsj_sj(){
		return (Date)this.getInternal("WGSJ_SJ");
	}
	public void setWgsj_bz(String wgsj_bz){
		this.setInternal("WGSJ_BZ",wgsj_bz);
	}
	public String getWgsj_bz(){
		return (String)this.getInternal("WGSJ_BZ");
	}
	public void setKypf(Date kypf){
		this.setInternal("KYPF",kypf);
	}
	public Date getKypf(){
		return (Date)this.getInternal("KYPF");
	}
	public void setKypf_sj(Date kypf_sj){
		this.setInternal("KYPF_SJ",kypf_sj);
	}
	public Date getKypf_sj(){
		return (Date)this.getInternal("KYPF_SJ");
	}
	public void setKypf_bz(String kypf_bz){
		this.setInternal("KYPF_BZ",kypf_bz);
	}
	public String getKypf_bz(){
		return (String)this.getInternal("KYPF_BZ");
	}
	public void setHpjds(Date hpjds){
		this.setInternal("HPJDS",hpjds);
	}
	public Date getHpjds(){
		return (Date)this.getInternal("HPJDS");
	}
	public void setHpjds_sj(Date hpjds_sj){
		this.setInternal("HPJDS_SJ",hpjds_sj);
	}
	public Date getHpjds_sj(){
		return (Date)this.getInternal("HPJDS_SJ");
	}
	public void setHpjds_bz(String hpjds_bz){
		this.setInternal("HPJDS_BZ",hpjds_bz);
	}
	public String getHpjds_bz(){
		return (String)this.getInternal("HPJDS_BZ");
	}
	public void setGcxkz(Date gcxkz){
		this.setInternal("GCXKZ",gcxkz);
	}
	public Date getGcxkz(){
		return (Date)this.getInternal("GCXKZ");
	}
	public void setGcxkz_sj(Date gcxkz_sj){
		this.setInternal("GCXKZ_SJ",gcxkz_sj);
	}
	public Date getGcxkz_sj(){
		return (Date)this.getInternal("GCXKZ_SJ");
	}
	public void setGcxkz_bz(String gcxkz_bz){
		this.setInternal("GCXKZ_BZ",gcxkz_bz);
	}
	public String getGcxkz_bz(){
		return (String)this.getInternal("GCXKZ_BZ");
	}
	public void setSgxk(Date sgxk){
		this.setInternal("SGXK",sgxk);
	}
	public Date getSgxk(){
		return (Date)this.getInternal("SGXK");
	}
	public void setSgxk_sj(Date sgxk_sj){
		this.setInternal("SGXK_SJ",sgxk_sj);
	}
	public Date getSgxk_sj(){
		return (Date)this.getInternal("SGXK_SJ");
	}
	public void setSgxk_bz(String sgxk_bz){
		this.setInternal("SGXK_BZ",sgxk_bz);
	}
	public String getSgxk_bz(){
		return (String)this.getInternal("SGXK_BZ");
	}
	public void setCbsjpf(Date cbsjpf){
		this.setInternal("CBSJPF",cbsjpf);
	}
	public Date getCbsjpf(){
		return (Date)this.getInternal("CBSJPF");
	}
	public void setCbsjpf_sj(Date cbsjpf_sj){
		this.setInternal("CBSJPF_SJ",cbsjpf_sj);
	}
	public Date getCbsjpf_sj(){
		return (Date)this.getInternal("CBSJPF_SJ");
	}
	public void setCbsjpf_bz(String cbsjpf_bz){
		this.setInternal("CBSJPF_BZ",cbsjpf_bz);
	}
	public String getCbsjpf_bz(){
		return (String)this.getInternal("CBSJPF_BZ");
	}
	public void setCqt(Date cqt){
		this.setInternal("CQT",cqt);
	}
	public Date getCqt(){
		return (Date)this.getInternal("CQT");
	}
	public void setCqt_sj(Date cqt_sj){
		this.setInternal("CQT_SJ",cqt_sj);
	}
	public Date getCqt_sj(){
		return (Date)this.getInternal("CQT_SJ");
	}
	public void setCqt_bz(String cqt_bz){
		this.setInternal("CQT_BZ",cqt_bz);
	}
	public String getCqt_bz(){
		return (String)this.getInternal("CQT_BZ");
	}
	public void setPqt(Date pqt){
		this.setInternal("PQT",pqt);
	}
	public Date getPqt(){
		return (Date)this.getInternal("PQT");
	}
	public void setPqt_sj(Date pqt_sj){
		this.setInternal("PQT_SJ",pqt_sj);
	}
	public Date getPqt_sj(){
		return (Date)this.getInternal("PQT_SJ");
	}
	public void setPqt_bz(String pqt_bz){
		this.setInternal("PQT_BZ",pqt_bz);
	}
	public String getPqt_bz(){
		return (String)this.getInternal("PQT_BZ");
	}
	public void setSgt(Date sgt){
		this.setInternal("SGT",sgt);
	}
	public Date getSgt(){
		return (Date)this.getInternal("SGT");
	}
	public void setSgt_sj(Date sgt_sj){
		this.setInternal("SGT_SJ",sgt_sj);
	}
	public Date getSgt_sj(){
		return (Date)this.getInternal("SGT_SJ");
	}
	public void setSgt_bz(String sgt_bz){
		this.setInternal("SGT_BZ",sgt_bz);
	}
	public String getSgt_bz(){
		return (String)this.getInternal("SGT_BZ");
	}
	public void setTbj(Date tbj){
		this.setInternal("TBJ",tbj);
	}
	public Date getTbj(){
		return (Date)this.getInternal("TBJ");
	}
	public void setTbj_sj(Date tbj_sj){
		this.setInternal("TBJ_SJ",tbj_sj);
	}
	public Date getTbj_sj(){
		return (Date)this.getInternal("TBJ_SJ");
	}
	public void setTbj_bz(String tbj_bz){
		this.setInternal("TBJ_BZ",tbj_bz);
	}
	public String getTbj_bz(){
		return (String)this.getInternal("TBJ_BZ");
	}
	public void setCs(Date cs){
		this.setInternal("CS",cs);
	}
	public Date getCs(){
		return (Date)this.getInternal("CS");
	}
	public void setCs_sj(Date cs_sj){
		this.setInternal("CS_SJ",cs_sj);
	}
	public Date getCs_sj(){
		return (Date)this.getInternal("CS_SJ");
	}
	public void setCs_bz(String cs_bz){
		this.setInternal("CS_BZ",cs_bz);
	}
	public String getCs_bz(){
		return (String)this.getInternal("CS_BZ");
	}
	public void setJldw(Date jldw){
		this.setInternal("JLDW",jldw);
	}
	public Date getJldw(){
		return (Date)this.getInternal("JLDW");
	}
	public void setJldw_sj(Date jldw_sj){
		this.setInternal("JLDW_SJ",jldw_sj);
	}
	public Date getJldw_sj(){
		return (Date)this.getInternal("JLDW_SJ");
	}
	public void setJldw_bz(String jldw_bz){
		this.setInternal("JLDW_BZ",jldw_bz);
	}
	public String getJldw_bz(){
		return (String)this.getInternal("JLDW_BZ");
	}
	public void setSgdw(Date sgdw){
		this.setInternal("SGDW",sgdw);
	}
	public Date getSgdw(){
		return (Date)this.getInternal("SGDW");
	}
	public void setSgdw_sj(Date sgdw_sj){
		this.setInternal("SGDW_SJ",sgdw_sj);
	}
	public Date getSgdw_sj(){
		return (Date)this.getInternal("SGDW_SJ");
	}
	public void setSgdw_bz(String sgdw_bz){
		this.setInternal("SGDW_BZ",sgdw_bz);
	}
	public String getSgdw_bz(){
		return (String)this.getInternal("SGDW_BZ");
	}
	public void setZc(Date zc){
		this.setInternal("ZC",zc);
	}
	public Date getZc(){
		return (Date)this.getInternal("ZC");
	}
	public void setZc_sj(Date zc_sj){
		this.setInternal("ZC_SJ",zc_sj);
	}
	public Date getZc_sj(){
		return (Date)this.getInternal("ZC_SJ");
	}
	public void setZc_bz(String zc_bz){
		this.setInternal("ZC_BZ",zc_bz);
	}
	public String getZc_bz(){
		return (String)this.getInternal("ZC_BZ");
	}
	public void setPq(Date pq){
		this.setInternal("PQ",pq);
	}
	public Date getPq(){
		return (Date)this.getInternal("PQ");
	}
	public void setPq_sj(Date pq_sj){
		this.setInternal("PQ_SJ",pq_sj);
	}
	public Date getPq_sj(){
		return (Date)this.getInternal("PQ_SJ");
	}
	public void setPq_bz(String pq_bz){
		this.setInternal("PQ_BZ",pq_bz);
	}
	public String getPq_bz(){
		return (String)this.getInternal("PQ_BZ");
	}
	public void setJg(Date jg){
		this.setInternal("JG",jg);
	}
	public Date getJg(){
		return (Date)this.getInternal("JG");
	}
	public void setJg_sj(Date jg_sj){
		this.setInternal("JG_SJ",jg_sj);
	}
	public Date getJg_sj(){
		return (Date)this.getInternal("JG_SJ");
	}
	public void setJg_bz(String jg_bz){
		this.setInternal("JG_BZ",jg_bz);
	}
	public String getJg_bz(){
		return (String)this.getInternal("JG_BZ");
	}
	public void setXmsx(String xmsx){
		this.setInternal("XMSX",xmsx);
	}
	public String getXmsx(){
		return (String)this.getInternal("XMSX");
	}
	public void setYwlx(String ywlx){
		this.setInternal("YWLX",ywlx);
	}
	public String getYwlx(){
		return (String)this.getInternal("YWLX");
	}
	public void setSjbh(String sjbh){
		this.setInternal("SJBH",sjbh);
	}
	public String getSjbh(){
		return (String)this.getInternal("SJBH");
	}
	public void setBz(String bz){
		this.setInternal("BZ",bz);
	}
	public String getBz(){
		return (String)this.getInternal("BZ");
	}
	public void setLrr(String lrr){
		this.setInternal("LRR",lrr);
	}
	public String getLrr(){
		return (String)this.getInternal("LRR");
	}
	public void setLrsj(Date lrsj){
		this.setInternal("LRSJ",lrsj);
	}
	public Date getLrsj(){
		return (Date)this.getInternal("LRSJ");
	}
	public void setLrbm(String lrbm){
		this.setInternal("LRBM",lrbm);
	}
	public String getLrbm(){
		return (String)this.getInternal("LRBM");
	}
	public void setLrbmmc(String lrbmmc){
		this.setInternal("LRBMMC",lrbmmc);
	}
	public String getLrbmmc(){
		return (String)this.getInternal("LRBMMC");
	}
	public void setGxr(String gxr){
		this.setInternal("GXR",gxr);
	}
	public String getGxr(){
		return (String)this.getInternal("GXR");
	}
	public void setGxsj(Date gxsj){
		this.setInternal("GXSJ",gxsj);
	}
	public Date getGxsj(){
		return (Date)this.getInternal("GXSJ");
	}
	public void setGxbm(String gxbm){
		this.setInternal("GXBM",gxbm);
	}
	public String getGxbm(){
		return (String)this.getInternal("GXBM");
	}
	public void setGxbmmc(String gxbmmc){
		this.setInternal("GXBMMC",gxbmmc);
	}
	public String getGxbmmc(){
		return (String)this.getInternal("GXBMMC");
	}
	public void setSjmj(String sjmj){
		this.setInternal("SJMJ",sjmj);
	}
	public String getSjmj(){
		return (String)this.getInternal("SJMJ");
	}
	public void setSfyx(String sfyx){
		this.setInternal("SFYX",sfyx);
	}
	public String getSfyx(){
		return (String)this.getInternal("SFYX");
	}
	public void setSfxg(String sfxg){
		this.setInternal("SFXG",sfxg);
	}
	public String getSfxg(){
		return (String)this.getInternal("SFXG");
	}
	public void setXmbs(String xmbs){
		this.setInternal("XMBS",xmbs);
	}
	public String getXmbs(){
		return (String)this.getInternal("XMBS");
	}
}