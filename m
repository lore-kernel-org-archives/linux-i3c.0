Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5472C5B572
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Aug 2026 13:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eclRPU88L94wd0CJRLroQPppgzp9mioQAxiPq3zj4G8=; b=QHdzH8XulY6vIe
	WmudcJWFTuYVbkclILuwCSb1CISQFHo7OkdAKWKjvkOj4ZptTniH2ltok7u5mLyz5KqAtl9zm4hMV
	Ncwkd7PIah2/PehwONk4EYVp6RgTjh826mwD9ptyWlUa5lpF2c+pG6Bsfsfx03ISexhy+yzC6Pk/9
	bCEl/xU8Px32I2qUz0gsCG6ymStm4mNfRZMMJqfaV4+dYF+ERXUVfKBuA2LLnvMVBA7xO8qAXrMxI
	hqe3rv+Y/sIq65aaf4/luyuMfx3Gdi9s1qnYBxJYAFZo0Umv0qDcjH1xjjmrUU/nw606j7qx5rb51
	Nf92qYZo1XolhmotLahQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wus9E-00000002jgJ-1Z1q;
	Fri, 14 Aug 2026 13:40:36 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wus9C-00000002jfr-0CCw
	for linux-i3c@lists.infradead.org;
	Fri, 14 Aug 2026 13:40:35 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso617070a12.2
        for <linux-i3c@lists.infradead.org>; Fri, 14 Aug 2026 06:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786714833; x=1787319633; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MYY0ZppMV8SjlgzMBgbRNb25AoRNuZQE59rlaLfzn4s=;
        b=B6Qg9IamlqBOatOEthm/hAQBm73DVeroULWAQShnT9HC4sxWhnDSigabqgIVEOtVhW
         p6a9fJrpaMLkOWV4WlsDtDaE53LAkzG+ngTkzQp+BDo6on0iiGrqhm4duamob/Gldm3X
         N3aTX124VnyXB6p2SBHZc5uhuFcJNYuDHmDY1Z3YIvLVpP52CCuDxltu71gcUUnREyvA
         EsL7sm1JUzpwjQGroUS0uIveLesUbKFh3dDnOSgM6XebsCkhHbuieXUk1dzErO6LB7ZA
         6VFJf87P2Wltym2whFoGvg3VTZ1GuaLZa6duAqOT0Ak7WcOnR8LP1iTAo/8gKTIPEZEy
         vt8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786714833; x=1787319633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MYY0ZppMV8SjlgzMBgbRNb25AoRNuZQE59rlaLfzn4s=;
        b=BvWuB0KsGzuMGRzyR2ldCGTlA4xy5002zuBG75kW8m37GegaJtjG1819pvsLl0QcQH
         BGehnVsmb28VVirFaFxelKmONXll5UrDQ5rseqQ5ugpedE5Dq0SgGLUz0fVq2S1AIC7H
         ActRp/8PSYvb4fSZd86fsOb5pM6VrQ2geoAUGJpyyrbzwBb0MrtghEIN7a9+UujAsj/T
         HM74ZyO/uupkt7kC4o3N5yntDWfj7nG6HGp47RucLyvAGy3W+9+7IY/6aWCqXK8Z5Sw5
         QlATywK2RZ16EnRIDx9hTaJxaZCfzUWfeqk4DW1UuCzhFnrhr1DcBNf+DybCHylRKhBP
         /1qA==
X-Gm-Message-State: AOJu0YyVO58mK+mqy5dobJxDKfCT7fs5fw01ocxvjaElhS0IUNRTpWZI
	uCru4Q1mC373N4Y88Jzy3l9OPwMe2NUK2T6mGaVcZzjjWwXHstIlP/9h
X-Gm-Gg: AR+sD136CC2tVVJZee6hiVKE5a6AaTf6YyHpreOGA9/zJPlp4mN3hAtsO7xZlIP8DyJ
	oSavcAdWgsEUpk10smFIgrmF9b3Ix48a7UbyQlKCQuKq93byH3eaXl52xL633cmmjfDWvAOKcy1
	ibI32PLfLC5bAsobwjn40W+w2maGVAxG49caAskKLkgA877lVSYvb89YbVetABB1umTxS5gkgQv
	isET73QYKfOYgMIxjIPB+gs05gv/EXBm+zzQ0qiK1jIrA5Fj56j44geHGlIFcmmrlu9JXia5BEv
	TwHxCqEi2k3rH9v23nbcv1a0ly5UGKAJwpYo4GSBfoW7Q3kBUVbU7/+b2jGcZNPqixemZDMG/5b
	JbgnY6FurizFHDAJsLNf1FA248It5tEchx43XBFKRY5wxMs0PeFyv7aRmPAHdCOos56MRIOYPiY
	e8WPFH8PhWW+muGu2RsZF74nwCEmTC2tJm5U9GXpZh3ijeNyjCJ+eCpAIaLSebw4ywUnas+bLrh
	MwywlVEmt2At2We5YE=
X-Received: by 2002:a05:6a00:4fd5:b0:847:8650:69c7 with SMTP id d2e1a72fcca58-84fde521f57mr5562130b3a.21.1786714832956;
        Fri, 14 Aug 2026 06:40:32 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:e9af:7c0e:be31:2c3f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc095a20e79sm627049a12.20.2026.08.14.06.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 06:40:32 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] i3c: master: Release I2C boardinfo node reference
Date: Fri, 14 Aug 2026 21:40:27 +0800
Message-ID: <20260814134027.1386818-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_064034_090057_292ABB33 
X-CRM114-Status: GOOD (  12.58  )
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

of_i3c_master_add_i2c_boardinfo() takes a reference to each Device Tree
child node so the fwnode stored in the persistent board info remains
valid. i2c_new_client_device() later takes its own reference for the
client, and client teardown only releases that reference. The original
board-info reference is therefore leaked for every DT-described I2C
device. Registration failures after bus population leak it as well.

Register the board-info node reference as a managed resource of the I3C
master. This retains it for the full board-info lifetime and releases it
on both registration failure and normal master teardown.

This issue was found by a static analysis checker and confirmed by
manual source review.

Fixes: 3a379bbcea0af ("i3c: Add core I3C infrastructure")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/i3c/master.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index f1be38a640ca1..8063e2642cbda 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2619,6 +2619,11 @@ EXPORT_SYMBOL_GPL(i3c_master_do_daa);
 
 #define OF_I3C_REG1_IS_I2C_DEV			BIT(31)
 
+static void of_i3c_master_put_node(void *data)
+{
+	of_node_put(data);
+}
+
 static int
 of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
 				struct device_node *node, u32 *reg)
@@ -2648,8 +2653,12 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
 	/* LVR is encoded in reg[2]. */
 	boardinfo->lvr = reg[2];
 
+	ret = devm_add_action_or_reset(dev, of_i3c_master_put_node,
+				       of_node_get(node));
+	if (ret)
+		return ret;
+
 	list_add_tail(&boardinfo->node, &master->boardinfo.i2c);
-	of_node_get(node);
 
 	return 0;
 }
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
