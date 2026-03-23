Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9793CF483C5
	for <linux-i3c@archiver.kernel.org>; Mon, 23 Mar 2026 16:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sq6Ml0+keweDM2A3rVNIJ6mGGDCtD4ApJn5KbnizCzs=; b=epJC7R/m9Mtlxg
	UObtGy+0g95Elq1HKVDq2RS28TUuxNz3sHyyQEgUKmy3KKiAslTD3So1kgai7Kk8uVXTMPQEfOYrf
	2XvdEbBOt44BgAGmL9/5tYNeNUwT2dhye2b0BcZCDePfynu8VzfMYnyfPF4IgcG41EnCh43er6Oe0
	6hweU4m5GMJSiaqUZLNtJ0fPMB3H5EV+vqyEucWV8synMZE52aDo98T4dpCAJsmzTJUGq3n7o/rxf
	YNmS1WAXPDC0z2uFDVuDsTSguJqyPu8urgOQqHhVeT0OHW3LmjdRp4BJnxKCcxx06HVxsjS9kXSYi
	0jtp7NE9rk9xqlTtxlbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hst-0000000H6Kd-1EbB;
	Mon, 23 Mar 2026 16:12:07 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hsp-0000000H6I2-2ar7
	for linux-i3c@lists.infradead.org;
	Mon, 23 Mar 2026 16:12:04 +0000
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NDGvve2271070;
	Mon, 23 Mar 2026 12:11:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=22wa1
	IcvbmGWHaddNqNINTnZZckFB8o0psKJ23G1isY=; b=e5F3gdH3/IttTFGDYNz2P
	CjXxaCLHjRh0+aQIX/O93/spZmqTMFxWP1+H8tBotlcadnPysERTip0n3DtTKIw8
	iNmLtOc6ipvBCpK+WivKsdFU9KpRxLA4C2qlhJoYr171QgWGcSxrdci2A4alzixi
	eqxCH8LrBMhacISgy2VypxLJEAX9ecaP4CYkb66F70vab+do/1uehDpgl+2w45Kt
	eCZjyYbd2nmo5Tkwn52UagF/zuCPX8LTpR+EQ6uiedqgEHpItnDOkc00wTAlqDg9
	fR0cNZ5G0rnOK1TxHmTWgo2NJC8zgzH76ov9IUvwNVdX1hc7fbcTW1RSyZtYy1JS
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4d2cnew41k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Mar 2026 12:11:54 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 62NGBrdi044715
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Mar 2026 12:11:53 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 23 Mar 2026 12:11:53 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 23 Mar 2026 12:11:53 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 23 Mar 2026 12:11:53 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.44.3.69] (may be forged))
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 62NGBYnu019356;
	Mon, 23 Mar 2026 12:11:49 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Mon, 23 Mar 2026 17:11:32 +0100
Subject: [PATCH v3 4/5] i3c: master: Fix error codes at send_ccc_cmd
MIME-Version: 1.0
Message-ID: <20260323-ad4062-positive-error-fix-v3-4-30bdc68004be@analog.com>
References: <20260323-ad4062-positive-error-fix-v3-0-30bdc68004be@analog.com>
In-Reply-To: <20260323-ad4062-positive-error-fix-v3-0-30bdc68004be@analog.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li
	<Frank.Li@nxp.com>,
        =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Dan
 Carpenter" <dan.carpenter@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Jorge Marques <jorge.marques@analog.com>,
        Adrian Hunter
	<adrian.hunter@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774282294; l=4492;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=mXexfWrPC8job5yxecoVQWlrK4dSj2XswWAmOWB70/A=;
 b=fG+sRnwvsADIgpFBn97TZRXbm0jfwZ8sYFYqKD4oL04ZKdbKLWswD74UU2uewSwMjZxdqwyzF
 fNT29XOvQrrC3YdVqta70ICe+XmOdAbkvyzbKql3BSjd0SIxD7ThTye
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=UcVciaSN c=1 sm=1 tr=0 ts=69c1664a cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=QyXUC8HyAAAA:8 a=gAnH3GRIAAAA:8 a=hEpeh2MoHh9kNZLcwicA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: GbH2A9rCJzKlv7EiEWIRPiQ9EbHjdscF
X-Proofpoint-GUID: GbH2A9rCJzKlv7EiEWIRPiQ9EbHjdscF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEyMyBTYWx0ZWRfX2gmJz8LSsR8s
 bvrKr6dgx6EUhrcLWEwV9N+2PQoRSJS8Igu9/NZmiJECrXaChsl4aP+vBTmbuZ0geJITL+NuhvH
 cvdLiQI+ND6bwBXQoNGcsafgOe9QoCaJd7GEXmfzVatgd0HM1gj/3PT8fJaVwUZrRr/IbF3Fq2I
 w9OUiUC/tyC0sYmb4hdOCqCFy+B/jqkem9biBaIcCJWXdHP76wLUeFIVNjbxpOjIydc8u9GCNA2
 tgXtesQinV3Sm7pgdjsqp2LSrkO21hvaz1wO3hiI+8LD6dMV9lAEMTJtCPsb86o2rdECKW3HhMY
 Ob7arW0suX4nn/XABMn+JXODmUSr9+FSYR9Cc/uquT2Lc65XbQBU5eWDtAJrhEXPG9tFud3n1og
 2bi0HcRZ/Nqq6pml+fhnLBWO9+EZ8lkvSCSAAf4Wyh59syGXOGU1HhV9AiLp1+3db6c/0NUfTsW
 6BrpSTmvYiHU6h5WDhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1011 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_091203_665741_EAB03C4B 
