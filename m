Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5398C4332F
	for <linux-i3c@archiver.kernel.org>; Tue, 14 Nov 2023 08:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hZ7CO37zbyxE6LcAQSOUpVqa61oHt13KqZZfK7sWO/g=; b=cABCJyKgh/zaRh
	MojiqVK2FZztxMn591KetoikZGYuyP4FSX5mqTyCWCzR6ZWvJUopY36xCDPjMfvHgoi4r7MJ8XdY/
	UbAI64ypbZ56K2GbGUvgJrEG5nhdOMDDLdExhIuihZ9bGDuh3Q6VfH9EwINmNI58QSkj2PdqYMQ2p
	7BuB0LC+fFAFbC+hoStlIcoCBV15WRZZ6a6s/UA5dkkrSWFY2yUjCK5Im0mwb4CSSt2QTCXRTum9m
	C0NYlQ86vsplOnGMdpD63kuoD6isCnB1DZERLdlUGwH13fxUR38fgWmpxSRDALlJpKSBAtoLnCZZQ
	Ba6k1iiEKhsVB56QVlFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2pDp-00FR6W-2D;
	Tue, 14 Nov 2023 08:56:37 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2pDm-00FR4o-2c
	for linux-i3c@lists.infradead.org;
	Tue, 14 Nov 2023 08:56:36 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id D2F628143;
	Tue, 14 Nov 2023 16:56:14 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 14 Nov
 2023 16:56:14 +0800
Received: from localhost.localdomain (161.142.156.149) by EXMBX066.cuchost.com
 (172.16.6.66) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 14 Nov
 2023 16:56:11 +0800
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: <alexandre.belloni@bootlin.com>, <miquel.raynal@bootlin.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Joshua
 Yeong" <joshua.yeong@starfivetech.com>
Subject: [PATCH v3 1/1] i3c: Add fallback method for GETMXDS CCC
Date: Tue, 14 Nov 2023 16:55:25 +0800
Message-ID: <20231114085525.6271-2-joshua.yeong@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231114085525.6271-1-joshua.yeong@starfivetech.com>
References: <20231114085525.6271-1-joshua.yeong@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [161.142.156.149]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX066.cuchost.com
 (172.16.6.66)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_005634_998955_7DFAED26 
X-CRM114-Status: GOOD (  14.28  )
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

Some I3C hardware will report error when an incorrect length is received from
device. GETMXDS CCC are available in 2 formats: without turnaround time (format
1) and with turnaround time (format 2). There is no mechanics to determine which
format is supported by device. So in case sending GETMXDS CCC format 2 resulted
in a failure, try sending GETMXDS CCC format 1 instead.

Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>
---
 drivers/i3c/master.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 95caa162706f..718b643cb54d 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1130,8 +1130,16 @@ static int i3c_master_getmxds_locked(struct i3c_master_controller *master,
 
 	i3c_ccc_cmd_init(&cmd, true, I3C_CCC_GETMXDS, &dest, 1);
 	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
-	if (ret)
-		goto out;
+	if (ret) {
+		/*
+		 * Retry when the device does not support max read turnaround
+		 * while expecting shorter length from this CCC command.
+		 */
+		dest->payload.len -= 3;
+		ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
+		if (ret)
+			goto out;
+	}
 
 	if (dest.payload.len != 2 && dest.payload.len != 5) {
 		ret = -EIO;
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
