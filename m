Return-Path: <SRS0=CE6j=UF=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00733C04AB5
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Jun 2019 14:00:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9A7220652
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Jun 2019 14:00:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o1bvS797";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OvWqhG7D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9A7220652
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=D/EyyLZ/2vwPUGem6AnLLBPCaIeFMFdV4ZwCVg18LO8=; b=o1bvS797gfF9XVi51XAIO8YvQv
	136UAIS3qgT5BIez7xrDkHA6Jg6pAXz34zl3iCv0aREluMnZQsUS7KZQCCqt6JBqqdJRFOVhtV7YG
	AuCcOU/ojF9oBdT8fBW57C5DGFn8npuWcQ3mG8HLQqaPk/nMY5oNRv4XwLdWmu+AQLPHR7RRtvU6b
	yiGqvy1uriEjbqyjJClqPj+NeWd6GcodtnD2HbH/jeqZXxVqnw1Exq2khr73afrL+16T1R/vvkwDE
	NPxUU6+8mBufjyJmRCRoruriN7glOC6X3rG97dwoEOIJKkHec4l07leSOydvqT+VdJBpo90Rj6kr/
	RHhWdryg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYswC-0004b1-DX; Thu, 06 Jun 2019 14:00:16 +0000
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYswA-0004Ya-1M
 for linux-i3c@lists.infradead.org; Thu, 06 Jun 2019 14:00:15 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3A3BFC0BA1;
 Thu,  6 Jun 2019 13:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1559829590; bh=KvCwUMSc/ssxfCEfFG115Dj1KyU+yGJ4OOCQiO1T/DE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=OvWqhG7DC9kXTDHWRl+4vDmhLV4ibiqfp+y2yR8GqyZxR/1NvCUiXNvYYiwcG8RQS
 d//2ochfyTZEAkrqqtXH0p+5EZxHOyKHzKiyD09EYrZybMkmIUMxVxRlzCY6xqcj1H
 m19wSlHmuO6Grg5rHekpX0v9aXffekWNoEAgb7aogeAuatF6q4VpzuxiyMY0evC3yk
 Cl9t5mX888hhdRhNjkoh5GfND26J67g6H3WP0VzTjkRbnmbnZuntMIwjIEkE43OZF4
 RWLeMlW7L/1jQOtM0OFZvqLgb1JMMSVRNzUxSo4/2XuVsVPlf4O0Id7TrQbgnxcjt4
 mwa8e00H1m3Hg==
Received: from de02.synopsys.com (germany.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id E7E1FA005D;
 Thu,  6 Jun 2019 14:00:09 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id D6F4D3F6D4;
 Thu,  6 Jun 2019 16:00:09 +0200 (CEST)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: linux-i3c@lists.infradead.org
Subject: [PATCH v2 3/3] i3c: dw: add limited bus mode support
Date: Thu,  6 Jun 2019 16:00:03 +0200
Message-Id: <5d0fe045c9a557f24f76a01d1066de2831b8489f.1559821228.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1559821227.git.vitor.soares@synopsys.com>
References: <cover.1559821227.git.vitor.soares@synopsys.com>
In-Reply-To: <cover.1559821227.git.vitor.soares@synopsys.com>
References: <cover.1559821227.git.vitor.soares@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_070014_078630_98441A56 
X-CRM114-Status: GOOD (  10.38  )
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
Cc: Joao.Pinto@synopsys.com, Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel@vger.kernel.org, Vitor Soares <Vitor.Soares@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

This patch add limited bus mode support for DesignWare i3c master

Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: <linux-kernel@vger.kernel.org>
---
Changes in v2:
  None

 drivers/i3c/master/dw-i3c-master.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 1d83c97..9612d93 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -599,6 +599,7 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
 
 	switch (bus->mode) {
 	case I3C_BUS_MODE_MIXED_FAST:
+	case I3C_BUS_MODE_MIXED_LIMITED:
 		ret = dw_i2c_clk_cfg(master);
 		if (ret)
 			return ret;
-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
