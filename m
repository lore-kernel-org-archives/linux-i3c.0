Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988BFEA8539
	for <linux-i3c@archiver.kernel.org>; Sun,  8 Mar 2026 16:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g7GPaIrEGcsXuGTru6y7xE5LecDqnM9M/cL5Fwnwnac=; b=fjxllzbTHItaru
	66jiG+mbAPXW8sxjs5gp/nl4pfuXIhcAYLHdocejUZXhkwfCQu6kvKNsxJ+e4Tts6+CXDOrAZXoW+
	XONXkB8cNNG10s+gCCEIaK18BVcwkI7WptdSfQtE9kMHnbr8PCNkSzO1HDtelPgod+FHrHiJw5BFt
	O0HWDjGeMvNdGlGIGzh8KpVe/OUZbjfSaCSAdfXyz/ysTie9388RYwrxGrv9hhd5f8eOOH9KV6Jjm
	EyDijnOQxeweiZrOpVBHy2/Hq6oPN9HlUUAsMa2aoWx9r4lvvp/T3hOxGtI8M9F0LU5DkGGMjrO70
	UHR0WGwwLdyaKPVSFN/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzHIq-00000006Brt-0o87;
	Sun, 08 Mar 2026 16:48:28 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzHIn-00000006BqU-2dby
	for linux-i3c@lists.infradead.org;
	Sun, 08 Mar 2026 16:48:26 +0000
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628AqRTl1897330;
	Sun, 8 Mar 2026 12:48:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=DY+XR
	2dLMIlBMKlpuqtcDIGI/m3CPs5jGqtHsBq67vE=; b=Up2HFq/5zbDvYHsggoQPl
	hfE0wu+LO8xPkElw9vriOOI2VztL5rAq2qis0zJFo5b80VO8itvmYpXTEeMxiCvt
	L46KzXXmUOxRtOhkF6OOQnbDjl0FX3Vf4mmh/8IJagxj7qi67Om+DzOB5U8LSyOa
	udWRIqS5wIptRJia3/qpy6VYrSHYgNhOSYYI+jGOFCX8OL6en+8IJoP7tP0z1P0P
	2NdVSzeW9ma2BvWQYNvi5ULYcIzcLK+RCqtKJTG1QgvCM9ey34oKj40v0/+vTqNp
	CWNF8HOPeiX4aDbgFmVX3Z3WZodaMJJo9ATVbWxxzAMYUn3BZMoMBULsNKS4qGz/
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4crht6ud1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 08 Mar 2026 12:48:08 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 628Gm76r014372
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 8 Mar 2026 12:48:07 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Sun, 8 Mar 2026 12:48:07 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Sun, 8 Mar 2026 12:48:07 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Sun, 8 Mar 2026 12:48:07 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com ([10.66.6.192])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 628GlhfK003692;
	Sun, 8 Mar 2026 12:48:01 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Sun, 8 Mar 2026 17:47:40 +0100
Subject: [PATCH 4/5] i3c: master: Negative error codes at send_ccc_cmd
MIME-Version: 1.0
Message-ID: <20260308-ad4062-positive-error-fix-v1-4-72d3c5290b4a@analog.com>
References: <20260308-ad4062-positive-error-fix-v1-0-72d3c5290b4a@analog.com>
In-Reply-To: <20260308-ad4062-positive-error-fix-v1-0-72d3c5290b4a@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772988463; l=3512;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=2L8F3wEbrWmn5r13QlXUSMAL+xNCy5F6Ta86TY5QAos=;
 b=M9Cim7N9Y6clbylfoXxetgc0TTyb5GaZ3aKvnk7zW8zOHMUxt4a0EbOFFkglqNUCr4L7dl8gS
 iO8psT+R4i3Agnvjq63Teh2YLULnFKbNGdWL67Z5OwSa9Xdvc32iHeI
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=f5RFxeyM c=1 sm=1 tr=0 ts=69ada848 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=gAnH3GRIAAAA:8 a=Eqnk1nJrLcZiEtcKfW8A:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: WEhgZdLpURoIQZBl9IgYH1GVXqvpPU1-
X-Proofpoint-GUID: WEhgZdLpURoIQZBl9IgYH1GVXqvpPU1-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDE1NCBTYWx0ZWRfX7ETloNQ+2emd
 0FT7i3ddU2FqpQRv7KPYPSYxWjYehlOnos5XSXTktWFimVZxgkIAmNGITALKx2tSjK0Z9Wk5AVs
 EOKEra/iJp23LtoFEKxqQNk89Gx2zSwSz/PNMpcqM8OwZGvyO1dZ0tJ/OqYJff25rkPNp/5oL+U
 cqY80t2s3qRNFBLZ/oY+6u/WnNc2grZxtmlmY4cBHfBMO2PQgaP33URRGYatjsAyZmCPyF4wwnE
 OivKK52PYjEidDJ1eHP/vO+ad/jqmrCVkEeCqapFz8s00qklQo0NYw5kZL2DL44DhsHBP0E4/GN
 YilApiu4NBCXGLrNcElLaSPv1ymx97kNFokesUSqhEbgKh2BXLSgClUcMQUL1U6KOXnapfVapDt
 GSBOXpncfJq/n+ORVTS+bb8yAa7KC3Vowi5oyvuRpxeLjmUJKhXLLfFbJZ8812h/HjaRfBr1B9b
 12wQVZyYnxZxPHqKZ4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_094825_675578_0E40866B 
X-CRM114-Status: GOOD (  14.31  )
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

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-iio/aYXvT5FW0hXQwhm_@stanley.mountain/

Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
 drivers/i3c/master.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 3e465587c9c7..8459fffbdebb 100644
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
@@ -1101,8 +1099,7 @@ static int i3c_master_enec_disec_locked(struct i3c_master_controller *master,
  *
  * This function must be called with the bus lock held in write mode.
  *
- * Return: 0 in case of success, a positive I3C error code if the error is
- * one of the official Mx error codes, and a negative error code otherwise.
+ * Return: 0 in case of success, or a negative error code otherwise.
  */
 int i3c_master_disec_locked(struct i3c_master_controller *master, u8 addr,
 			    u8 evts)
@@ -1122,8 +1119,7 @@ EXPORT_SYMBOL_GPL(i3c_master_disec_locked);
  *
  * This function must be called with the bus lock held in write mode.
  *
- * Return: 0 in case of success, a positive I3C error code if the error is
- * one of the official Mx error codes, and a negative error code otherwise.
+ * Return: 0 in case of success, or a negative error code otherwise.
  */
 int i3c_master_enec_locked(struct i3c_master_controller *master, u8 addr,
 			   u8 evts)
@@ -1148,8 +1144,7 @@ EXPORT_SYMBOL_GPL(i3c_master_enec_locked);
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
