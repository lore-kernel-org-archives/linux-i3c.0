Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A57CD6E57
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Jun 2026 13:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v7QcWAHHxwilxg+e3JXTX2A77wbwTnnfPlqnGvVFhck=; b=zMx2LtHDhrwGzh
	Uq6B/HGq6PMARTQwqeeg7ICJ11yd+/xvbRSNtqnDk6z1AHcwQ6k7n/Tu3uOFcmDQikSexVafMV0u5
	7lw/EPY8K5GRy9F6VvuhTZKQqAyVz2P0NuUxTb13X+5QKM5WHcrfYiXHspNYbySg06xzNej8OxNwa
	mRBefm8vbIo21mGQLZSZvFIKrXV8Vh1gA67QF9RfUdO9r+yqb43cIchCZnHrqbqOPwSwJ9l4Ha7to
	lSgsaJ68bX/RmvhmN+1l7O1/DET8SsGQLSvxGbJfA5IDimp7jCN/a4LBazFVsg4Q4NniPEGr5GBpc
	tg/CsmytcRCaIdQwm3Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPBM-0000000D7R0-0KUB;
	Tue, 02 Jun 2026 13:29:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPBJ-0000000D7QJ-3D01
	for linux-i3c@lists.infradead.org;
	Tue, 02 Jun 2026 13:29:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C00343B7F;
	Tue,  2 Jun 2026 13:29:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6D7B1F00893;
	Tue,  2 Jun 2026 13:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780406961;
	bh=Yqb9F/SWFWyaQnxe0OzvdBZA32dRT3tLYVEuPNodHio=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hFPYWc4LeJwPLS2JTnRAs/UngqDwkxitPxQVJFnpsyNxSKeOQeBI/OUM38moSqGue
	 3Azlcivj8fPmje+GkhMHLpHoxV2JqjgszdQbjknTNEVTjjUzR3cclQ4tL/1GrC8/0J
	 K7/hYyJVvJHMe1+lPOc68QxDiobptbGy+BY/59I3LeCfooc8H+dFuCTKwdGxm1fFxg
	 1zprK0Pw8MJStYV5DBbFwgVy61IB9jdDCAWu4Zj7A3X5WPIxkvt17KVv80akkaPAMK
	 8h5feRHOSXvVZurWBsNrHxeROZkYkxehgulIMrSqrl7Bgsqm250S7/rTABvvOMFu6t
	 DmvrQy0l35muA==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: wsa+renesas@sang-engineering.com,
	tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 15/17] i3c: renesas: Use the "dev_name:irq_name" format for the interrupt name
Date: Tue,  2 Jun 2026 16:28:22 +0300
Message-ID: <20260602132824.3541151-16-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602132824.3541151-1-claudiu.beznea@kernel.org>
References: <20260602132824.3541151-1-claudiu.beznea@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_062921_825673_2333B1F3 
X-CRM114-Status: GOOD (  12.07  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Use the "dev_name:irq_name" format for the interrupt names. This makes it
easier to identify interrupts in systems where multiple devices may request
interrupts with the same name.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- collected tags

 drivers/i3c/master/renesas-i3c.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index e1aa445de933..1ccd1c4ea27c 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -1450,12 +1450,19 @@ static int renesas_i3c_probe(struct platform_device *pdev)
 		return ret;
 
 	for (i = 0; i < ARRAY_SIZE(renesas_i3c_irqs); i++) {
+		const char *irqname;
+
 		ret = platform_get_irq_byname(pdev, renesas_i3c_irqs[i].name);
 		if (ret < 0)
 			return ret;
 
+		irqname = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s:%s", dev_name(&pdev->dev),
+					 renesas_i3c_irqs[i].desc);
+		if (!irqname)
+			return -ENOMEM;
+
 		ret = devm_request_irq(&pdev->dev, ret, renesas_i3c_irqs[i].isr,
-				       0, renesas_i3c_irqs[i].desc, i3c);
+				       0, irqname, i3c);
 		if (ret)
 			return ret;
 	}
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
