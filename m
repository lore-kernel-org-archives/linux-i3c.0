Return-Path: <SRS0=s+0C=SS=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 853F8C282DF
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 04:42:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 522FD2086A
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 04:42:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Aw5tHbje";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="BFdEIneC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="kVcNR9eO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 522FD2086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GVnihwogKp1zrVTDLzmSntrTgcesRyDNO0pnwl81caE=; b=Aw5tHbjeSXuPQC
	XT4vT+4gBiuTk4DCEbj0E0haXXYfK08q9F7ykUiHqIubxXtcrmoguWYlDz7pYTw0Wvu4/JJTYc1Sv
	h+7dUwrJhiPezgLzNBlAekbMQa7Af6Z7AgH1hPNnc1/iFE/S5vYl4E3dIBRtrEnxHV5tCbIal9Fc+
	rp2AeEIWUUEe6Bsn31KdGKXsB6eWXFdgpBiHs5yPz7Ua3X2wl6okbBCWfgdGT8xmB8KxewI6GRqmi
	jx0mHZgjdcTWxMzHFpfTkMaPZqrLCN4AG88UNXqmlk9v8pXe0czA9DjuM9+Gh1efr06gbX7sKIUmw
	5G2E9CWXRVHAndey03QQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGFvG-00087q-VE; Tue, 16 Apr 2019 04:42:18 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGFvB-00085q-Jq
 for linux-i3c@lists.infradead.org; Tue, 16 Apr 2019 04:42:16 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3G4cwld011437; Mon, 15 Apr 2019 21:42:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=LvmwZ78fuPgFviYNDjSP10UOLhsyQMU/NIgTtSBjzvU=;
 b=BFdEIneCPk79H/IJ1xeoxehSslp79lmww4jQjoi3xKb4YoizHBe1Tk/wzZ1swrvEdBbl
 C1SWpMGsnv7FWxLAmUqzq2TR9r5c5xN1dtyPIMGcb5SgFBu8/8JNYQCd3m83/AKzXsop
 8d/lrluzH/vMcLRq1DWNAmD6rNHIWhVXVWHttuCWP5imavPE7OzUMblPM++/eRFeUYjt
 pxV5jpnoR9PMGSi2kbIZreGWTWuP+uAQ1z+DgLy+pJ6kkE++Y0SlmNyiv1fzUU6KJ3Z8
 wijfWkfzsVlsPPsZVPXzSx9DDmor/IDdKpBfFS2xvuAnYndghUn2Xm4kjPT/u9Os5vY9 zQ== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam04-co1-obe.outbound.protection.outlook.com
 (mail-co1nam04lp2058.outbound.protection.outlook.com [104.47.45.58])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2rw7d9g6gd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 15 Apr 2019 21:42:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvmwZ78fuPgFviYNDjSP10UOLhsyQMU/NIgTtSBjzvU=;
 b=kVcNR9eO0K9YYTYQ8Afkan6zSDbZfJY7hmw8iXYDPA8SH0k9M+VwT4A6+jtpOpoTOqnQXLdOGfzjOkDs+zYyQIvZW8i2ynRP2Atsmv+951WG2Cm+5yG3dxfp1+pVAl35HRv+9L0yoFzozdfYXkD9qg7bnf4cwFE5R73QXo9N1LQ=
Received: from DM6PR07CA0024.namprd07.prod.outlook.com (2603:10b6:5:94::37) by
 DM6PR07MB6811.namprd07.prod.outlook.com (2603:10b6:5:158::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.19; Tue, 16 Apr 2019 04:42:04 +0000
Received: from CO1NAM05FT016.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::206) by DM6PR07CA0024.outlook.office365.com
 (2603:10b6:5:94::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1771.16 via Frontend
 Transport; Tue, 16 Apr 2019 04:42:04 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 CO1NAM05FT016.mail.protection.outlook.com (10.152.96.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.7 via Frontend Transport; Tue, 16 Apr 2019 04:42:04 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 x3G4g2Fv020168
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Mon, 15 Apr 2019 21:42:04 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 16 Apr 2019 06:42:02 +0200
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 16 Apr 2019 06:42:02 +0200
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x3G4g14r003673;
 Tue, 16 Apr 2019 05:42:01 +0100
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x3G4g1Vh003672;
 Tue, 16 Apr 2019 05:42:01 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v4 3/4] i3c: Drop support for I2C 10 bit addresing
Date: Tue, 16 Apr 2019 05:41:45 +0100
Message-ID: <20190416044146.2382-4-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20190416044146.2382-1-pgaj@cadence.com>
References: <20190416044146.2382-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(396003)(376002)(39850400004)(346002)(136003)(2980300002)(189003)(199004)(36092001)(336012)(2616005)(476003)(126002)(486006)(106466001)(2351001)(105596002)(76130400001)(5024004)(14444005)(50226002)(51416003)(186003)(76176011)(8676002)(26005)(426003)(5660300002)(11346002)(446003)(8936002)(4326008)(246002)(50466002)(2906002)(48376002)(305945005)(36756003)(26826003)(107886003)(1076003)(7636002)(6666004)(356004)(47776003)(6916009)(54906003)(16586007)(478600001)(316002)(87636003)(42186006)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR07MB6811; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d050613b-7df4-43fa-b5ff-08d6c225e03b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600140)(711020)(4605104)(2017052603328);
 SRVR:DM6PR07MB6811; 
