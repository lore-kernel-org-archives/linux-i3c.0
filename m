Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB2CCD8CA4
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 20:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=egRE5+M983MFZgunmkqjwVZAxgG/QjWsW+9QnthsReA=; b=TKNlB38s/kLcr2
	dnTu8LN7ZFHXVjVrDCbi17UqHaM8i+rA5OJriCRiHR9RfCWoEO3YE3+Gdj6Czqp12NlqDSVlYMitb
	MRR13z/DeTtF9IZk/y+59UOwGlcbqggA7Rbabd02L8vnetxno+82GQM4utOQr5hD+9SLT7uU5C4Kb
	lANEIixR0c73dI4T084AanjjW3msqUywH2v1y/Tt/HmTqB158O1bJTwVYtCqK4TO7KpKFPZPbfQs1
	chdKFSxU2cfT1XcT3uLxcMFNjh2VV5BdWgOJubt7LqK13f9iSOaSpByaNisq5Y20f+8O9kOK4Fbkg
	5ouHi6ywb4lGY7F7KMhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgOP-00000004Len-0iad;
	Mon, 08 Jun 2026 20:16:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgON-00000004Le0-0OOT
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 20:16:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7DEAD601E1;
	Mon,  8 Jun 2026 20:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED711F00898;
	Mon,  8 Jun 2026 20:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780949774;
	bh=8DwEabUQb8wfXA2VVFyZQt03TK3VL48HZ/2mhSICwYs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bWQ2Vg+GQo6IGi4Ux9QGzdDfiG9aeON13wDRgcpLM+Tzo9y3eRD/mh/zroZSUz4gB
	 xit8vFr6PU+ig0GFZKebCNJhcFfNiJmm+T0k+C0OZqq+VsyuxT0hCqt5PxBwKIMYo/
	 klWM/mzsBVL6Ap3xb/rREUJcB9jFeqm3q9YrNPckdvXxRDmk2xKRcKH1ORojaOQDXT
	 u4+D11UrJL1ynY84AHkg5orqrzvwCFoLRWFm4t/1hsFsucc/girvfknoZTddZYXRk9
	 r5sTmXMuq2kHvN+rm4CGDM/r5PNOOv19rofan1dneQ1+EUqPW8PR6OmEyMevuvLq/e
	 w+zPWvuobuOKw==
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
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 07/17] i3c: renesas: Do not attach devices if xfer failed
Date: Mon,  8 Jun 2026 23:15:33 +0300
Message-ID: <20260608201543.804902-8-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608201543.804902-1-claudiu.beznea@kernel.org>
References: <20260608201543.804902-1-claudiu.beznea@kernel.org>
MIME-Version: 1.0
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

Changes in v3:
- none

Changes in v2:
- none, this patch is new

 drivers/i3c/master/renesas-i3c.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index c475d30a84c7..f96848022c45 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -780,10 +780,15 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 
 	renesas_i3c_wait_xfer(i3c, xfer);
 
-	newdevs = GENMASK(i3c->maxdevs - cmd->rx_count - 1, first_i3c_pos);
-	/* Re-attach all the I3C devices on resume. */
-	if (!i3c->resuming)
-		newdevs &= ~olddevs;
+	/* Skip attaching if there are failures on the xfer. */
+	if (xfer->ret) {
+		newdevs = 0;
+	} else {
+		newdevs = GENMASK(i3c->maxdevs - cmd->rx_count - 1, first_i3c_pos);
+		/* Re-attach all the I3C devices on resume. */
+		if (!i3c->resuming)
+			newdevs &= ~olddevs;
+	}
 
 	for (pos = 0; pos < i3c->maxdevs; pos++) {
 		if (!(newdevs & BIT(pos)))
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
