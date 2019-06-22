Return-Path: <SRS0=3/jM=UV=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D52C43613
	for <linux-i3c@archiver.kernel.org>; Sat, 22 Jun 2019 20:56:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45D2D20657
	for <linux-i3c@archiver.kernel.org>; Sat, 22 Jun 2019 20:56:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QcBIXPYv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="p4cxlz0x";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="IS2FYZsq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45D2D20657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fjJBtaY1DkXOOUy52sKhd3wlvLaVPy5xJXu5gpiFgqs=; b=QcBIXPYv3bmPI3
	8t72VYVi/Usbm/LFEYYBT12q4POe8fv8E/m28BdtGPBAoCtTadT53vVo87a7YpJu4wGv7US3RwqB7
	7QfZAMiGQ8P2oVz0zXxEBkQ8/aiF1/aKzk/gEBoLjJ0HdJvriB7hV34hmTvKy6L8nRvLE8ll40wso
	u+zseCwFvUD8Qv6Ua95SssfjwVLkE5K0SGIcz21HC7JbyV2aw3KdQLLjGXE4BB1pzLSgMrNuQyypN
	5sYzsnnKNuu1Ph8Dc4yj8ojmOnvL/nqAruZ4qBf5COXRKrAURzKQpI3GmFiCnpwB4T4ys1k+FlIt5
	IOfb3GwaFKw/y8cppktw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hen3a-0007C7-0z; Sat, 22 Jun 2019 20:56:18 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hen3W-0007BS-9a
 for linux-i3c@lists.infradead.org; Sat, 22 Jun 2019 20:56:17 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5MKsHQ2031381; Sat, 22 Jun 2019 13:56:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=JsUIDRWxFC/sN2WLyL7+0VEL9q4WEsOLRPcq8nCL1Hc=;
 b=p4cxlz0x/KSLnkysVc+czwbfqZQgnRtwEetCzCRBqv8Mu8cdchbxcmDRN6uOKZNkBDm0
 xgfFImchEMIDsnRhI8HRqT7vTcW33aebtMhZYYAcEQsx78o4y5k5D/Vp3lbuyAWFjXfu
 Hf7J/Ik5RlMOH2R2CzKemzGbYF4N3K2JT0IWktfbv9vS9qE5wHpR7Il0hiUjH3/hux+N
 Yokyd0S7It+YyofrsI+XVsb7Kx0hG8U6n2RXlp2m8KL6Cup28dEcF394WXu4SXcAgJiR
 5edUzpjykiJClau+7HRIcXQc4DCh5m27CVfuIhZT2Py/nkmSWfRgpaI6d8lV8rjkqPGm ig== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam01-by2-obe.outbound.protection.outlook.com
 (mail-by2nam01lp2058.outbound.protection.outlook.com [104.47.34.58])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2t9gvs1cev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Sat, 22 Jun 2019 13:56:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JsUIDRWxFC/sN2WLyL7+0VEL9q4WEsOLRPcq8nCL1Hc=;
 b=IS2FYZsqJCLKWDqmVweELv2YABMQOpyQ8ZgMRwvNkw+AMlPl2xdvlTy+3UMazv9abrB/ul/d7dgOWRrrVB6PjlawFw1UlEVrDZi3MgXfwcvIyOSrF1taOdnMARA3nGkgOsmgFq2TVzXgPaGUz8AkX4rSzaygNMD0cQX27Fa8PSo=
