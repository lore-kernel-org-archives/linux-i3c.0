Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE0FCD6E57
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Jun 2026 13:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W8JlJVnTiNKXTmd8Wr4Vura/FOj2s1kwprfWpr+6roo=; b=qIxteSWOkxQtBl
	lnX7oi7irC+ZlUhEL2KRzbZBeBUTVtbR7JkEIf8/0MxogBG3TN2Qu25AhbaM1lL8hL/woonweUG1a
	lq6soDEcnHwspupta2HT0wVlFeUb5yZZGCrbRYwyOfljc7vWZ4BdHf/ZEPgBttO97Sg9J+1p8Nz6s
	pp8wAYSB5hLccBD6D7wSt9hvGhGno8WAVwQ8xvj7TB4TUXnt4SXN4jkgGj966bciMDEfcg3tnlSYj
	TpPavo88N9cU1MngaekJqupNhn+FVAumOPs5Ge3Hd3Dyk/RrSosG4lqyHMZ1LJouK6xKVfakYNL9r
	Cqqud1tXtenGlv62r9/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPBP-0000000D7SC-0hTu;
	Tue, 02 Jun 2026 13:29:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPBM-0000000D7RC-2N0z
	for linux-i3c@lists.infradead.org;
	Tue, 02 Jun 2026 13:29:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 354A8407D8;
	Tue,  2 Jun 2026 13:29:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D11441F00898;
	Tue,  2 Jun 2026 13:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780406964;
	bh=fZeedrLja92Z9bJCdVwk9qz/J7YvmgIy9rqBGdrsA7s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lV6zGYbnizZzhYeohQ7Oz/RiL3Ypwel0r9t64N24yaHkqw8TolUQzN4AFDW3ncy7V
	 CQyBDC9SbFkIMuJ8Zle5kM6EmqMc64fawG8zVoY7gUYAvoW4Xuy0bLBUY/B9wnsv5t
	 LVgsUuP/i9SWmZweFcnWU5ldZQRJwzUSUfRszqj5WCnQ05l3Z6yE559M2SgZ7wq+oi
	 QNH8t6GJyFtjN3wBgRuwlBJLoO8Ph73H4F9Lf1zLRvH9m3ajHCwSZQ0xP0rYp+wzDy
	 GLLVfqsfdQqU7fsNMv3t1zLNUxvV4NtMLRPM/55W2/SqDLQIesmHJvZt3AmWMYbNIV
	 9Gu32pExmyZPQ==
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
Subject: [PATCH v2 16/17] i3c: renesas: Drop unnecessary tab
Date: Tue,  2 Jun 2026 16:28:23 +0300
Message-ID: <20260602132824.3541151-17-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602132824.3541151-1-claudiu.beznea@kernel.org>
References: <20260602132824.3541151-1-claudiu.beznea@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_062924_627041_BB7864C7 
X-CRM114-Status: UNSURE (   9.02  )
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

Remove an unnecessary tab to make the code cleaner.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- collected tags

 drivers/i3c/master/renesas-i3c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 1ccd1c4ea27c..2a9bb035b8a2 100644
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
