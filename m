Return-Path: <SRS0=7s5Q=OP=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68178C433F5
	for <linux-i3c@archiver.kernel.org>; Sat, 25 Sep 2021 19:45:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24205610A3
	for <linux-i3c@archiver.kernel.org>; Sat, 25 Sep 2021 19:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 24205610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZrfeEM6usyJHCZbsXmGv+WZu/EKXY5TIXGFhPsbusho=; b=NrnZfy/FSoMWfj
	jTmmNtHJ0azDwqusKdcp72ZWM5c1Bn7qCPtkmUOzY/Y/BmeBETPrAWVP5fWeAKrsPau1yLbH1FS23
	2GE/258A+b4hzn3Bobto3gmMYAzPD9ysjF1vwDFCKn4XaDahVkqOEz0gkM5283Kyf55J6oXc9tjtI
	BcX/+ZBZBzKoKpNFswojhq1e9isBXR8BcTe7IEQz4nCZStH055TuLnjpXQEBCnfOrnKm0Xn5C9MN2
	Cdz5Tmu4rCQrmW71XNNlbb0kka54RCeJCcJdyWo2kDQjegsLiNNBf5APWrv5kx5tSh2ys58ftk7PL
	9Dmg8rPx0DCmcIdhiQDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUDcC-00H8mR-4K; Sat, 25 Sep 2021 19:45:40 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mT5Xq-009BR3-Hw
 for linux-i3c@lists.infradead.org; Wed, 22 Sep 2021 16:56:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1632329790; x=1663865790;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0rwULtsWnvtgTD/VVdeTWeyUsKn1btt6tp940PoyGv8=;
 b=runESxqDPck4F95erSc656LyUwW7hmFiuNi1h9YQn1su8OD4Ob7f0/yn
 /FFtENkWUsOfLdT7W68Gt0ewVWxKRjrieGEOlV1wZB2Its9w94Oqs/qLb
 v0CBmrqklbBv4sxmhCA4LP1L+gT2rwAAKh1POsnzG8lxaPsF943ShbQHj c=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 22 Sep 2021 09:56:21 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 09:56:21 -0700
Received: from localhost (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Wed, 22 Sep 2021
 09:56:20 -0700
From: Jamie Iles <quic_jiles@quicinc.com>
To: <linux-i3c@lists.infradead.org>
CC: Jamie Iles <quic_jiles@quicinc.com>, Boris Brezillon
 <bbrezillon@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] i3c: fix incorrect address slot lookup on 64-bit
Date: Wed, 22 Sep 2021 17:56:00 +0100
Message-ID: <20210922165600.179394-1-quic_jiles@quicinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210922_095630_699608_F478C950 
X-CRM114-Status: GOOD (  12.33  )
X-Mailman-Approved-At: Sat, 25 Sep 2021 12:45:38 -0700
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

The address slot bitmap is an array of unsigned long's which are the
same size as an int on 32-bit platforms but not 64-bit.  Loading the
bitmap into an int could result in the incorrect status being returned
for a slot and slots being reported as the wrong status.

Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Jamie Iles <quic_jiles@quicinc.com>
---
 drivers/i3c/master.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index e2e12a5585e5..426027110a79 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -345,7 +345,8 @@ struct bus_type i3c_bus_type = {
 static enum i3c_addr_slot_status
 i3c_bus_get_addr_slot_status(struct i3c_bus *bus, u16 addr)
 {
-	int status, bitpos = addr * 2;
+	unsigned long status;
+	int bitpos = addr * 2;
 
 	if (addr > I2C_MAX_ADDR)
 		return I3C_ADDR_SLOT_RSVD;
-- 
2.30.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
