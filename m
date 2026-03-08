Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4624FEA8538
	for <linux-i3c@archiver.kernel.org>; Sun,  8 Mar 2026 16:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C1DJzPq9BHH+jyrV6NTcbU1qjWeAKKM5Ui7pr/JVBSM=; b=3RyyMbvidruSYu
	amSFMn/g6K7FMRITkL4wRadAxFMXwUIKHq0VJX+a+0Zqsq1rY5d6bOMqi5avSdj0sDyALPPLDYGaF
	AyKOBKfVRbhG2CtnQdHeMtZoUJN++Z56zAXcZAQPKwQFzKxmsHALlLC8iLKdWsAhRftz4KLGJk2N2
	/TrXU4uvDGiC/UoOYsXEt4rcQgvKjSxpAgUMBJTawu3sKcJ8BL40y7EMd/IQCdXDFqYewhxLIu8r6
	VabtPVlNK25ub0DGxCmIq5ic0aEslqo1cQhAIxtQcMji7XjDNRrMnhZhARjWcpNPWxLHMjTcW0ERV
	GdhRj7Tbaehn+c8CHyRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzHIp-00000006Brf-3uVu;
	Sun, 08 Mar 2026 16:48:27 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzHIn-00000006Bq3-0Gnh
	for linux-i3c@lists.infradead.org;
	Sun, 08 Mar 2026 16:48:26 +0000
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62888qfq1054260;
	Sun, 8 Mar 2026 12:48:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=YzbEr
	bGlG1X7NE+1BnwRfu5R+zLyJ7dRC3l7oI+HvCg=; b=zoi4huo4xqzamM/z4PhyQ
	02w5gpfHw+rfe6I8ohn7uwaB9fBAX0xpuSm9JOSQs+Tf8aU55/yxcHcgOik09u5+
	v3RZqhObyAiOWwbteQSuVRVgVH1NSrBosJHoUh0zAO6S0hGlZiBTRB00lK+KPsJH
	FH6CAZNIBGxJ/8n6fdi0dIER6pdCw5zO/pHlo63rcFx3jwVtNFpXzTUPilwBIl16
	+UeMZxMwWbVe4tt5f+SplOOlj/E3RKjuSZDNu95/Jv4qjga/CSqxxtqfnlV40azJ
	M7Qqv1OhJ2O+uc7YfARuc/w6gYx2vU8xH948qS5HlYSE9CPhugrp0VpFnlcS2HyR
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4cs5bfrxcf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 08 Mar 2026 12:48:07 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 628Gm6jU014366
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 8 Mar 2026 12:48:06 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Sun, 8 Mar 2026 12:48:06 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Sun, 8 Mar 2026 12:48:06 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Sun, 8 Mar 2026 12:48:06 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com ([10.66.6.192])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 628GlhfI003692;
	Sun, 8 Mar 2026 12:47:58 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Sun, 8 Mar 2026 17:47:38 +0100
Subject: [PATCH 2/5] i3c: master: Move entdaa error suppression
MIME-Version: 1.0
Message-ID: <20260308-ad4062-positive-error-fix-v1-2-72d3c5290b4a@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772988463; l=2624;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=a2fiGLM+TNe5A3fLKFAw7ud2HzEN8cpKELAilI/NfFs=;
 b=Ms5dA0Vq/AHivOSkMsxj/P+dHb/jojkvioBLJMA1l40ZyMIQ/FdzVbYwGQYx1k+K12PY109ba
 558FEcGJGGwD+A5igMCTJPQBRmF0uOWtljtwWKyLanVIXHSKYBzJ/3R
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=IP4PywvG c=1 sm=1 tr=0 ts=69ada848 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=gAnH3GRIAAAA:8
 a=lW4FyyzJGg7ItnWL1goA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: WCOqDtrj5sPshPjvkZ55UqRjJ3ySxsCY
