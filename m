Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C35C4725D
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Jan 2024 05:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/zbOEB8Np2iZXuVQ/aHL7GyBV60tnFIfhh+Omm2XeMM=; b=CMpzrAjT0fPXgt
	mtyoTRwvXoP9zAu/oCuM3Iby9+jQdXr5X5wr7i3HZWtXWInZJHwaiv5Ld53JaEuXXo1ZlXpSu/cPs
	wiRFqdK4SUhm3AwyNuOUzziVm0D/UHhO+UFExG+RFMbEqMxdwlIOFAs51zK+DU3S34Xp0/Ug5sb2R
	IxcbkpReiD0sBkP0eTIv04NlUPPvYiB0v+w+aux0FXJrY++FeXC92GaBUsI3z0YLa2SbM6MLnbM2a
	+SI/sT+nNSbNYiEi+uYIaaPuFv0UJC18XK8goC1ZuGRHL3J86rXnDVL6pq19f1i4rbDGXdT3QGBp9
	+mfJzqwyImD08fzkE4pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQhhg-004X9y-15;
	Fri, 19 Jan 2024 05:46:08 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX02.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQhha-004X9W-1I
	for linux-i3c@lists.infradead.org;
	Fri, 19 Jan 2024 05:46:06 +0000
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 19 Jan
 2024 13:45:49 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 19 Jan 2024 13:45:49 +0800
From: Dylan Hung <dylan_hung@aspeedtech.com>
To: <alexandre.belloni@bootlin.com>, <jk@codeconstruct.com.au>,
	<joel@jms.id.au>, <u.kleine-koenig@pengutronix.de>, <gustavoars@kernel.org>,
	<krzysztof.kozlowski@linaro.org>, <zenghuchen@google.com>,
	<matt@codeconstruct.com.au>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <BMC-SW@aspeedtech.com>
Subject: [PATCH] i3c: dw: Disable IBI IRQ depends on hot-join and SIR enabling
Date: Fri, 19 Jan 2024 13:45:47 +0800
Message-ID: <20240119054547.983693-1-dylan_hung@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: Fail (TWMBX02.aspeed.com: domain of dylan_hung@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=localhost.localdomain;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_214602_461595_AD701626 
X-CRM114-Status: UNSURE (   8.19  )
X-CRM114-Notice: Please train this message.
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

Disable IBI IRQ signal and status only when hot-join and SIR enabling of
all target devices attached to the bus are disabled.

Fixes: e389b1d72a62 ("i3c: dw: Add support for in-band interrupts")

Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
---
 drivers/i3c/master/dw-i3c-master.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index ef5751e91cc9..276153e10f5a 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1163,8 +1163,10 @@ static void dw_i3c_master_set_sir_enabled(struct dw_i3c_master *master,
 		global = reg == 0xffffffff;
 		reg &= ~BIT(idx);
 	} else {
-		global = reg == 0;
+		bool hj_rejected = !!(readl(master->regs + DEVICE_CTRL) & DEV_CTRL_HOT_JOIN_NACK);
+
 		reg |= BIT(idx);
+		global = (reg == 0xffffffff) && hj_rejected;
 	}
 	writel(reg, master->regs + IBI_SIR_REQ_REJECT);
 
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
