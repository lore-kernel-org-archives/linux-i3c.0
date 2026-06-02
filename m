Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A22ACD6E4A
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Jun 2026 13:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n++csTLLi2EAHIoUh9ApAmwwredekV8FVmDmDFX55Yk=; b=rnmQJNAF7ychko
	Fb6F8WTgp8AVEKDvpHHfOCQGrFmcdhb6buL1ox2H4yKEp0HIe33Nnf8KrR975uLwhOQsgiRW9j/Rg
	VFWtm7Dc7dYn6hYAC3r9x+Eb1k08yE7rqU7W+Vql5qcHyzPvXeMyS9EIlREXlxEe5INdHImUfhT4u
	ljgXFwqZnkClM5SVWYbGhrOk0gF7rCmBAMgN/WbIhswmMFpEkWgbc3UlJuaaNeX5ZH/X+Is7gHCQu
	xMMGL/TX3FVGQTJpv74hNcBKLf+hnL0ufNxGGfUiwm539NMHSHgYJd2mTvb/ls9/IWvQmQ2vJMlEe
	z/TmzEhB8K1z2FWM0BXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPB2-0000000D7IH-1ZW6;
	Tue, 02 Jun 2026 13:29:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPB0-0000000D7HO-2xke
	for linux-i3c@lists.infradead.org;
	Tue, 02 Jun 2026 13:29:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 56D7443790;
	Tue,  2 Jun 2026 13:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D117C1F00893;
	Tue,  2 Jun 2026 13:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780406942;
	bh=oYMOrxgRJMWSL8TQv7hQo8EwvU2bnk7SM1kv7Y62O6Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MSO0Uo1f004DvILS7nrFuA1dvjTlttKNR0UToOdSXhXOSmB+Jl99Tvn4lapxBXglM
	 BfUklN3KwDgq3FmBnr3GjPRzSx72L+eyiNfMW3sreUIJiN8lp+bun9e1DuD5yn8ZiV
	 LYXzJySaEOhHOQdoVcL8NjT4Au9ssXA/xfNUXrzF1m2bFm60QLtCRXVXBKsbxZMCzg
	 sDxB7L99LjpfEaXGq/TychYjP+OAUcPYJIy1Ob/OTBmWKmRV1/aBtnAK/M70r+MEup
	 6S3R/U2xiXM4bthVfM3k4NgAxwIo8ZnJGPrGv2jGqSk3k4w8LUYi5ZGNpnVLYCNj3B
	 18ORIoRy9WzWg==
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 08/17] i3c: renesas: Clean DATBAS register on detach
Date: Tue,  2 Jun 2026 16:28:15 +0300
Message-ID: <20260602132824.3541151-9-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602132824.3541151-1-claudiu.beznea@kernel.org>
References: <20260602132824.3541151-1-claudiu.beznea@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_062902_769165_59260B65 
X-CRM114-Status: UNSURE (   8.51  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The controller uses DATBAS registers on TX/RX logic. Clean the DATBAS
register for the detached I3C device to avoid issues.

Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- collected tags

 drivers/i3c/master/renesas-i3c.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index de09f0cadb72..7167ca12a328 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -964,6 +964,8 @@ static void renesas_i3c_detach_i3c_dev(struct i3c_dev_desc *dev)
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 
+	renesas_writel(i3c->regs, DATBAS(data->index), 0);
+
 	i3c_dev_set_master_data(dev, NULL);
 	i3c->addrs[data->index].addr = 0;
 	i3c->free_pos |= BIT(data->index);
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
