Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91363106ACC9
	for <linux-i3c@archiver.kernel.org>; Thu, 12 Mar 2026 16:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XhYeXuW3NS6HpnFZMg2JrQU0SL+I3unlJDHteojk7Qs=; b=NlLFtbs1cWgJ09
	VP8gyygiBhNPN8zEIXqSKWI9QHb6PdDl1XHx8KN4Uv0NZSE+t/31ztR52SDlNSa9Z2Oe8ItQITxrS
	uFEPlGPLTLh09UqGlLAxKt/zd01LZsfXhk6CoWdLEl9BI7CE9YHqrvEOLx4tpquJ2zbh2eomnKMrn
	SiK47Gmcq1d1ik3V+YeaD0JXo8YBrl4FLobbxqDHjL1CWEF8tln7+GjV/lwuhyGIwbrfJJLqaLS/S
	DGfFYRxtOu5f6P/jw2bqCdHeS2ekA6rj/S9rN51JsXl4ByU+aMhT8ESnSdwLke85KtepImxF4QgLp
	q+YezKEbfvNC1GT+vx1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0j3b-0000000EajC-2WbP;
	Thu, 12 Mar 2026 16:38:44 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0j3Y-0000000EaeS-0ZnK
	for linux-i3c@lists.infradead.org;
	Thu, 12 Mar 2026 16:38:42 +0000
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CB2f5m1999727;
	Thu, 12 Mar 2026 12:38:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=dPvUL
	CIUekonudW8rZUau6fSmrfsOpqPfpx/auhxynM=; b=u8cB8ylxrtQg1/vVtxdP2
	6g0Mmafwo1zUvUyOIOH6DB4fl3Ju9KLlNA3HvXLSwcQSXbQdhiiN4AAOKPxKE2AL
	XF+y/aRNeKosq3KjRRDA4QLsldaWYmUKB/iEI+jG/Hz6l4unPjW1K4XDsVd/PSoS
	2whSBy4W/DmYQCJbv4u1XDRRZL81SlXGNyKntPm1sF9czYps0sOiK9m0hFZnK+ad
	jmnmm9Dxj+FSE8J8qoU+UmePBW5KPVYvmcP8fTC4LRbuAzTLjxXY93AdMPD+nc9N
	ruqGIO9uQm9THfJOIqrpGWo+t6MxdM9j8z2ZibZcyldDLR5cqi4wdk9LwU00eHIi
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4cuh5wkdqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Mar 2026 12:38:27 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 62CGcQak009191
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 Mar 2026 12:38:26 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Thu, 12 Mar
 2026 12:38:25 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 12 Mar 2026 12:38:25 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.44.3.82] (may be forged))
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 62CGc8GY021063;
	Thu, 12 Mar 2026 12:38:18 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Thu, 12 Mar 2026 17:38:04 +0100
Subject: [PATCH v2 1/5] i3c: master: Move rstdaa error suppression
MIME-Version: 1.0
Message-ID: <20260312-ad4062-positive-error-fix-v2-1-1c933b5c7ed8@analog.com>
References: <20260312-ad4062-positive-error-fix-v2-0-1c933b5c7ed8@analog.com>
In-Reply-To: <20260312-ad4062-positive-error-fix-v2-0-1c933b5c7ed8@analog.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li
	<Frank.Li@nxp.com>,
        =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Dan
 Carpenter <dan.carpenter@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Jorge Marques <jorge.marques@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773333488; l=1617;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=k5d2D92jeaLhYWwICwnl31VS8E518jAAEp+IOyu6hgM=;
 b=9dF8oVRn6wzSHTCElJaG87piYIiBZzxjyzDu/aavhb8BPFJDXrwey9ZcBdBAzsnV/fX0iA+vE
 zxMPrK6NBx/CEHWKsKxab9EgITPcQI3r/+G0G3l9Nf3iWLVPzaUhZ88
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEzNCBTYWx0ZWRfX4PbCcdm1SkVL
 kHMpv7yxR95fdGOSXoJJNKvqBFa/NGZGCgEH+9oinTAqov2g00C9/pdE2FIQRMlJuso71IM5a4H
 EdaCXHgn+qU7lK8E/TqEsUwOjVOp2bpdmArZWDstVbkEctGcM9pv0CedZ1dUL6r2l+Kgc68TCVu
 DJDuelNwAolh8MZ/dUbnpHQlY8hX8OHDP5FHsPlrrIBVvV1kqTHTpQg4+bSL7cZCw2e9jVX6q7n
 P/MI+ubU7N52x8+2AW5aGRGKsK9KPCStkrw3ZD8jnYK3ew2aot6Sg6gkkarebpPWopTYaB/6grI
 PdC8T/qSw0KuLQBeUO7vVD9s08IbLjmd3/ijw3Cyae7ng+KMWVHrCGOUgBsd586J8OiIjhOLeB3
 N+bSb0zWM7maz1VytyfAjVDlq+Xw2RB3e0XxD29Ztloi4QMCzu+WinXzy+2HJezuxuRy+inFiLs
 xe1bJBtZCa7s6jyGZtg==
X-Proofpoint-ORIG-GUID: bGf4YKQ2bNpnjLU6i7FzPkNQWBrPyEjQ
X-Proofpoint-GUID: bGf4YKQ2bNpnjLU6i7FzPkNQWBrPyEjQ
X-Authority-Analysis: v=2.4 cv=K+Qv3iWI c=1 sm=1 tr=0 ts=69b2ec03 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=gAnH3GRIAAAA:8
 a=jGnnJhjHKBc1zkP0xQgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_093840_803915_10500CBB 
X-CRM114-Status: GOOD (  14.39  )
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

Prepares to fix improper Mx positive error propagation in later
commits by handling Mx error codes where the i3c_ccc_cmd command
is allocated. Two of the four i3c_master_rstdaa_locked() are error
paths that already suppressed the return value, the remaining two
are changed to handle the I3C_ERROR_M2 Mx error code inside
i3c_master_rstdaa_locked(), checking cmd->err directly.

Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
 drivers/i3c/master.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 9e6be49bebb2c..c66f2655eb404 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1016,6 +1016,10 @@ static int i3c_master_rstdaa_locked(struct i3c_master_controller *master,
 	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
 	i3c_ccc_cmd_dest_cleanup(&dest);
 
+	/* No active devices on the bus. */
+	if (ret && cmd.err == I3C_ERROR_M2)
+		ret = 0;
+
 	return ret;
 }
 
@@ -1796,8 +1800,6 @@ int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
 
 	if (rstdaa) {
 		rstret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
-		if (rstret == I3C_ERROR_M2)
-			rstret = 0;
 	}
 
 	ret = master->ops->do_daa(master);
@@ -2093,7 +2095,7 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
 	 * (assigned by the bootloader for example).
 	 */
 	ret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
-	if (ret && ret != I3C_ERROR_M2)
+	if (ret)
 		goto err_bus_cleanup;
 
 	if (master->ops->set_speed) {

-- 
2.51.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