X-Proofpoint-GUID: WCOqDtrj5sPshPjvkZ55UqRjJ3ySxsCY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDE1NCBTYWx0ZWRfXxEoiMI9sq69n
 iEC+9dnBmQZ0iBVuMmguYYN2iy8hI0j8gm7U95tBSg7/2xvU+ec+JTvCgdsubq9/eXB6GXnmZC1
 4mRyruWzH01ieVYRiVK9sC8SwjuJtt70DHSlZ/efR3tLSWY5+AgywU+8jDK4QCTGvcZrjC8WLTN
 XUxVvJVJcxm+ZDFgeq5NZyq5wyeW1W0mmeZHi6Y/nbUU5kqJFFJD4dtXJFtbE9o3advNihgx1LF
 AcksX3KI6/rLC/HD3R0zryt6eUxeCMdbulxeRiBQ/jJYzF1Q0yTjjaaVqB8Jfxx0qLaISAUPSdc
 MRSFm2qb+H42WmZ0bQ8OHKObwZLFOy8KTBQ7p8P2WmTb/jsWMkA8BgSoGe8LxJtLAqmW8sXwiuA
 LFZAYxTKe/S/7pmkjt2uUdC24TaAbwCG4LKOLhNI8GwjsAlEgaIBXdpzYRov5MPrEt4C4cBmOJs
 zCJOXkCs/kZN9Es4p3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603080154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_094825_133152_DB32BAFA 
X-CRM114-Status: GOOD (  15.32  )
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

The CCC ENTDAA is invoked with i3c_master_entdaa_locked and yields
error I3C_ERROR_M2 if there are no devices active on the bus.
Some controllers may also yield if there are no more devices need an
dynamic address, since the sequence do always end in a NACK.

Handle inside i3c_master_entdaa_locked, checking cmd->err directly.

Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
 drivers/i3c/master.c                 | 7 +++++--
 drivers/i3c/master/adi-i3c-master.c  | 3 +--
 drivers/i3c/master/i3c-master-cdns.c | 2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 31822fd5ffde..ce1898345810 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1036,8 +1036,7 @@ static int i3c_master_rstdaa_locked(struct i3c_master_controller *master,
  *
  * This function must be called with the bus lock held in write mode.
  *
- * Return: 0 in case of success, a positive I3C error code if the error is
- * one of the official Mx error codes, and a negative error code otherwise.
+ * Return: 0 in case of success, or a negative error code otherwise.
  */
 int i3c_master_entdaa_locked(struct i3c_master_controller *master)
 {
@@ -1050,6 +1049,10 @@ int i3c_master_entdaa_locked(struct i3c_master_controller *master)
 	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
 	i3c_ccc_cmd_dest_cleanup(&dest);
 
+	/* No active devices need an address. */
+	if (ret && cmd.err == I3C_ERROR_M2)
+		ret = 0;
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(i3c_master_entdaa_locked);
diff --git a/drivers/i3c/master/adi-i3c-master.c b/drivers/i3c/master/adi-i3c-master.c
index 6616f751075a..fb9a48830446 100644
--- a/drivers/i3c/master/adi-i3c-master.c
+++ b/drivers/i3c/master/adi-i3c-master.c
@@ -655,8 +655,7 @@ static int adi_i3c_master_do_daa(struct i3c_master_controller *m)
 
 	writel(irq_mask, master->regs + REG_IRQ_MASK);
 
-	/* DAA always finishes with CE2_ERROR or NACK_RESP */
-	if (ret && ret != I3C_ERROR_M2)
+	if (ret)
 		return ret;
 
 	/* Add I3C devices discovered */
diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index b78aebf6b2ca..5cfec6761494 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -1143,7 +1143,7 @@ static int cdns_i3c_master_do_daa(struct i3c_master_controller *m)
 	}
 
 	ret = i3c_master_entdaa_locked(&master->base);
-	if (ret && ret != I3C_ERROR_M2)
+	if (ret)
 		return ret;
 
 	newdevs = readl(master->regs + DEVS_CTRL) & DEVS_CTRL_DEVS_ACTIVE_MASK;

-- 
2.51.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
