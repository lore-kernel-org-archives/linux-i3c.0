Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A353106ACD1
	for <linux-i3c@archiver.kernel.org>; Thu, 12 Mar 2026 16:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gFMXBSv9t0+bOvylOJ7yIvlfN058+sUBHsfdJk/qvAo=; b=AMXaTzAChRctxq
	rUn0bBSN2xA7Co/jYsWw4j0DNdKuRC6IwN/QSe5H5imPQBjiUI808bl91fueFJnpiKR+l3mSfmnC4
	hZa5JOc4NKNtbC/qjdEA20tLjizTsSJISnR5CppZg2yPgNqR50e0URG+laN/qvU+zrXuPDhgPBYZ1
	Q6xRBtrycqqHu4T2eIniP6NmOn08mSqubPapm3egZ4Tzy7z7CK70fRACgTFQMIGKjf2JXnosZ9OiK
	kM/7gHsMpkoQ1dwqDiC4gseIVhmg/ef4YE+MSWva696IbV53WZbWijcPOoWeX4HfS0Ezg3IxRzaQg
	R+AsEeei/UajgnVYkBAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0j3e-0000000EamC-1Khw;
	Thu, 12 Mar 2026 16:38:46 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77] helo=mx0b-00128a01.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0j3Z-0000000Eah8-25Xb
	for linux-i3c@lists.infradead.org;
	Thu, 12 Mar 2026 16:38:44 +0000
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CFOdmt3650594;
	Thu, 12 Mar 2026 12:38:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=tUSKW
	QT4P/2moqhSnLHNwh/ADK0S/UpU5K7j/Irbgjo=; b=OG564uebqd2VsqJH2LfSp
	Fym6X1N7A9xrby6g7GmCBclpZfGF3FT6tYHzowxZwiN/9tUwtw3DlkkV40jD7bvZ
	n6pNZM+ksUK/tuQjAE4M8vip2qwG3w9ro9JlO7py/NdRnPS/OL+RpyQkhsCSQ7Ms
	G2elQp+DavTE23x2gFg1qUJh7WZdcbJ5yySNqf25Wtp+24bwO9aOFaQ2FHtVzwFs
	AoJ7nIU8RzdKS/uAgemNw5eKjXScMeIk614v3NVxCMRddwEJRikl/ifMxJOWxwL7
	AsI6o2wz8dlHxbWCLeD0zjUM9LupFvHQTDBmgeV6u9zkMPEsZeAPdRV5kQlPM3CK
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4cuh6bbhtn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Mar 2026 12:38:28 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 62CGcRwP009197
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 Mar 2026 12:38:27 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 12 Mar 2026 12:38:27 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 12 Mar 2026 12:38:27 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 12 Mar 2026 12:38:27 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.44.3.82] (may be forged))
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 62CGc8Gb021063;
	Thu, 12 Mar 2026 12:38:21 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Thu, 12 Mar 2026 17:38:07 +0100
Subject: [PATCH v2 4/5] i3c: master: Fix error codes at send_ccc_cmd
MIME-Version: 1.0
Message-ID: <20260312-ad4062-positive-error-fix-v2-4-1c933b5c7ed8@analog.com>
References: <20260312-ad4062-positive-error-fix-v2-0-1c933b5c7ed8@analog.com>
In-Reply-To: <20260312-ad4062-positive-error-fix-v2-0-1c933b5c7ed8@analog.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li
	<Frank.Li@nxp.com>,
        =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Dan
 Carpenter" <dan.carpenter@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Jorge Marques <jorge.marques@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773333488; l=4251;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=7vidzCQRmOyF2S3K2XJ89yaex63i+B/REByOo+UC1YE=;
 b=F58At7aMBD89byi/0YksE/4VQU+dhMCRvGs+fZ9xppQ2X/BsDSkqr7LpnM9bKtP4/fzZkUY97
 /qjKJND1/J8BGE5mvxhpLdAr355vBsedZalBUUnQdOX71RVpa0k1PSE
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: kO66H4wGjzktiawqbgh4AGHN31I6g8Na
X-Authority-Analysis: v=2.4 cv=c6amgB9l c=1 sm=1 tr=0 ts=69b2ec04 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=gAnH3GRIAAAA:8 a=gG0kfVGoOCJ2PuLymYQA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: kO66H4wGjzktiawqbgh4AGHN31I6g8Na
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEzNCBTYWx0ZWRfX3QK53iDyT1i0
 qmAG7piQQnOrc7lkfm83Ry09w67KJBn6UyRGI2JH2FPMsx7IsJNeMD5VTx/g1kadudt0Vc/+tCO
 c7KJPQMEZmFg/+/D9o1Jqyo+5PE89lBS1/MFVmP5ORMTWnabG+epDGKVM8tMyCZRiuOKPUEEQZ3
 7EfYzmAoUVCBG62pQEdEAnD3DNzv/pqSg8rVfaaQFbzlavcFQAkc6yg5DjGwtHW3wUqgVxf82fB
 C3L4lSUl8OKEAdpEFzKusHuz99Pg97NGK+FiF8M92b3whtRp6Oh1Y8y/o8hQ5VMavKehcmRzfRA
 82XG9qmJgXP/KlZ6fK5e0YELQR5HHYXUl9WqVeMazz6+3hwLjx48MmjyoBzn+XVF6pGvOCrWwWi
 Qo/8HpCbsaG6n0vVUSU4j2N80kxhx41Bzq5VlpE5d6PSoEBUzhQ+l55S108VkFbl18sZnSBorDl
 CnZayq21LlAc83kIWGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_093841_577732_DF54CED7 
X-CRM114-Status: GOOD (  15.88  )
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

i3c_master_send_ccc_cmd_locked would propagate cmd->err (positive,
Mx codes) to the ret variable, cascading down multiple methods until
reaching methods that explicitly stated they would return 0 on success
or negative error code. For example, the call chain:

  i3c_device_enable_ibi <- i3c_dev_enable_ibi_locked <-
  master->ops.enable_ibi <- i3c_master_enec_locked <-
  i3c_master_enec_disec_locked <- i3c_master_send_ccc_cmd_locked

Fix this by returning the ret value, callers can
still read the cmd->err value if ret is negative.

All corner cases where the Mx codes do need to be handled individually,
are resolved in previous commits. Those corner cases are all scenarios
when I3C_ERROR_M2 is expected and acceptable.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-iio/aYXvT5FW0hXQwhm_@stanley.mountain/
Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
 drivers/i3c/master.c | 32 +++++++++++++-------------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index bc1189afaed81..0752af5eb79b0 100644
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
