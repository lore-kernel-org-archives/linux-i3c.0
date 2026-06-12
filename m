Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18040CD98D6
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jun 2026 16:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SzqjsNs/TvYYPqq8gSo21h+imHcGAZ5qVx/cu++MG/M=; b=1EhRaprljTJyl7
	rXvdGoDyfohUJklp/aH772CevdGy6JTGtZaggmgVF1wuJ8vvfpGaFGFrAb009/d78dWBN1fpdBsO6
	rpgiyYQ/8A2QLr0iKUl3uvlT3jC9GCwGkrPTRTCqUqoSTqf3XUkWPTzwGDIp6k/edeiuSNV5uX4mf
	8MhNMriRV/OYRJy3lYlhqkbsCUPHfUuUEWETn0xnlfmqAtM3N3PA9AVNF7orI/tOBlQqS+Pf8jbMc
	X2rcYJy1gRu4bGhm1QWRsOizcukugyn/xxc/gEMA/H9ChL/ZE6v7FA27JXabqsV2UJt3H4SSIerD6
	JgstK0yDImFbFmRYJl5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4OC-0000000BCwz-3VSD;
	Fri, 12 Jun 2026 16:05:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4OC-0000000BCwR-0h5F
	for linux-i3c@lists.infradead.org;
	Fri, 12 Jun 2026 16:05:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B4CE6008A;
	Fri, 12 Jun 2026 16:05:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 074771F00A3A;
	Fri, 12 Jun 2026 16:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781280347;
	bh=yQuLQ0wKgVv11O8PtVq89P419k6GO1eJURY019VGMjY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=J0FAIoDiQ/TGWErEyKw4EweVtNP+0QILaakKtrHKDFbIP+pE/YViE9YyiMogN+SRV
	 +m6EbzewDEP7bJ+ua9lDivTDQ+01UY3OMLl5E+mN25x5k+MmZ8iBBzOJ43Gqs4Bg7e
	 S1v3Lnh6JtB+11LC2IT3sTHMXwHZFeCK0sODAAVZU0nI82UsKC0NHCa1wOs4O6GRf9
	 AbZdwgOGnXaPk9x3hX+kf+ZTEjshuqE11Ir2JKv/7qTTxaEf/XvW/ycu9sqlVg/w1o
	 nSC8/TxHQv1ZCIHYx7wCsIcabd2a71Tt9oJzxdbZ9MHSxTUL82UiM1UKhVq/C5D+as
	 DA/wlyDfXRB9g==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: wsa+renesas@sang-engineering.com,
	tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 15/16] i3c: renesas: Drop unnecessary tab
Date: Fri, 12 Jun 2026 19:04:57 +0300
Message-ID: <20260612160458.3102106-16-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612160458.3102106-1-claudiu.beznea@kernel.org>
References: <20260612160458.3102106-1-claudiu.beznea@kernel.org>
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

Remove an unnecessary tab to make the code cleaner.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- collected tags

 drivers/i3c/master/renesas-i3c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index a5384c0f71e3..1bed2304b5ee 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -109,7 +109,7 @@
 #define  NCMDQP_DATA_LENGTH(x)	FIELD_PREP(GENMASK(31, 16), x)
 
 #define NRSPQP			0x154 /* Normal Respone Queue */
-#define  NRSPQP_NO_ERROR			0
+#define  NRSPQP_NO_ERROR		0
 #define  NRSPQP_ERROR_CRC		1
 #define  NRSPQP_ERROR_PARITY		2
 #define  NRSPQP_ERROR_FRAME		3
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
