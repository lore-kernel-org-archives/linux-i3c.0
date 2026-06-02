Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C6CDCD6E60
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Jun 2026 13:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZDVouzX04gB1bHx3IZq0XzQPdocEKZZ90AXMAb9ssm8=; b=Yhhj4pE9fy6sJI
	kiFmLp8oB/KndzxY+DodhZeRCXlnz4f5qFpiZe7VwMV+xtRPa1UtwN+tjzxHfvYdpbV4lLaTdiIyy
	zvjy2nABSIJvOUhaq7tLEYA+VFxir2O30zMPK8XB5h/hdxck4YIqw5kDqpbSFUt911jc0w7N0kySP
	s021k4e51LXic04CQY5UrlnmxcqO19OjVBCkPUsZAba9iGTc0MnmeR3k5y+FZprIWP62dccdhjyxS
	J7ie/Z9Jz98mohXEYGSRTjN0HRNKKWBTXZlX7QINKPxOsjiyBFMcIwOXR6FjDMWbzHi6zZXKVXKQW
	8YeTRk0opPqshZjZX+/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPAz-0000000D7Gl-1KCH;
	Tue, 02 Jun 2026 13:29:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPAx-0000000D7Fr-3Dvw
	for linux-i3c@lists.infradead.org;
	Tue, 02 Jun 2026 13:29:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C748409C1;
	Tue,  2 Jun 2026 13:28:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07B151F00898;
	Tue,  2 Jun 2026 13:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780406939;
	bh=7/ANmW8xMeqtj8v82T2dps0zvcqGIwe6OGsGwbvUozQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XNII7hWKd+0edWhj4oLzEQ5fnh0lOaU1PIQ9pvQ3HOdRgOVDokYBmj2/zOjDzv+3J
	 pzXpbJU7KbU2jqaTmzhW4s7rEA8qN+LJ2b6SnbeHDNgN+I/LwP8E0gdaguDvYPGAv+
	 tuV6VgW218nuNdbY4aTaElZZaUPnGBW39w3rMq/HHAcPKn9tnuvZyEMF+TpJLdRPSg
	 uHlFMKVghSprn2MSs4hgHuDwk+yeLZbubrvq9FQYMr1JiU4ImmnHNeNUcw1BdcMCO5
	 Z2gDnV5Cl9uFVDwYeVx092F5A7YK3MNln5Ry8AbfEwV9Uv9oJt6QSFPiYC0573QpZP
	 3F+xnId/Q7A/Q==
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
Subject: [PATCH v2 07/17] i3c: renesas: Do not attach devices if xfer failed
Date: Tue,  2 Jun 2026 16:28:14 +0300
Message-ID: <20260602132824.3541151-8-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602132824.3541151-1-claudiu.beznea@kernel.org>
References: <20260602132824.3541151-1-claudiu.beznea@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_062859_827734_AA0242CD 
X-CRM114-Status: GOOD (  12.11  )
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

The controller may return an NRSPQP_ERROR_* error code while still
providing a valid cmd->rx_count. It has been observed that when the
transfer fails with NRSPQP_ERROR_ADDRESS_NACK, calling
i3c_master_add_i3c_dev_locked() may lead to crashes. Set newdevs to zero
if the transfer failed.

Fixes: e7218986319b ("i3c: renesas: Add suspend/resume support")
Cc: stable@vger.kernel.org
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none, this patch is new

 drivers/i3c/master/renesas-i3c.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 695aae6ac263..de09f0cadb72 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -727,8 +727,13 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 
 	renesas_i3c_wait_xfer(i3c, xfer);
 
-	newdevs = GENMASK(i3c->maxdevs - cmd->rx_count - 1, 0);
-	newdevs &= ~olddevs;
+	/* Skip attaching if there are failures on the xfer. */
+	if (xfer->ret) {
+		newdevs = 0;
+	} else {
+		newdevs = GENMASK(i3c->maxdevs - cmd->rx_count - 1, 0);
+		newdevs &= ~olddevs;
+	}
 
 	for (pos = 0; pos < i3c->maxdevs; pos++) {
 		if (newdevs & BIT(pos))
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
