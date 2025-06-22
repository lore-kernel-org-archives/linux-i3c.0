Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7E3C7115A
	for <linux-i3c@archiver.kernel.org>; Sun, 22 Jun 2025 09:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hNVJ9KuCv1aWcE4OuqWragxTUy5NKOKkZ2ZdLTeHZiE=; b=gAqGFaT5/KF9O6
	GhMqq8BqhD/iDJ0eVEpmSZ+NlTK+yDlaxgkGFLYCiMjuYoVzANftwnSuW/YNtEB931Lu/r1Tfe7/K
	pfMJDygOQi2LziLVWHjgv5vIQgZxbF8IkRjO+qcH04jVBm/kwfTF5ul6TGJLiajNx782gSH76thlj
	stlOxzeXI3ro8nhnb3oItZ8jcWxWQVfaKA3Lb44PgGNBrYuHDGmcnimQw5nz3QM8+U5w9b38ZHv9l
	+TdI1fqFuAsyQjtBJvS1bhAoZN0Po1Nf8oAwoR3v4XcxLLzAsGfYWhqgBcTI1AGmQGNKuZstf8xrg
	Vdja8ZcJqR6yOJtK42dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTGts-00000000gEv-3bcu;
	Sun, 22 Jun 2025 09:22:08 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTGtq-00000000gE8-2mGZ
	for linux-i3c@lists.infradead.org;
	Sun, 22 Jun 2025 09:22:07 +0000
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55M528BI012266;
	Sun, 22 Jun 2025 05:22:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=HNtXL
	lkrbNK2ae+OChWznVZiy3xck+hIBQLK1M8aHhY=; b=Q0+59x/c8npg74NeDQWVK
	miUor0Gq+GhWu1Bp/CwchAsVBEbZWe6pRd12IPW7Lm3ydsBss0PZtuUBMf5YVwtl
	nqYT9hPensH1skZM/FqXXsUAEcSgMdZhWwu2wvHiZ31ge8hf110zbYa+4MNHj3fa
	67ft6zSNvjgqjTK3tUOt+lVKh/C6jf3SjR09ioYMX4lVuDIATcw3bSAgg+4jIimI
	yjZpPMTMwa5oDplxufth4x1fPqhVxYv8StMUfSYuqZuQV1IAVP4YTpBk/5vQdKzS
	fQQdPMyrZYsY4Be9QwpIAMz9Gd911nWW5xxgk2iNGAWvWRaJcXuerziH1KITqU4U
	A==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 47dsn7bkpv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Jun 2025 05:22:02 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 55M9Lkgp063097
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 22 Jun 2025 05:21:46 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Sun, 22 Jun 2025 05:21:46 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Sun, 22 Jun 2025 05:21:46 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Sun, 22 Jun 2025 05:21:46 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.32.14.29])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 55M9LVbB002307;
	Sun, 22 Jun 2025 05:21:35 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Sun, 22 Jun 2025 11:18:59 +0200
Subject: [PATCH v2 2/3] i3c: master: cdns: Use i3c_master_writesl() and
 i3c_master_readsl()
MIME-Version: 1.0
Message-ID: <20250622-i3c-writesl-readsl-v2-2-2afd34ec6306@analog.com>
References: <20250622-i3c-writesl-readsl-v2-0-2afd34ec6306@analog.com>
In-Reply-To: <20250622-i3c-writesl-readsl-v2-0-2afd34ec6306@analog.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li
	<Frank.Li@nxp.com>,
        =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Jorge
 Marques" <jorge.marques@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750583937; l=2213;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=G2ndV+MQ36l3fmzDtWBM3JUhQ84vhzEGz9R9pdPXqtA=;
 b=6UjcbzqVvZ0MDA4cGh0jcPXQMkgtWJsMgUAp+JZv9v77SFFVIcm377k5eSTqzJOERSVd3mqPh
 QfLJjktqYIuDRaZjM1SiujngWWbxWnDNvjmrFPUv9Alq74lV35J+yWW
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=GLsIEvNK c=1 sm=1 tr=0 ts=6857cb3a cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gAnH3GRIAAAA:8 a=wBeUhC9FeeX9q1_Bn2kA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIyMDA1NiBTYWx0ZWRfX5Kb3dTJYyylB
 iaWUEXH7Le0RO5rSgHaP3WA2wQPG96CEkE34ApdRht4SfoyvtFBjBkKM8qZMCqNOQ7f6UB/9a6l
 rIucK4pW6yPqDhREQyJqKcwr/dDSjlwNzcLBDiI70b+LMNIbQScenIkH1CebS3unxMyrJ4YZKYO
 6OhrbbRfEHIrKFw005bvZErgXppThkLhTUtoNr+ztvepVQ6+zQgGDyG9mdNp7orOWc3ymISo+v0
 /2WvzZYXE2zbDka0iRPMVWaYcAKhpTYJbpahm3rAWU8Fr7jowcVDcvaLUpjddXw4rLxw0l0047l
 DDMAFtx2zKLDQrn+xQ/AKOhrXUJxSN4odRI0Wts0HZMmEcIgDLfs71Et9MnUdjmx1HAdeuBNTop
 PMZBMCVFQ8AGIH4nXh/tpIUJKpvCRrZWJgSOAIEFIifYMBC3UTzaD9+y9ONairin/uqFn9fM
