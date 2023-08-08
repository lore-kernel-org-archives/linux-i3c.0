Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C53C001DE
	for <linux-i3c@archiver.kernel.org>; Wed,  9 Aug 2023 22:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lBAto0T2DsTqNIPkXnx6pH3yrhIYNTOfmkVV+lshrtk=; b=cggUDsDZz2mNIo
	ZOk9zoNCxZ6E8W3qlxLqTnzKsDbWie4rjtWQ0rIATUrn7jORZunSFlyVGfBTbFkbZCyEOZ+9P909R
	ysz/WwIKRoLkDc+CyP4OhGUk0/L9WxMk4DYi25tVAZWtphASXmEII4DTeEMcFGql07a7aqutt8BDP
	54Hv5u9UioQ+M4O5Sn1zR/prsImxUOIxnASOp59MY42h2rLWBtThTWVefD5ZpjAVZr5u5/Y6nKZiz
	mvBZlobX+QMNQlnfB7dXXGcRGILqxFGceAZGfkw0W6x9NNPBJijafE7YMbxRZLjzl6P9xsZkTlJWy
	LQUkWU8NZePTCcIReY/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTrlS-005znd-0A;
	Wed, 09 Aug 2023 22:34:50 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX03.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTOrB-002pVw-03;
	Tue, 08 Aug 2023 15:42:52 +0000
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX03.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 8 Aug
 2023 23:42:45 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Aug 2023 23:42:45 +0800
From: Dylan Hung <dylan_hung@aspeedtech.com>
To: <jk@codeconstruct.com.au>, <alexandre.belloni@bootlin.com>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
	<p.zabel@pengutronix.de>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
CC: <BMC-SW@aspeedtech.com>, <kobedylan@gmail.com>
Subject: [PATCH 3/3] i3c: ast2600: Add reset deassertion for global registers
Date: Tue, 8 Aug 2023 23:42:41 +0800
Message-ID: <20230808154241.749641-4-dylan_hung@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230808154241.749641-1-dylan_hung@aspeedtech.com>
References: <20230808154241.749641-1-dylan_hung@aspeedtech.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_084249_069951_C300A240 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Wed, 09 Aug 2023 15:34:49 -0700
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

Add missing reset deassertion of the I3C global control registers.

Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
---
 drivers/i3c/master/ast2600-i3c-master.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/i3c/master/ast2600-i3c-master.c b/drivers/i3c/master/ast2600-i3c-master.c
index 09ed19d489e9..5d9d060134e0 100644
--- a/drivers/i3c/master/ast2600-i3c-master.c
+++ b/drivers/i3c/master/ast2600-i3c-master.c
@@ -11,6 +11,7 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/reset.h>
 
 #include "dw-i3c-master.h"
 
@@ -128,6 +129,7 @@ static int ast2600_i3c_probe(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	struct of_phandle_args gspec;
 	struct ast2600_i3c *i3c;
+	struct reset_control *rst;
 	int rc;
 
 	i3c = devm_kzalloc(&pdev->dev, sizeof(*i3c), GFP_KERNEL);
@@ -156,6 +158,13 @@ static int ast2600_i3c_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "invalid sda-pullup value %d\n",
 			i3c->sda_pullup);
 
+	rst = devm_reset_control_get_shared(&pdev->dev, "global_rst");
+	if (IS_ERR(rst)) {
+		dev_err(&pdev->dev, "missing of invalid reset entry");
+		return PTR_ERR(rst);
+	}
+	reset_control_deassert(rst);
+
 	i3c->dw.platform_ops = &ast2600_i3c_ops;
 	i3c->dw.ibi_capable = true;
 	return dw_i3c_common_probe(&i3c->dw, pdev);
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