X-MS-TrafficTypeDiagnostic: DM6PR07MB6811:
X-Microsoft-Antispam-PRVS: <DM6PR07MB68110DFA44D4E40B91FA8350C2240@DM6PR07MB6811.namprd07.prod.outlook.com>
X-Forefront-PRVS: 000947967F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: KwqSkaf1g22wmxzbGqQniujyNIgyyPHl3EKjKcHI+q06MCxPJE4ofCy7ewN/ucrqzc5IOPUxsfKSCEe4s5cTRuwqruszfDVsP5+MEl9ocaYTxsNBs4u+SDuTPoVSn3HOQ+S+2T0GS1J3bjiDXubi3CcB8LiTEVo/kKCY7jp7UE31KcEW3NVXOpiCw6fWClNaOop5RXBSXwjw2FElCwyqNxWfaCZrg/Wjj1Y90WxBAq4gmXPW4QJvXfTA0LBGwZTCBxoyduW/x+l2pmCU0IQ/PwFJE6cileleLT42bFt/NLQ8i0IDCMPR4byFEEadIG0hwyo7+4mbbnoIRsdV8V4ujpeygQR22kKfrRdv9riIaXW2PeNt07n/Hrcbr9ncqvh7PcE6CsZu+vZNfnFbIy5uoahD+alts61gzyMeAzObN50=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2019 04:42:04.9660 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d050613b-7df4-43fa-b5ff-08d6c225e03b
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB6811
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp
 include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-16_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904160033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_214213_816927_298347EC 
X-CRM114-Status: GOOD (  16.50  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, agolec@cadence.com,
 Przemyslaw Gaj <pgaj@cadence.com>, rafalc@cadence.com,
 vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

This patch dropps support for I2C devices with 10 bit addressing. When I2C
device with 10 bit address is defined in DT, I3C master registration fails.

Address space for I2C devices has been reduced and ->i2c_funcs() hook has been
removed.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>

---

Main changes between v3 and v4 are:
- Add i3c_master_i2c_funcs() which reflects current I2C devices functionality.

Main changes between v2 and v3 are:
- Remove i2c_funcs() hook.
- Reduce address space for I2C devices.

Main changes between v1 and v2 are:
- Add error message when registering I2C device with 10 bit address.
---
 drivers/i3c/master.c       | 21 ++++++++++++++-------
 include/linux/i3c/master.h |  5 +----
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 2dc628d..8800514 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1962,6 +1962,16 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
 	if (ret)
 		return ret;
 
+	/*
+	 * The I3C Specification does not clearly say I2C devices with 10-bit
+	 * address are supported. These devices can't be passed properly through
+	 * DEFSLVS command.
+	 */
+	if (boardinfo->base.flags & I2C_CLIENT_TEN) {
+		dev_err(&master->dev, "I2C device with 10 bit address not supported.");
+		return -ENOTSUPP;
+	}
+
 	/* LVR is encoded in reg[2]. */
 	boardinfo->lvr = reg[2];
 
@@ -2111,16 +2121,14 @@ static int i3c_master_i2c_adapter_xfer(struct i2c_adapter *adap,
 	return ret ? ret : nxfers;
 }
 
-static u32 i3c_master_i2c_functionalities(struct i2c_adapter *adap)
+static u32 i3c_master_i2c_funcs(struct i2c_adapter *adapter)
 {
-	struct i3c_master_controller *master = i2c_adapter_to_i3c_master(adap);
-
-	return master->ops->i2c_funcs(master);
+	return I2C_FUNC_SMBUS_EMUL | I2C_FUNC_I2C;
 }
 
 static const struct i2c_algorithm i3c_master_i2c_algo = {
 	.master_xfer = i3c_master_i2c_adapter_xfer,
-	.functionality = i3c_master_i2c_functionalities,
+	.functionality = i3c_master_i2c_funcs,
 };
 
 static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
@@ -2379,8 +2387,7 @@ EXPORT_SYMBOL_GPL(i3c_generic_ibi_recycle_slot);
 static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
 {
 	if (!ops || !ops->bus_init || !ops->priv_xfers ||
-	    !ops->send_ccc_cmd || !ops->do_daa || !ops->i2c_xfers ||
-	    !ops->i2c_funcs)
+	    !ops->send_ccc_cmd || !ops->do_daa || !ops->i2c_xfers)
 		return -EINVAL;
 
 	if (ops->request_ibi &&
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index f13fd8b..eca8337 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -48,7 +48,7 @@ struct i3c_i2c_dev_desc {
 #define I3C_LVR_I2C_INDEX(x)		((x) << 5)
 #define I3C_LVR_I2C_FM_MODE		BIT(4)
 
-#define I2C_MAX_ADDR			GENMASK(9, 0)
+#define I2C_MAX_ADDR			GENMASK(6, 0)
 
 /**
  * struct i2c_dev_boardinfo - I2C device board information
@@ -390,8 +390,6 @@ struct i3c_bus {
  *	       and i2c_put_dma_safe_msg_buf() helpers provided by the I2C
  *	       framework.
  *	       This method is mandatory.
- * @i2c_funcs: expose the supported I2C functionalities.
- *	       This method is mandatory.
  * @request_ibi: attach an IBI handler to an I3C device. This implies defining
  *		 an IBI handler and the constraints of the IBI (maximum payload
  *		 length and number of pre-allocated slots).
@@ -437,7 +435,6 @@ struct i3c_master_controller_ops {
 	void (*detach_i2c_dev)(struct i2c_dev_desc *dev);
 	int (*i2c_xfers)(struct i2c_dev_desc *dev,
 			 const struct i2c_msg *xfers, int nxfers);
-	u32 (*i2c_funcs)(struct i3c_master_controller *master);
 	int (*request_ibi)(struct i3c_dev_desc *dev,
 			   const struct i3c_ibi_setup *req);
 	void (*free_ibi)(struct i3c_dev_desc *dev);
-- 
2.8.3


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