X-Proofpoint-GUID: MJ-2Q7Sa5SSomXW1FOY3EPwni_BTskM0
X-Proofpoint-ORIG-GUID: MJ-2Q7Sa5SSomXW1FOY3EPwni_BTskM0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-22_03,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 malwarescore=0 mlxlogscore=807 lowpriorityscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506220056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_022206_723040_269F13AA 
X-CRM114-Status: GOOD (  10.95  )
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

Use common inline i3c_master_writesl()/i3c_master_readsl() methods to
simplify code since the FIFO of controller is a 32bit width.

Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
 drivers/i3c/master/i3c-master-cdns.c | 25 +++++--------------------
 1 file changed, 5 insertions(+), 20 deletions(-)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index fd3752cea654954ed1e37337754e45fddbbbf68e..321c04d2109ec1951f2b07a9d1b88c6aaf055c95 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -23,6 +23,8 @@
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
 
+#include "../internals.h"
+
 #define DEV_ID				0x0
 #define DEV_ID_I3C_MASTER		0x5034
 
@@ -427,25 +429,13 @@ to_cdns_i3c_master(struct i3c_master_controller *master)
 static void cdns_i3c_master_wr_to_tx_fifo(struct cdns_i3c_master *master,
 					  const u8 *bytes, int nbytes)
 {
-	writesl(master->regs + TX_FIFO, bytes, nbytes / 4);
-	if (nbytes & 3) {
-		u32 tmp = 0;
-
-		memcpy(&tmp, bytes + (nbytes & ~3), nbytes & 3);
-		writesl(master->regs + TX_FIFO, &tmp, 1);
-	}
+	i3c_writel_fifo(master->regs + TX_FIFO, bytes, nbytes);
 }
 
 static void cdns_i3c_master_rd_from_rx_fifo(struct cdns_i3c_master *master,
 					    u8 *bytes, int nbytes)
 {
-	readsl(master->regs + RX_FIFO, bytes, nbytes / 4);
-	if (nbytes & 3) {
-		u32 tmp;
-
-		readsl(master->regs + RX_FIFO, &tmp, 1);
-		memcpy(bytes + (nbytes & ~3), &tmp, nbytes & 3);
-	}
+	i3c_readl_fifo(master->regs + RX_FIFO, bytes, nbytes);
 }
 
 static bool cdns_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
@@ -1330,12 +1320,7 @@ static void cdns_i3c_master_handle_ibi(struct cdns_i3c_master *master,
 	buf = slot->data;
 
 	nbytes = IBIR_XFER_BYTES(ibir);
-	readsl(master->regs + IBI_DATA_FIFO, buf, nbytes / 4);
-	if (nbytes % 3) {
-		u32 tmp = __raw_readl(master->regs + IBI_DATA_FIFO);
-
-		memcpy(buf + (nbytes & ~3), &tmp, nbytes & 3);
-	}
+	i3c_readl_fifo(master->regs + IBI_DATA_FIFO, buf, nbytes);
 
 	slot->len = min_t(unsigned int, IBIR_XFER_BYTES(ibir),
 			  dev->ibi->max_payload_len);

-- 
2.49.0



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