Received: from CH2PR07CA0016.namprd07.prod.outlook.com (2603:10b6:610:20::29)
 by MN2PR07MB6832.namprd07.prod.outlook.com (2603:10b6:208:11e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2008.16; Sat, 22 Jun
 2019 20:56:08 +0000
Received: from BY2NAM05FT031.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::208) by CH2PR07CA0016.outlook.office365.com
 (2603:10b6:610:20::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2008.16 via Frontend
 Transport; Sat, 22 Jun 2019 20:56:07 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 BY2NAM05FT031.mail.protection.outlook.com (10.152.100.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2032.6 via Frontend Transport; Sat, 22 Jun 2019 20:56:06 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 x5MKu4t6007091
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Sat, 22 Jun 2019 13:56:06 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Sat, 22 Jun 2019 22:56:04 +0200
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Sat, 22 Jun 2019 22:56:04 +0200
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x5MKu3hF010122;
 Sat, 22 Jun 2019 21:56:03 +0100
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x5MKu3iS010121;
 Sat, 22 Jun 2019 21:56:03 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v5 5/7] i3c: master: cdns: add support for mastership request
 to Cadence I3C master driver.
Date: Sat, 22 Jun 2019 21:55:03 +0100
Message-ID: <1561236905-8901-6-git-send-email-pgaj@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1561236905-8901-1-git-send-email-pgaj@cadence.com>
References: <1561236905-8901-1-git-send-email-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(136003)(396003)(376002)(2980300002)(199004)(189003)(36092001)(426003)(36756003)(54906003)(336012)(246002)(356004)(8676002)(486006)(47776003)(478600001)(87636003)(11346002)(4326008)(16586007)(14444005)(316002)(42186006)(305945005)(7636002)(107886003)(8936002)(6916009)(51416003)(186003)(26005)(86362001)(30864003)(50226002)(76176011)(2351001)(50466002)(26826003)(70586007)(446003)(126002)(476003)(2616005)(2906002)(5660300002)(76130400001)(48376002)(70206006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR07MB6832; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: edfba8bd-369c-48dc-b829-08d6f7540c08
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MN2PR07MB6832; 
X-MS-TrafficTypeDiagnostic: MN2PR07MB6832:
X-Microsoft-Antispam-PRVS: <MN2PR07MB68321FC6D76B21D3E04BAB5EC2E60@MN2PR07MB6832.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:316;
X-Forefront-PRVS: 0076F48C8A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Y8++cc0O82yJcGGR+GqQsGf/fMf7hD6ioOCLNJz2XnN0OdmmxDS4ikoLJ9C8T26nsA5S13pEQXPkmnekdV+MiZriPqENSZC9sDRsIXeE4iKKSJbKkvgtOvuAusnXd8b8v1PfoCKSHfPdR/RYIAxfesIR1ldankokHA76tZqNYOJfuv1TQ/W7gI/wMdnZ3PUPbboImcCiWN31EV4Gxl+9MVNJBV4qquW+Cib3FYExIWoOxpmL3EKJ3K66BdVXODHcuUJt/5INv34QGSjdvOwVF/IUjnKAtWtDCju86fLhySYjIHU7uBXetFILp4L6bUS9URWzDhrLEmhndlVCKDD6tLk+DFgTKD3H9fk9LClKBpvwPNfdvwydjVd+DsQ85NaD1mtP8WLVJOkMOXNjtorWxJpv6y2hO5QFp1z/7DSs7SE=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2019 20:56:06.9954 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edfba8bd-369c-48dc-b829-08d6f7540c08
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR07MB6832
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp
 include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-22_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=4 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906220190
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190622_135614_456200_2D06E5C9 
X-CRM114-Status: GOOD (  17.27  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
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

This patch adds support for mastership request to Cadence I3C master driver.

Secondary master is registered only if primary master already assigned us a
dynamic address.

Mastership is requested automatically after secondary master
receives mastership ENEC event and core wants to acquire the bus.
This allows secondary masters to initialize their bus.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>

---

Main changes between v4 and v5:
- Add populate_bus() hook implementation
- Rework bus limitation/mode update
- Add support for i3c_secondary_master_register()
- Add support for DA updated interrupt

Main changes between v3 and v4:
- Refactored the code

Main changes between v2 and v3:
- Add mastership type
- Add postponed master registration
- Add update device definition on bus initialization time
- Removed redundant mastership work structs
- Reworked IBI slot lookup
- Reworked Mastership event enabling/disabling

Changes in v2:
- Add work structs for mastership purpose
- Add missing mastership disable feature
---
 drivers/i3c/master/i3c-master-cdns.c | 794 +++++++++++++++++++++++++++--------
 1 file changed, 621 insertions(+), 173 deletions(-)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 9706426..1577bf4 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -157,6 +157,7 @@
 #define SLV_IMR				0x48
 #define SLV_ICR				0x4c
 #define SLV_ISR				0x50
+#define SLV_INT_DEFSLVS			BIT(21)
 #define SLV_INT_TM			BIT(20)
 #define SLV_INT_ERROR			BIT(19)
 #define SLV_INT_EVENT_UP		BIT(18)
@@ -388,8 +389,18 @@ struct cdns_i3c_xfer {
 	struct cdns_i3c_cmd cmds[0];
 };
 
+enum cdns_i3c_mr {
+	REQUEST,
+	HANDOFF,
+	TAKEOVER
+};
 struct cdns_i3c_master {
 	struct work_struct hj_work;
+	struct {
+		struct work_struct work;
+		enum cdns_i3c_mr mr_type;
+		u32 ibir;
+	} mastership;
 	struct i3c_master_controller base;
 	u32 free_rr_slots;
 	unsigned int maxdevs;
@@ -408,6 +419,7 @@ struct cdns_i3c_master {
 	struct clk *pclk;
 	struct cdns_i3c_master_caps caps;
 	unsigned long i3c_scl_lim;
+	struct work_struct register_work;
 };
 
 static inline struct cdns_i3c_master *
@@ -663,6 +675,277 @@ static void cdns_i3c_master_unqueue_xfer(struct cdns_i3c_master *master,
 	spin_unlock_irqrestore(&master->xferqueue.lock, flags);
 }
 
+static void
+cdns_i3c_master_dev_rr_to_i3c_info(struct cdns_i3c_master *master,
+				   unsigned int slot,
+				   struct i3c_device_info *info)
+{
+	u32 rr;
+
+	memset(info, 0, sizeof(*info));
+	rr = readl(master->regs + DEV_ID_RR0(slot));
+	info->dyn_addr = DEV_ID_RR0_GET_DEV_ADDR(rr);
+	rr = readl(master->regs + DEV_ID_RR2(slot));
+	info->dcr = rr;
+	info->bcr = rr >> 8;
+	info->pid = rr >> 16;
+	info->pid |= (u64)readl(master->regs + DEV_ID_RR1(slot)) << 16;
+}
+
+static void
+cdns_i3c_master_dev_rr_to_i2c_info(struct cdns_i3c_master *master,
+				   unsigned int slot,
+				   u16 *addr, u8 *lvr)
+{
+	u32 rr;
+
+	rr = readl(master->regs + DEV_ID_RR0(slot));
+	*addr = DEV_ID_RR0_GET_DEV_ADDR(rr);
+	rr = readl(master->regs + DEV_ID_RR2(slot));
+	*lvr = rr;
+}
+
+static
+int cdns_i3c_master_request_mastership(struct i3c_master_controller *m)
+{
+	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
+	u32 status;
+	int ret;
+
+	status = readl(master->regs + MST_STATUS0);
+	if (WARN_ON(status & MST_STATUS0_MASTER_MODE))
+		return -EEXIST;
+
+	status = readl(master->regs + SLV_STATUS1);
+	if (status & SLV_STATUS1_MR_DIS)
+		return -EACCES;
+
+	writel(readl(master->regs + CTRL) | CTRL_MST_INIT | CTRL_MST_ACK,
+	       master->regs + CTRL);
+
+	ret = readl_poll_timeout(master->regs + MST_STATUS0, status,
+				 status & MST_STATUS0_MASTER_MODE, 100,
+				 100000);
+	if (ret)
+		return ret;
+
+	writel(SLV_INT_EVENT_UP, master->regs + SLV_IDR);
+
+	master->base.bus.cur_master = master->base.this;
+
+	master->mastership.mr_type = TAKEOVER;
+	queue_work(master->base.wq, &master->mastership.work);
+
+	return 0;
+}
+
+static void cdns_i3c_master_upd_i3c_scl_lim(struct cdns_i3c_master *master)
+{
+	struct i3c_master_controller *m = &master->base;
+	unsigned long i3c_lim_period, pres_step, ncycles;
+	struct i3c_bus *bus = i3c_master_get_bus(m);
+	unsigned long new_i3c_scl_lim = 0;
+	struct i3c_dev_desc *dev;
+	u32 prescl1, ctrl;
+
+	i3c_bus_for_each_i3cdev(bus, dev) {
+		unsigned long max_fscl;
+
+		max_fscl = max(I3C_CCC_MAX_SDR_FSCL(dev->info.max_read_ds),
+			       I3C_CCC_MAX_SDR_FSCL(dev->info.max_write_ds));
+		switch (max_fscl) {
+		case I3C_SDR1_FSCL_8MHZ:
+			max_fscl = 8000000;
+			break;
+		case I3C_SDR2_FSCL_6MHZ:
+			max_fscl = 6000000;
+			break;
+		case I3C_SDR3_FSCL_4MHZ:
+			max_fscl = 4000000;
+			break;
+		case I3C_SDR4_FSCL_2MHZ:
+			max_fscl = 2000000;
+			break;
+		case I3C_SDR0_FSCL_MAX:
+		default:
+			max_fscl = 0;
+			break;
+		}
+
+		if (max_fscl &&
+		    (new_i3c_scl_lim > max_fscl || !new_i3c_scl_lim))
+			new_i3c_scl_lim = max_fscl;
+	}
+
+	/* Only update PRESCL_CTRL1 if the I3C SCL limitation has changed. */
+	if (new_i3c_scl_lim == master->i3c_scl_lim)
+		return;
+	master->i3c_scl_lim = new_i3c_scl_lim;
+	if (!new_i3c_scl_lim)
+		return;
+	pres_step = 1000000000UL / (bus->scl_rate.i3c * 4);
+
+	/* Configure PP_LOW to meet I3C slave limitations. */
+	prescl1 = readl(master->regs + PRESCL_CTRL1) &
+		  ~PRESCL_CTRL1_PP_LOW_MASK;
+	ctrl = readl(master->regs + CTRL);
+
+	i3c_lim_period = DIV_ROUND_UP(1000000000, master->i3c_scl_lim);
+	ncycles = DIV_ROUND_UP(i3c_lim_period, pres_step);
+	if (ncycles < 4)
+		ncycles = 0;
+	else
+		ncycles -= 4;
+
+	prescl1 |= PRESCL_CTRL1_PP_LOW(ncycles);
+
+	/* Disable I3C master before updating PRESCL_CTRL1. */
+	if (ctrl & CTRL_DEV_EN)
+		cdns_i3c_master_disable(master);
+
+	writel(prescl1, master->regs + PRESCL_CTRL1);
+
+	if (ctrl & CTRL_DEV_EN)
+		cdns_i3c_master_enable(master);
+}
+
+static int cdns_i3c_master_update_bus_limits(struct cdns_i3c_master *master)
+{
+	unsigned long pres_step, sysclk_rate, max_i2cfreq;
+	struct i3c_bus *bus = i3c_master_get_bus(&master->base);
+	u32 ctrl, prescl0, prescl1, pres, low;
+	int ncycles;
+
+	switch (bus->mode) {
+	case I3C_BUS_MODE_PURE:
+		ctrl = CTRL_PURE_BUS_MODE;
+		break;
+
+	case I3C_BUS_MODE_MIXED_FAST:
+		ctrl = CTRL_MIXED_FAST_BUS_MODE;
+		break;
+
+	case I3C_BUS_MODE_MIXED_SLOW:
+		ctrl = CTRL_MIXED_SLOW_BUS_MODE;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	sysclk_rate = clk_get_rate(master->sysclk);
+	if (!sysclk_rate)
+		return -EINVAL;
+
+	pres = DIV_ROUND_UP(sysclk_rate, (bus->scl_rate.i3c * 4)) - 1;
+	if (pres > PRESCL_CTRL0_MAX)
+		return -ERANGE;
+
+	bus->scl_rate.i3c = sysclk_rate / ((pres + 1) * 4);
+
+	prescl0 = PRESCL_CTRL0_I3C(pres);
+
+	low = ((I3C_BUS_TLOW_OD_MIN_NS * sysclk_rate) / (pres + 1)) - 2;
+	prescl1 = PRESCL_CTRL1_OD_LOW(low);
+
+	max_i2cfreq = bus->scl_rate.i2c;
+
+	pres = (sysclk_rate / (max_i2cfreq * 5)) - 1;
+	if (pres > PRESCL_CTRL0_MAX)
+		return -ERANGE;
+
+	bus->scl_rate.i2c = sysclk_rate / ((pres + 1) * 5);
+
+	ctrl = readl(master->regs + CTRL);
+
+	/* Disable I3C master before updating prescallers. */
+	if (ctrl & CTRL_DEV_EN)
+		cdns_i3c_master_disable(master);
+
+	prescl0 |= PRESCL_CTRL0_I2C(pres);
+	writel(prescl0, master->regs + PRESCL_CTRL0);
+
+	/* Calculate OD and PP low. */
+	pres_step = 1000000000 / (bus->scl_rate.i3c * 4);
+	ncycles = DIV_ROUND_UP(I3C_BUS_TLOW_OD_MIN_NS, pres_step) - 2;
+	if (ncycles < 0)
+		ncycles = 0;
+	prescl1 = PRESCL_CTRL1_OD_LOW(ncycles);
+
+	writel(prescl1, master->regs + PRESCL_CTRL1);
+
+	if (ctrl & CTRL_DEV_EN)
+		cdns_i3c_master_enable(master);
+
+	return 0;
+}
+
+static int cdns_i3c_master_populate_bus(struct i3c_master_controller *m)
+{
+	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
+	enum i3c_bus_mode mode = m->bus.mode;
+	u32 val, newdevs;
+	u16 addr;
+	u8 lvr;
+	int slot, ret;
+	struct i3c_device_info i3c_info;
+
+	newdevs = readl(master->regs + DEVS_CTRL) & DEVS_CTRL_DEVS_ACTIVE_MASK;
+
+	for (slot = 1; slot <= master->maxdevs; slot++) {
+		val = readl(master->regs + DEV_ID_RR0(slot));
+
+		if ((newdevs & BIT(slot)) && (val & DEV_ID_RR0_IS_I3C)) {
+			cdns_i3c_master_dev_rr_to_i3c_info(master, slot,
+							   &i3c_info);
+
+			ret = i3c_master_add_i3c_dev_locked(m, i3c_info.dyn_addr);
+			if (ret && ret != -EBUSY)
+				dev_warn(&m->dev, "Cannot add I3C device with addr: 0x%.2x, (ret = %i)",
+					 i3c_info.dyn_addr, ret);
+		} else if ((newdevs & BIT(slot)) &&
+			   !(val & DEV_ID_RR0_IS_I3C)) {
+			cdns_i3c_master_dev_rr_to_i2c_info(master, slot,
+							   &addr, &lvr);
+
+			ret = i3c_master_add_i2c_dev_locked(m, addr, lvr);
+			if (ret && ret != -EBUSY) {
+				dev_warn(&m->dev, "Cannot add I2C device with addr: 0x%.2x, (ret = %i)",
+					 i3c_info.dyn_addr, ret);
+				continue;
+			}
+
+			switch (lvr & I3C_LVR_I2C_INDEX_MASK) {
+			case I3C_LVR_I2C_INDEX(0):
+				if (mode < I3C_BUS_MODE_MIXED_FAST)
+					mode = I3C_BUS_MODE_MIXED_FAST;
+				break;
+			case I3C_LVR_I2C_INDEX(1):
+			case I3C_LVR_I2C_INDEX(2):
+				if (mode < I3C_BUS_MODE_MIXED_SLOW)
+					mode = I3C_BUS_MODE_MIXED_SLOW;
+				break;
+			default:
+				continue;
+			}
+		}
+	}
+
+	cdns_i3c_master_upd_i3c_scl_lim(master);
+
+	ret = i3c_bus_set_mode(&m->bus, mode);
+	if (ret)
+		return ret;
+
+	/*
+	 * Update bus limits.
+	 */
+	ret = cdns_i3c_master_update_bus_limits(master);
+	if (ret)
+		return ret;
+
+	return 0;
+}
 static enum i3c_error_code cdns_i3c_cmd_get_err(struct cdns_i3c_cmd *cmd)
 {
 	switch (cmd->error) {
@@ -1037,91 +1320,6 @@ static void cdns_i3c_master_bus_cleanup(struct i3c_master_controller *m)
 	cdns_i3c_master_disable(master);
 }
 
-static void cdns_i3c_master_dev_rr_to_info(struct cdns_i3c_master *master,
-					   unsigned int slot,
-					   struct i3c_device_info *info)
-{
-	u32 rr;
-
-	memset(info, 0, sizeof(*info));
-	rr = readl(master->regs + DEV_ID_RR0(slot));
-	info->dyn_addr = DEV_ID_RR0_GET_DEV_ADDR(rr);
-	rr = readl(master->regs + DEV_ID_RR2(slot));
-	info->dcr = rr;
-	info->bcr = rr >> 8;
-	info->pid = rr >> 16;
-	info->pid |= (u64)readl(master->regs + DEV_ID_RR1(slot)) << 16;
-}
-
-static void cdns_i3c_master_upd_i3c_scl_lim(struct cdns_i3c_master *master)
-{
-	struct i3c_master_controller *m = &master->base;
-	unsigned long i3c_lim_period, pres_step, ncycles;
-	struct i3c_bus *bus = i3c_master_get_bus(m);
-	unsigned long new_i3c_scl_lim = 0;
-	struct i3c_dev_desc *dev;
-	u32 prescl1, ctrl;
-
-	i3c_bus_for_each_i3cdev(bus, dev) {
-		unsigned long max_fscl;
-
-		max_fscl = max(I3C_CCC_MAX_SDR_FSCL(dev->info.max_read_ds),
-			       I3C_CCC_MAX_SDR_FSCL(dev->info.max_write_ds));
-		switch (max_fscl) {
-		case I3C_SDR1_FSCL_8MHZ:
-			max_fscl = 8000000;
-			break;
-		case I3C_SDR2_FSCL_6MHZ:
-			max_fscl = 6000000;
-			break;
-		case I3C_SDR3_FSCL_4MHZ:
-			max_fscl = 4000000;
-			break;
-		case I3C_SDR4_FSCL_2MHZ:
-			max_fscl = 2000000;
-			break;
-		case I3C_SDR0_FSCL_MAX:
-		default:
-			max_fscl = 0;
-			break;
-		}
-
-		if (max_fscl &&
-		    (new_i3c_scl_lim > max_fscl || !new_i3c_scl_lim))
-			new_i3c_scl_lim = max_fscl;
-	}
-
-	/* Only update PRESCL_CTRL1 if the I3C SCL limitation has changed. */
-	if (new_i3c_scl_lim == master->i3c_scl_lim)
-		return;
-	master->i3c_scl_lim = new_i3c_scl_lim;
-	if (!new_i3c_scl_lim)
-		return;
-	pres_step = 1000000000UL / (bus->scl_rate.i3c * 4);
-
-	/* Configure PP_LOW to meet I3C slave limitations. */
-	prescl1 = readl(master->regs + PRESCL_CTRL1) &
-		  ~PRESCL_CTRL1_PP_LOW_MASK;
-	ctrl = readl(master->regs + CTRL);
-
-	i3c_lim_period = DIV_ROUND_UP(1000000000, master->i3c_scl_lim);
-	ncycles = DIV_ROUND_UP(i3c_lim_period, pres_step);
-	if (ncycles < 4)
-		ncycles = 0;
-	else
-		ncycles -= 4;
-
-	prescl1 |= PRESCL_CTRL1_PP_LOW(ncycles);
-
-	/* Disable I3C master before updating PRESCL_CTRL1. */
-	if (ctrl & CTRL_DEV_EN)
-		cdns_i3c_master_disable(master);
-
-	writel(prescl1, master->regs + PRESCL_CTRL1);
-
-	if (ctrl & CTRL_DEV_EN)
-		cdns_i3c_master_enable(master);
-}
 
 static int cdns_i3c_master_do_daa(struct i3c_master_controller *m)
 {
@@ -1180,9 +1378,6 @@ static int cdns_i3c_master_do_daa(struct i3c_master_controller *m)
 
 	cdns_i3c_master_upd_i3c_scl_lim(master);
 
-	/* Unmask Hot-Join and Mastership request interrupts. */
-	i3c_master_enec_locked(m, I3C_BROADCAST_ADDR,
-			       I3C_CCC_EVENT_HJ | I3C_CCC_EVENT_MR);
 
 	return 0;
 }
@@ -1190,61 +1385,15 @@ static int cdns_i3c_master_do_daa(struct i3c_master_controller *m)
 static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
 {
 	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
-	unsigned long pres_step, sysclk_rate, max_i2cfreq;
-	struct i3c_bus *bus = i3c_master_get_bus(m);
-	u32 ctrl, prescl0, prescl1, pres, low;
-	int ncycles;
-
-	switch (bus->mode) {
-	case I3C_BUS_MODE_PURE:
-		ctrl = CTRL_PURE_BUS_MODE;
-		break;
-
-	case I3C_BUS_MODE_MIXED_FAST:
-		ctrl = CTRL_MIXED_FAST_BUS_MODE;
-		break;
-
-	case I3C_BUS_MODE_MIXED_SLOW:
-		ctrl = CTRL_MIXED_SLOW_BUS_MODE;
-		break;
-
-	default:
-		return -EINVAL;
-	}
-
-	sysclk_rate = clk_get_rate(master->sysclk);
-	if (!sysclk_rate)
-		return -EINVAL;
-
-	pres = DIV_ROUND_UP(sysclk_rate, (bus->scl_rate.i3c * 4)) - 1;
-	if (pres > PRESCL_CTRL0_MAX)
-		return -ERANGE;
-
-	bus->scl_rate.i3c = sysclk_rate / ((pres + 1) * 4);
-
-	prescl0 = PRESCL_CTRL0_I3C(pres);
-
-	low = ((I3C_BUS_TLOW_OD_MIN_NS * sysclk_rate) / (pres + 1)) - 2;
-	prescl1 = PRESCL_CTRL1_OD_LOW(low);
-
-	max_i2cfreq = bus->scl_rate.i2c;
-
-	pres = (sysclk_rate / (max_i2cfreq * 5)) - 1;
-	if (pres > PRESCL_CTRL0_MAX)
-		return -ERANGE;
-
-	bus->scl_rate.i2c = sysclk_rate / ((pres + 1) * 5);
-
-	prescl0 |= PRESCL_CTRL0_I2C(pres);
-	writel(prescl0, master->regs + PRESCL_CTRL0);
+	u32 ctrl;
+	int ret;
 
-	/* Calculate OD and PP low. */
-	pres_step = 1000000000 / (bus->scl_rate.i3c * 4);
-	ncycles = DIV_ROUND_UP(I3C_BUS_TLOW_OD_MIN_NS, pres_step) - 2;
-	if (ncycles < 0)
-		ncycles = 0;
-	prescl1 = PRESCL_CTRL1_OD_LOW(ncycles);
-	writel(prescl1, master->regs + PRESCL_CTRL1);
+	/*
+	 * Update bus limits.
+	 */
+	ret = cdns_i3c_master_update_bus_limits(master);
+	if (ret)
+		return ret;
 
 	/*
 	 * Enable Hot-Join, and, when a Hot-Join request happens, disable all
@@ -1252,6 +1401,7 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
 	 *
 	 * We will issue ENTDAA afterwards from the threaded IRQ handler.
 	 */
+	ctrl = readl(master->regs + CTRL);
 	ctrl |= CTRL_HJ_ACK | CTRL_HJ_DISEC | CTRL_HALT_EN | CTRL_MCS_EN;
 	writel(ctrl, master->regs + CTRL);
 
@@ -1260,6 +1410,22 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
 	return 0;
 }
 
+static
+struct i3c_dev_desc *cdns_i3c_get_ibi_device(struct cdns_i3c_master *master,
+					     u32 ibir)
+{
+	struct i3c_dev_desc *dev;
+	u32 id = IBIR_SLVID(ibir);
+
+	if (id >= master->ibi.num_slots || (ibir & IBIR_ERROR))
+		return NULL;
+
+	dev = master->ibi.slots[id];
+	if (!dev)
+		return NULL;
+
+	return dev;
+}
 static void cdns_i3c_master_handle_ibi(struct cdns_i3c_master *master,
 				       u32 ibir)
 {
@@ -1337,28 +1503,98 @@ static void cnds_i3c_master_demux_ibis(struct cdns_i3c_master *master)
 
 		case IBIR_TYPE_MR:
 			WARN_ON(IBIR_XFER_BYTES(ibir) || (ibir & IBIR_ERROR));
+			master->mastership.ibir = ibir;
+			master->mastership.mr_type = HANDOFF;
+			queue_work(master->base.wq,
+				   &master->mastership.work);
+			break;
 		default:
 			break;
 		}
 	}
 }
 
+static void cdns_i3c_master_bus_handoff(struct cdns_i3c_master *master)
+{
+	struct i3c_dev_desc *dev;
+
+	dev = cdns_i3c_get_ibi_device(master, master->mastership.ibir);
+
+	writel(MST_INT_MR_DONE, master->regs + MST_ICR);
+	writel(SLV_INT_EVENT_UP, master->regs + SLV_IER);
+
+	master->base.bus.cur_master = dev;
+}
+
+static void cdns_i3c_master_mastership_takeover(struct cdns_i3c_master *master)
+{
+	i3c_master_bus_takeover(&master->base);
+
+	writel(readl(master->regs + CTRL) & ~CTRL_MST_ACK, master->regs + CTRL);
+	writel(SLV_INT_EVENT_UP, master->regs + SLV_IDR);
+}
+
+static void cdns_i3c_master_event_up(struct cdns_i3c_master *master)
+{
+	u32 status;
+
+	writel(SLV_INT_EVENT_UP, master->regs + SLV_ICR);
+	status = readl(master->regs + SLV_STATUS1);
+
+	if (!(status & SLV_STATUS1_MR_DIS) &&
+	    master->base.want_to_acquire_bus) {
+		master->mastership.mr_type = REQUEST;
+		queue_work(master->base.wq, &master->mastership.work);
+	}
+}
+
+static void cdns_i3c_sec_master_da_updated(struct cdns_i3c_master *master)
+{
+	u32 status;
+
+	writel(SLV_INT_DA_UPD, master->regs + SLV_ICR);
+
+	status = readl(master->regs + SLV_STATUS1);
+
+	if (status & SLV_STATUS1_HAS_DA) {
+		writel(SLV_INT_DA_UPD, master->regs + SLV_IDR);
+		queue_work(master->base.wq, &master->register_work);
+	}
+}
 static irqreturn_t cdns_i3c_master_interrupt(int irq, void *data)
 {
 	struct cdns_i3c_master *master = data;
 	u32 status;
 
-	status = readl(master->regs + MST_ISR);
-	if (!(status & readl(master->regs + MST_IMR)))
-		return IRQ_NONE;
+	if (!master->base.this ||
+	    master->base.this != master->base.bus.cur_master) {
+		status = (readl(master->regs + SLV_ISR) &
+			  readl(master->regs + SLV_IMR));
+
+		if (!(status))
+			return IRQ_NONE;
+
+		if (status & SLV_INT_EVENT_UP)
+			cdns_i3c_master_event_up(master);
+
+		if (status & SLV_INT_DA_UPD)
+			cdns_i3c_sec_master_da_updated(master);
+	} else {
+		status = readl(master->regs + MST_ISR);
+
+		if (!(status & readl(master->regs + MST_IMR)))
+			return IRQ_NONE;
 
-	spin_lock(&master->xferqueue.lock);
-	cdns_i3c_master_end_xfer_locked(master, status);
-	spin_unlock(&master->xferqueue.lock);
+		spin_lock(&master->xferqueue.lock);
+		cdns_i3c_master_end_xfer_locked(master, status);
+		spin_unlock(&master->xferqueue.lock);
 
-	if (status & MST_INT_IBIR_THR)
-		cnds_i3c_master_demux_ibis(master);
+		if (status & MST_INT_IBIR_THR)
+			cnds_i3c_master_demux_ibis(master);
 
+		if (status & MST_INT_MR_DONE)
+			cdns_i3c_master_bus_handoff(master);
+	}
 	return IRQ_HANDLED;
 }
 
@@ -1426,30 +1662,55 @@ static int cdns_i3c_master_enable_ibi(struct i3c_dev_desc *dev)
 	return ret;
 }
 
-static int cdns_i3c_master_request_ibi(struct i3c_dev_desc *dev,
-				       const struct i3c_ibi_setup *req)
+static int cdns_i3c_master_find_ibi_slot(struct cdns_i3c_master *master,
+					 struct i3c_dev_desc *dev,
+					 s16 *slot)
 {
-	struct i3c_master_controller *m = i3c_dev_get_master(dev);
-	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
-	struct cdns_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
 	unsigned long flags;
 	unsigned int i;
 
-	data->ibi_pool = i3c_generic_ibi_alloc_pool(dev, req);
-	if (IS_ERR(data->ibi_pool))
-		return PTR_ERR(data->ibi_pool);
+	int ret = -ENOENT;
 
 	spin_lock_irqsave(&master->ibi.lock, flags);
 	for (i = 0; i < master->ibi.num_slots; i++) {
-		if (!master->ibi.slots[i]) {
-			data->ibi = i;
-			master->ibi.slots[i] = dev;
+		/*
+		 * We only need 'SIR' slots to describe IBI-capable devices.
+		 * This slot may be used by mastership request interrupt,
+		 * We can ruse the same 'SIR' map entry.
+		 */
+		if (master->ibi.slots[i] == dev) {
+			*slot = i;
+			ret = 0;
 			break;
 		}
 	}
+
+	if (ret)
+		for (i = 0; i < master->ibi.num_slots; i++) {
+			if (!master->ibi.slots[i]) {
+				master->ibi.slots[i] = dev;
+				*slot = i;
+				ret = 0;
+				break;
+			}
+		}
 	spin_unlock_irqrestore(&master->ibi.lock, flags);
 
-	if (i < master->ibi.num_slots)
+	return ret;
+}
+
+static int cdns_i3c_master_request_ibi(struct i3c_dev_desc *dev,
+				       const struct i3c_ibi_setup *req)
+{
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
+	struct cdns_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
+
+	data->ibi_pool = i3c_generic_ibi_alloc_pool(dev, req);
+	if (IS_ERR(data->ibi_pool))
+		return PTR_ERR(data->ibi_pool);
+
+	if (cdns_i3c_master_find_ibi_slot(master, dev, &data->ibi) == 0)
 		return 0;
 
 	i3c_generic_ibi_free_pool(data->ibi_pool);
@@ -1458,6 +1719,50 @@ static int cdns_i3c_master_request_ibi(struct i3c_dev_desc *dev,
 	return -ENOSPC;
 }
 
+static int
+cdns_i3c_master_enable_mastership_events(struct i3c_master_controller *m)
+{
+	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
+	struct cdns_i3c_i2c_dev_data *data;
+	struct i3c_dev_desc *i3cdev;
+	unsigned long flags;
+	u32 sircfg, sirmap;
+	int ret;
+
+	i3c_bus_for_each_i3cdev(&m->bus, i3cdev) {
+		if (I3C_BCR_DEVICE_ROLE(i3cdev->info.bcr) != I3C_BCR_I3C_MASTER)
+			continue;
+
+		data = i3c_dev_get_master_data(i3cdev);
+		if (!data)
+			continue;
+
+		ret = cdns_i3c_master_find_ibi_slot(master, i3cdev, &data->ibi);
+		if (ret)
+			continue;
+
+		spin_lock_irqsave(&master->ibi.lock, flags);
+		sirmap = readl(master->regs + SIR_MAP_DEV_REG(data->ibi));
+		sirmap &= ~SIR_MAP_DEV_CONF_MASK(data->ibi);
+		sircfg = SIR_MAP_DEV_ROLE(i3cdev->info.bcr >> 6) |
+			SIR_MAP_DEV_DA(i3cdev->info.dyn_addr) |
+			SIR_MAP_DEV_PL(i3cdev->info.max_ibi_len) |
+			SIR_MAP_DEV_ACK;
+
+		if (i3cdev->info.bcr & I3C_BCR_MAX_DATA_SPEED_LIM)
+			sircfg |= SIR_MAP_DEV_SLOW;
+
+		sirmap |= SIR_MAP_DEV_CONF(data->ibi, sircfg);
+		writel(sirmap, master->regs + SIR_MAP_DEV_REG(data->ibi));
+		spin_unlock_irqrestore(&master->ibi.lock, flags);
+	}
+
+	/* Unmask Hot-Join and Mastership request interrupts. */
+	ret = i3c_master_enec_locked(&master->base, I3C_BROADCAST_ADDR,
+				     I3C_CCC_EVENT_HJ | I3C_CCC_EVENT_MR);
+
+	return ret;
+}
 static void cdns_i3c_master_free_ibi(struct i3c_dev_desc *dev)
 {
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
@@ -1473,6 +1778,51 @@ static void cdns_i3c_master_free_ibi(struct i3c_dev_desc *dev)
 	i3c_generic_ibi_free_pool(data->ibi_pool);
 }
 
+static int
+cdns_i3c_master_disable_mastership_events(struct i3c_master_controller *m)
+{
+	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
+	struct cdns_i3c_i2c_dev_data *data;
+	struct i3c_dev_desc *i3cdev;
+	unsigned long flags;
+	u32 sirmap;
+	int ret;
+
+	ret = i3c_master_disec_locked(m, I3C_BROADCAST_ADDR,
+				      I3C_CCC_EVENT_MR);
+	if (ret)
+		return ret;
+
+	i3c_bus_for_each_i3cdev(&m->bus, i3cdev) {
+		if (I3C_BCR_DEVICE_ROLE(i3cdev->info.bcr) != I3C_BCR_I3C_MASTER)
+			continue;
+
+		data = i3c_dev_get_master_data(i3cdev);
+
+		ret = cdns_i3c_master_find_ibi_slot(master, i3cdev, &data->ibi);
+		if (ret)
+			continue;
+
+		/*
+		 * Do not modify SIR register and cleanup slots
+		 * if regular IBI is enabled for this device.
+		 */
+		if (master->ibi.slots[data->ibi]->ibi->handler)
+			continue;
+
+		spin_lock_irqsave(&master->ibi.lock, flags);
+		sirmap = readl(master->regs + SIR_MAP_DEV_REG(data->ibi));
+		sirmap &= ~SIR_MAP_DEV_CONF_MASK(data->ibi);
+		sirmap |= SIR_MAP_DEV_CONF(data->ibi,
+					SIR_MAP_DEV_DA(I3C_BROADCAST_ADDR));
+		writel(sirmap, master->regs + SIR_MAP_DEV_REG(data->ibi));
+		spin_unlock_irqrestore(&master->ibi.lock, flags);
+
+		cdns_i3c_master_free_ibi(i3cdev);
+	}
+
+	return ret;
+}
 static void cdns_i3c_master_recycle_ibi_slot(struct i3c_dev_desc *dev,
 					     struct i3c_ibi_slot *slot)
 {
@@ -1499,6 +1849,10 @@ static const struct i3c_master_controller_ops cdns_i3c_master_ops = {
 	.request_ibi = cdns_i3c_master_request_ibi,
 	.free_ibi = cdns_i3c_master_free_ibi,
 	.recycle_ibi_slot = cdns_i3c_master_recycle_ibi_slot,
+	.request_mastership = cdns_i3c_master_request_mastership,
+	.enable_mr_events = cdns_i3c_master_enable_mastership_events,
+	.disable_mr_events = cdns_i3c_master_disable_mastership_events,
+	.populate_bus = cdns_i3c_master_populate_bus
 };
 
 static void cdns_i3c_master_hj(struct work_struct *work)
@@ -1510,10 +1864,83 @@ static void cdns_i3c_master_hj(struct work_struct *work)
 	i3c_master_do_daa(&master->base);
 }
 
+static void
+cdns_i3c_master_mastership_request(struct cdns_i3c_master *master)
+{
+	u32 val;
+	int ret;
+
+	val = readl(master->regs + SLV_STATUS1);
+
+	if (!(val & SLV_STATUS1_HAS_DA))
+		return;
+
+	ret = cdns_i3c_master_request_mastership(&master->base);
+	if (ret)
+		dev_err(&master->base.dev, "Mastership failed\n");
+}
+
+static void cdns_i3c_master_mastership_handoff(struct cdns_i3c_master *master)
+{
+	int ret;
+
+	struct i3c_dev_desc *dev;
+	u32 ibir = master->mastership.ibir;
+
+	dev = cdns_i3c_get_ibi_device(master, ibir);
+	if (!dev)
+		return;
+
+	ret = i3c_master_mastership_ack(&master->base, dev->info.dyn_addr);
+	if (ret)
+		dev_err(&master->base.dev, "Mastership handoff failed\n");
+}
+
+static void cdns_i3c_master_mastership(struct work_struct *work)
+{
+	struct cdns_i3c_master *master = container_of(work,
+						      struct cdns_i3c_master,
+						      mastership.work);
+
+	switch (master->mastership.mr_type) {
+	case REQUEST:
+		cdns_i3c_master_mastership_request(master);
+		break;
+	case HANDOFF:
+		cdns_i3c_master_mastership_handoff(master);
+		break;
+	case TAKEOVER:
+		cdns_i3c_master_mastership_takeover(master);
+		break;
+	default:
+		break;
+	}
+}
+
+static void cdns_i3c_master_postponed_register(struct work_struct *work)
+{
+	struct cdns_i3c_master *master = container_of(work,
+						      struct cdns_i3c_master,
+						      register_work);
+	struct i3c_device_info info = { };
+	int ret;
+
+	cdns_i3c_master_dev_rr_to_i3c_info(master, 0, &info);
+	if (info.bcr & I3C_BCR_HDR_CAP)
+		info.hdr_cap = I3C_CCC_HDR_MODE(I3C_HDR_DDR);
+
+	ret = i3c_secondary_master_register(&master->base, &info);
+	if (ret)
+		dev_warn(&master->base.dev,
+			 "Device registration failed (ret = %i)", ret);
+	else
+		writel(SLV_INT_EVENT_UP, master->regs + SLV_IER);
+}
 static int cdns_i3c_master_probe(struct platform_device *pdev)
 {
 	struct cdns_i3c_master *master;
 	struct resource *res;
+	bool secondary = false;
 	struct i3c_device_info info = { };
 	int ret, irq;
 	u32 val;
@@ -1555,7 +1982,10 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
 	spin_lock_init(&master->xferqueue.lock);
 	INIT_LIST_HEAD(&master->xferqueue.list);
 
+	INIT_WORK(&master->register_work, cdns_i3c_master_postponed_register);
 	INIT_WORK(&master->hj_work, cdns_i3c_master_hj);
+	INIT_WORK(&master->mastership.work,
+		  cdns_i3c_master_mastership);
 	writel(0xffffffff, master->regs + MST_IDR);
 	writel(0xffffffff, master->regs + SLV_IDR);
 	ret = devm_request_irq(&pdev->dev, irq, cdns_i3c_master_interrupt, 0,
@@ -1565,6 +1995,9 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, master);
 
+	val = readl(master->regs + MST_STATUS0);
+	if (!(val & MST_STATUS0_MASTER_MODE))
+		secondary = true;
 	val = readl(master->regs + CONF_STATUS0);
 
 	/* Device ID0 is reserved to describe this master. */
@@ -1588,25 +2021,39 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
 
 	writel(IBIR_THR(1), master->regs + CMD_IBI_THR_CTRL);
 	writel(MST_INT_IBIR_THR, master->regs + MST_IER);
-	writel(DEVS_CTRL_DEV_CLR_ALL, master->regs + DEVS_CTRL);
+	if (!secondary)
+		writel(DEVS_CTRL_DEV_CLR_ALL, master->regs + DEVS_CTRL);
 
-	ret = i3c_master_init(&master->base, &pdev->dev, &cdns_i3c_master_ops, false);
+	ret = i3c_master_init(&master->base, &pdev->dev,
+			      &cdns_i3c_master_ops, secondary);
 	if (ret)
-	goto err_disable_sysclk;
+		goto err_disable_sysclk;
 
-	/* Get an address for the master. */
-	ret = i3c_master_get_free_addr(&master->base, 0);
-	if (ret < 0)
-		return ret;
+	if (!secondary) {
+		/* Get an address for the master. */
+		ret = i3c_master_get_free_addr(&master->base, 0);
+		if (ret < 0)
+			return ret;
 
-	writel(prepare_rr0_dev_address(ret) | DEV_ID_RR0_IS_I3C,
-	       master->regs + DEV_ID_RR0(0));
+		writel(prepare_rr0_dev_address(ret) | DEV_ID_RR0_IS_I3C,
+		master->regs + DEV_ID_RR0(0));
+	}
 
-	cdns_i3c_master_dev_rr_to_info(master, 0, &info);
+	cdns_i3c_master_dev_rr_to_i3c_info(master, 0, &info);
 	if (info.bcr & I3C_BCR_HDR_CAP)
 		info.hdr_cap = I3C_CCC_HDR_MODE(I3C_HDR_DDR);
 
-	ret = i3c_master_register(&master->base, &info);
+	if (secondary) {
+		if (readl(master->regs + SLV_STATUS1) & SLV_STATUS1_HAS_DA) {
+			ret = i3c_secondary_master_register(&master->base,
+							    &info);
+			if (master->base.want_to_acquire_bus)
+				writel(SLV_INT_EVENT_UP,
+				       master->regs + SLV_IER);
+		} else
+			writel(SLV_INT_DA_UPD, master->regs + SLV_IER);
+	} else
+		ret = i3c_master_register(&master->base, &info);
 
 	if (ret)
 		goto err_cleanup;
@@ -1656,6 +2103,7 @@ static struct platform_driver cdns_i3c_master = {
 module_platform_driver(cdns_i3c_master);
 
 MODULE_AUTHOR("Boris Brezillon <boris.brezillon@bootlin.com>");
+MODULE_AUTHOR("Przemyslaw Gaj <pgaj@cadence.com>");
 MODULE_DESCRIPTION("Cadence I3C master driver");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:cdns-i3c-master");
-- 
2.4.5


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