X-CRM114-Status: GOOD (  15.92  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

i3c_master_send_ccc_cmd_locked() would propagate cmd->err (positive,
Mx codes) to the ret variable, cascading down multiple methods until
reaching methods that explicitly stated they would return 0 on success
or negative error code. For example, the call chain:

  i3c_device_enable_ibi <- i3c_dev_enable_ibi_locked <-
  master->ops.enable_ibi <- i3c_master_enec_locked <-
  i3c_master_enec_disec_locked <- i3c_master_send_ccc_cmd_locked

Fix this by returning the ret value, callers can still read the cmd->err
value if ret is negative.

All corner cases where the Mx codes do need to be handled individually,
are resolved in previous commits. Those corner cases are all scenarios
when I3C_ERROR_M2 is expected and acceptable.
The prerequisite patches for the fix are:

  i3c: master: Move rstdaa error suppression
  i3c: master: Move entdaa error suppression
  i3c: master: Move bus_init error suppression

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-iio/aYXvT5FW0hXQwhm_@stanley.mountain/
Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
 drivers/i3c/master.c | 32 +++++++++++++-------------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index b80f7528948ab..e092c833124c0 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -898,11 +898,17 @@ static void i3c_ccc_cmd_init(struct i3c_ccc_cmd *cmd, bool rnw, u8 id,
 	cmd->err = I3C_ERROR_UNKNOWN;
 }
 
+/**
+ * i3c_master_send_ccc_cmd_locked() - send a CCC (Common Command Codes)
+ * @master: master used to send frames on the bus
+ * @cmd: command to send
+ *
+ * Return: 0 in case of success, or a negative error code otherwise.
+ *         I3C Mx error codes are stored in cmd->err.
+ */
 static int i3c_master_send_ccc_cmd_locked(struct i3c_master_controller *master,
 					  struct i3c_ccc_cmd *cmd)
 {
-	int ret;
-
 	if (!cmd || !master)
 		return -EINVAL;
 
@@ -920,15 +926,7 @@ static int i3c_master_send_ccc_cmd_locked(struct i3c_master_controller *master,
 	    !master->ops->supports_ccc_cmd(master, cmd))
 		return -EOPNOTSUPP;
 
-	ret = master->ops->send_ccc_cmd(master, cmd);
-	if (ret) {
-		if (cmd->err != I3C_ERROR_UNKNOWN)
-			return cmd->err;
-
-		return ret;
-	}
-
-	return 0;
+	return master->ops->send_ccc_cmd(master, cmd);
 }
 
 static struct i2c_dev_desc *
@@ -1036,8 +1034,7 @@ static int i3c_master_rstdaa_locked(struct i3c_master_controller *master,
  *
  * This function must be called with the bus lock held in write mode.
  *
- * Return: 0 in case of success, a positive I3C error code if the error is
- * one of the official Mx error codes, and a negative error code otherwise.
+ * Return: 0 in case of success, or a negative error code otherwise.
  */
 int i3c_master_entdaa_locked(struct i3c_master_controller *master)
 {
@@ -1097,8 +1094,7 @@ static int i3c_master_enec_disec_locked(struct i3c_master_controller *master,
  *
  * This function must be called with the bus lock held in write mode.
  *
- * Return: 0 in case of success, a positive I3C error code if the error is
- * one of the official Mx error codes, and a negative error code otherwise.
+ * Return: 0 in case of success, or a negative error code otherwise.
  */
 int i3c_master_disec_locked(struct i3c_master_controller *master, u8 addr,
 			    u8 evts)
@@ -1118,8 +1114,7 @@ EXPORT_SYMBOL_GPL(i3c_master_disec_locked);
  *
  * This function must be called with the bus lock held in write mode.
  *
- * Return: 0 in case of success, a positive I3C error code if the error is
- * one of the official Mx error codes, and a negative error code otherwise.
+ * Return: 0 in case of success, or a negative error code otherwise.
  */
 int i3c_master_enec_locked(struct i3c_master_controller *master, u8 addr,
 			   u8 evts)
@@ -1144,8 +1139,7 @@ EXPORT_SYMBOL_GPL(i3c_master_enec_locked);
  *
  * This function must be called with the bus lock held in write mode.
  *
- * Return: 0 in case of success, a positive I3C error code if the error is
- * one of the official Mx error codes, and a negative error code otherwise.
+ * Return: 0 in case of success, or a negative error code otherwise.
  */
 int i3c_master_defslvs_locked(struct i3c_master_controller *master)
 {

-- 
2.51.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
